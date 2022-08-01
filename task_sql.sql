/*CREATE TABLE Author (
	Author_ID VARCHAR(255) PRIMARY KEY,
	Author_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Publisher (
	Publisher_ID VARCHAR(255) PRIMARY KEY,
	Publisher_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Shipping_type(
	Shipping_type VARCHAR(255) PRIMARY KEY,
	Shipping_price int NOT NULL
);

CREATE TABLE Credit_card_details (
	Credit_card_number VARCHAR(255) PRIMARY KEY,
	Credit_card_type VARCHAR(255) NOT NULL,
	Expiry_date date NOT NULL
);*/

/*CREATE TABLE Books (
	Book_id VARCHAR(255) PRIMARY KEY,
	Book_Name VARCHAR(255) NOT NULL,
	Author_ID VARCHAR(255) FOREIGN KEY REFERENCES Author(Author_ID),
	Price int NOT NULL,
	Publisher_ID VARCHAR(255) FOREIGN KEY REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE Customer (
	Customer_ID VARCHAR(255) PRIMARY KEY,
	Customer_Name VARCHAR(255) NOT NULL,
	Street_address VARCHAR(255) NOT NULL,
	City VARCHAR(255) NOT NULL,
	Phone_number VARCHAR(255) NOT NULL,
	Credit_card_number VARCHAR(255) FOREIGN KEY REFERENCES Credit_card_details(Credit_card_number)
);

CREATE TABLE Shopping_Cart (
	Shopping_cart_id int PRIMARY KEY,
	Book_id VARCHAR(255) NOT NULL,
	Price int NOT NULL,
	Date date NOT NULL,
	Quantity int NOT NULL
);

ALTER TABLE Shopping_Cart
ADD FOREIGN KEY (Book_id) REFERENCES Books(Book_id);

CREATE TABLE Order_And_Details (
	Order_id int PRIMARY KEY,
	Customer_ID VARCHAR(255) FOREIGN KEY REFERENCES Customer(Customer_ID),
	Shipping_type VARCHAR(255) FOREIGN KEY REFERENCES Shipping_type(Shipping_type),
	Date_of_purchase date NOT NULL,
	Shopping_cart_id int FOREIGN KEY REFERENCES Shopping_Cart(Shopping_cart_id)
);

CREATE TABLE Purchase_History (
	Customer_ID VARCHAR(255) FOREIGN KEY REFERENCES Customer(Customer_ID),
	Order_id int FOREIGN KEY REFERENCES Order_And_Details(Order_id)
);*/