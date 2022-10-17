USE master
GO

CREATE DATABASE eCommerceNghienDT
GO

USE eCommerceNghienDT
GO

CREATE TABLE Authorities (
    id INT idENTITY(1,1) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    role_id NVARCHAR(4) NOT NULL,
    CONSTRAINT PK_Authorities PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Users (
	username VARCHAR(50) NOT NULL,
	password VARCHAR(255) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	fullname NVARCHAR(255) NOT NULL,
	birthday DATE NOT NULL,
	email VARCHAR(255) NOT NULL,
	address NVARCHAR(MAX) NOT NULL,
	image NVARCHAR(255) NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	token VARCHAR(50) NULL,
	CONSTRAINT PK_Users PRIMARY KEY CLUSTERED (username)
);
GO

CREATE TABLE Roles (
	id NVARCHAR(4) NOT NULL,
	name NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Products (
	id INT idENTITY(1,1) NOT NULL,
	name NVARCHAR(255) NOT NULL,
	price FLOAT NOT NULL,
	discount INT NOT NULL,
	available BIT NOT NULL,
	description NVARCHAR(MAX) NOT NULL,
	image NVARCHAR(255) NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	user_id VARCHAR(50) NOT NULL,
	category_id INT NOT NULL,
	company_id INT NOT NULL,
	CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Categories (
    id INT idENTITY(1,1) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    image NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE Companies (
    id INT idENTITY(1,1) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    logo NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Companies PRIMARY KEY CLUSTERED (id)
);
GO
GO

CREATE TABLE Orders (
	id INT idENTITY(1,1) NOT NULL,
	status BIT NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	user_id VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE OrderDetails (
	id INT idENTITY(1,1) NOT NULL,
	price FLOAT NOT NULL,
	quantity INT NOT NULL,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	CONSTRAINT PK_OrderDetail PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Reviews (
	id INT idENTITY(1,1) NOT NULL,
	content NVARCHAR(MAX) NULL,
	mark INT NOT NULL,
	image NVARCHAR(255),
	created_at DATE NOT NULL,
	orderdetail_id INT NOT NULL,
	CONSTRAINT PK_Reviews PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Contact (
    id INT idENTITY(1,1) NOT NULL,
    unit NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    fax VARCHAR(20) NOT NULL,
    hotline VARCHAR(20) NOT NULL,
    email VARCHAR(55) NOT NULL,
    facebook NVARCHAR(255) NOT NULL,
    instagram NVARCHAR(255) NOT NULL,
    zalo NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Contact PRIMARY KEY CLUSTERED (id)
);
GO

SET idENTITY_INSERT Contact ON
INSERT INTO Contact (id, Unit, Address, Fax, Hotline, Email, Facebook, Instagram, Zalo) VALUES (1, 'Skyndu', '123 Hihi', '014 725 8369', '360 217 9493', 'skyndu@dev.vn', 'Skyndu', 'Skyndu', '1079650095');
SET idENTITY_INSERT Contact OFF

INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('admin', '5263942068', '123', 'Dori Dwine', '1955-10-14', 'ddwine0@npr.org', '443 Glacier Hill Road', 'avt.png', '2022-01-06', '2021-10-18', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('staff', '2568668500', '123', 'Steve Kittiman', '2022-08-24', 'skittiman1@army.mil', '84536 Lyons Parkway', 'avt.png', '2021-11-03', '2022-04-08', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('cust', '8621753759', '123', 'Leola Tufts', '1930-04-29', 'ltufts2@independent.co.uk', '72707 Pleasure Crossing', 'avt.png', '2022-09-14', '2022-08-01', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('bondricek3', '9106226310', '1JFMX53Y', 'Brnaby Ondricek', '2013-05-20', 'bondricek3@merriam-webster.com', '32877 Saint Paul Parkway', 'avt.png', '2022-09-25', '2021-10-12', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('negentan4', '7763459232', 'mazQIIQ', 'Nickola Egentan', '2008-09-10', 'negentan4@mysql.com', '447 Trailsway Center', 'avt.png', '2021-12-10', '2022-03-27', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('abrandreth5', '7564506674', 'zCwEmxCuqn6', 'Alwyn Brandreth', '1944-12-12', 'abrandreth5@ft.com', '135 Sauthoff Way', 'avt.png', '2022-07-15', '2022-01-30', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('jpoore6', '4684434379', '6VdsFGk6', 'Johannes Poore', '1953-01-01', 'jpoore6@ifeng.com', '03714 Gulseth Hill', 'avt.png', '2021-11-30', '2022-02-12', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('smaine7', '4794716126', '4EqoOD3tZf', 'Salomon Maine', '1947-11-19', 'smaine7@ehow.com', '23839 4th Parkway', 'avt.png', '2022-09-15', '2022-09-23', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('gdambrogio8', '4442416947', 'mZZ7kYNGUi', 'Galvan D''Ambrogio', '1943-12-17', 'gdambrogio8@bloomberg.com', '9 Morrow Terrace', 'avt.png', '2022-08-23', '2022-01-05', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('gkail9', '1877670536', 'KbtCTBN', 'Glenden Kail', '1971-03-08', 'gkail9@behance.net', '4 Blaine Trail', 'avt.png', '2022-09-21', '2021-11-12', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('gwillsheara', '7217553467', 'N1NykjO2y', 'Giffie Willshear', '1967-12-11', 'gwillsheara@ebay.com', '34671 6th Way', 'avt.png', '2022-06-14', '2021-11-05', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('kloftb', '3711482338', 'ZtZMpj5', 'Konstanze Loft', '1963-08-12', 'kloftb@google.it', '92818 Esch Parkway', 'avt.png', '2022-06-28', '2022-04-02', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('otookerc', '5259497277', 'vM6pWJ', 'Olivier Tooker', '1908-05-29', 'otookerc@prnewswire.com', '68 Twin Pines Avenue', 'avt.png', '2021-12-13', '2022-09-19', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('abartrapd', '1608956479', 'jrv1xHfxxc', 'Alma Bartrap', '1915-06-01', 'abartrapd@blogger.com', '05781 Springview Street', 'avt.png', '2022-04-02', '2022-02-11', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('kcawtee', '4775910994', '1rYe4GzXz', 'Kissiah Cawte', '1974-07-04', 'kcawtee@yahoo.com', '18 Redwing Terrace', 'avt.png', '2021-10-29', '2022-04-07', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('bmattiellif', '6882066287', 'TLVWPMnKtjo', 'Brittan Mattielli', '1906-06-03', 'bmattiellif@baidu.com', '441 American Avenue', 'avt.png', '2022-04-14', '2022-08-05', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('eperottg', '2428804539', 'B0ZOBoP7JhS', 'Ernestus Perott', '1959-08-22', 'eperottg@google.co.jp', '207 Bartelt Pass', 'avt.png', '2022-02-11', '2022-07-12', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('dsoppith', '6362316037', 'wQcjyzM', 'Derrick Soppit', '1998-10-07', 'dsoppith@washingtonpost.com', '83 Manley Crossing', 'avt.png', '2022-05-26', '2022-05-21', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('gbartalonii', '2496782743', 'Cxt1PXhvU', 'Gregoor Bartaloni', '1993-03-05', 'gbartalonii@goodreads.com', '11 Garrison Terrace', 'avt.png', '2021-12-26', '2021-10-26', null);
INSERT INTO Users (username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES ('gbelisonj', '9066819835', 'Q9FA64H0MkjU', 'Gerek Belison', '1967-01-13', 'gbelisonj@ifeng.com', '685 Randy Court', 'avt.png', '2022-01-12', '2022-05-17', null);

INSERT INTO Roles (id, name) VALUES ('CUST', 'Customers')
INSERT INTO Roles (id, name) VALUES ('DIRE', 'Directors')
INSERT INTO Roles (id, name) VALUES ('STAF', 'Staffs')

SET idENTITY_INSERT Authorities ON
INSERT INTO Authorities (id, user_id, role_id) VALUES (1, 'admin', 'DIRE');
INSERT INTO Authorities (id, user_id, role_id) VALUES (2, 'staff', 'STAF');
INSERT INTO Authorities (id, user_id, role_id) VALUES (3, 'cust', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (4, 'bondricek3', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (5, 'negentan4', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (6, 'abrandreth5', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (7, 'jpoore6', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (8, 'smaine7', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (9, 'gdambrogio8', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (10, 'gkail9', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (11, 'gwillsheara', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (12, 'kloftb', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (13, 'otookerc', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (14, 'abartrapd', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (15, 'kcawtee', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (16, 'bmattiellif', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (17, 'eperottg', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (18, 'dsoppith', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (19, 'gbartalonii', 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (20, 'gbelisonj', 'CUST');
SET idENTITY_INSERT Authorities OFF

GO

/* Authorities */
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesUsers FOREIGN KEY (user_id)
REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesRoles FOREIGN KEY (role_id)
REFERENCES Roles(id) ON UPDATE CASCADE;
/* Products */
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsUsers FOREIGN KEY (user_id)
REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsCategories FOREIGN KEY (category_id)
REFERENCES Categories(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Products WITH CHECK ADD  CONSTRAINT FK_CateatcompanyCompanies FOREIGN KEY (company_id)
REFERENCES Companies(id) ON UPDATE CASCADE ON DELETE CASCADE;
/* Orders */
ALTER TABLE Orders WITH CHECK ADD CONSTRAINT FK_OrdersUsers FOREIGN KEY (user_id)
REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE;
/* OrderDetails */
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsOrders FOREIGN KEY (order_id)
REFERENCES Orders(id) ON UPDATE NO ACTION;
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsProducts FOREIGN KEY (product_id)
REFERENCES Products(id) ON UPDATE NO ACTION;
/* Reviews */
ALTER TABLE Reviews WITH CHECK ADD CONSTRAINT FK_ReviewsOrderDetails FOREIGN KEY (orderdetail_id)
REFERENCES OrderDetails(id) ON DELETE NO ACTION;
