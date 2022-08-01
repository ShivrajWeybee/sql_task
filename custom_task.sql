CREATE DATABASE sql_task_4_1;

create table module_master (
	module_id varchar(255) primary key,
	module_name varchar(255) not null,
	status varchar(255) not null
);
insert into module_master
values
('m1', 'customer', 'active'),
('m2', 'vendor', 'active'),
('m3', 'courier', 'active');

create table customer (
	customer_id varchar(255) not null unique,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	status varchar(255) not null
);
insert into customer
values
('c1', 'Shivraj', 'Chavda', 'active'),
('c2', 'Darsan', 'Kagathara', 'active'),
('c3', 'Rishit', 'Kalyani', 'active'),
('c4', 'Hardi', 'Govani', 'active'),
('c5', 'Hemangi', 'Nirmal', 'active');

create table vendor (
	vendor_id varchar(255) not null unique,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	status varchar(255) not null
);
insert into vendor
values
('v1', 'Akash', 'Thoriya', 'active'),
('v2', 'Shrey', 'Dhadaniya', 'active'),
('v3', 'Ashok', 'Maru', 'active'),
('v4', 'Priyank', 'ranpara', 'active'),
('v5', 'Fenny', 'Limbdiya', 'active');

create table courier (
	courier_id varchar(255) not null unique,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	status varchar(255) not null
);
insert into courier
values
('co1', 'Dayaram', 'Nayak', 'active'),
('co2', 'Rajesh', 'Goda', 'active'),
('co3', 'Tanvi', 'Dutt', 'active'),
('co4', 'Pranay', 'Chahal', 'active'),
('co5', 'Priya', 'Bail', 'active');

create table sales_order (
	sales_order_id varchar(255) not null unique,
	module_id varchar(255) foreign key references module_master(module_id),
	party_id varchar(255)
);
insert into sales_order
values
(1, 'm1', 'c3'),
(2, 'm1', 'c4'),
(3, 'm2', 'v3'),
(4, 'm3', 'co1'),
(5, 'm3', 'co5');

update sales_order
set party_id = 
(select s.* , 
case 
	when s.module_id = 'm1' then c.first_name+' '+c.last_name
	when s.module_id = 'm2' then v.first_name+' '+v.last_name
	else co.first_name+' '+co.last_name
end
as 'Full Name'
from sales_order s
inner join module_master mm
on s.module_id=mm.module_id
left join customer c
on c.customer_id=s.party_id
left join vendor v
on v.vendor_id=s.party_id
left join courier co
on co.courier_id=s.party_id
)