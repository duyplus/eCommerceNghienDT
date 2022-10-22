USE master
GO

CREATE DATABASE eCommerceNghienDT
GO

USE eCommerceNghienDT
GO

CREATE TABLE Authorities (
    id int identity(1,1) not null,
    user_id int not null,
    role_id nvarchar(4) not null,
    CONSTRAINT PK_Authorities PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Users (
	id int identity(1,1) not null,
	username varchar(50) not null,
	password varchar(255) not null,
	phone varchar(15) not null,
	fullname nvarchar(255) not null,
	birthday date not null,
	email varchar(255) not null,
	address nvarchar(max) not null,
	image nvarchar(255) null,
	created_at datetime not null,
	updated_at datetime not null,
	token varchar(50) null,
	CONSTRAINT PK_Users PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Roles (
	id nvarchar(4) not null,
	name nvarchar(50) not null,
	CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Products (
	id int identity(1,1) not null,
	name nvarchar(255) not null,
	price float not null,
	discount int not null,
	available bit not null,
	description nvarchar(max) not null,
	image nvarchar(255) not null,
	created_at datetime not null,
	updated_at datetime not null,
	user_id int not null,
	category_id int not null,
	company_id int not null,
	CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Categories (
    id int identity(1,1) not null,
    name nvarchar(255) not null,
    image nvarchar(255) not null,
    CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE Companies (
    id int identity(1,1) not null,
    name nvarchar(255) not null,
    logo nvarchar(255) not null,
    CONSTRAINT PK_Companies PRIMARY KEY CLUSTERED (id)
);
GO
GO

CREATE TABLE Orders (
	id int identity(1,1) not null,
	status bit not null,
	created_at datetime not null,
	updated_at datetime not null,
	user_id int not null,
	CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE OrderDetails (
	id int identity(1,1) not null,
	price float not null,
	quantity int not null,
	order_id int not null,
	product_id int not null,
	CONSTRAINT PK_OrderDetails PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Reviews (
	id int identity(1,1) not null,
	content nvarchar(max) null,
	mark int not null,
	image nvarchar(255),
	created_at datetime not null,
	orderdetail_id int not null,
	CONSTRAINT PK_Reviews PRIMARY KEY CLUSTERED (id)
);
GO

CREATE TABLE Setting (
    id int identity(1,1) not null,
    unit nvarchar(255) not null,
    address nvarchar(255) not null,
    fax varchar(20) not null,
    hotline varchar(20) not null,
    email varchar(55) not null,
    facebook nvarchar(255) not null,
    instagram nvarchar(255) not null,
    zalo nvarchar(255) not null,
    CONSTRAINT PK_Setting PRIMARY KEY CLUSTERED (id)
);
GO

SET IDENTITY_INSERT Setting ON
INSERT INTO Setting (id, unit, address, fax, hotline, email, facebook, instagram, zalo) VALUES (1, 'Skyndu', '123 Hihi', '014 725 8369', '360 217 9493', 'skyndu@dev.vn', 'Skyndu', 'Skyndu', '1079650095');
SET IDENTITY_INSERT Setting OFF

SET IDENTITY_INSERT Users ON
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (1, 'admin', '5263942068', '123', 'Dori Dwine', '1955-10-14', 'ddwine0@npr.org', '443 Glacier Hill Road', 'avt.png', '2022-01-06', '2021-10-18', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (2, 'staff', '2568668500', '123', 'Steve Kittiman', '2022-08-24', 'skittiman1@army.mil', '84536 Lyons Parkway', 'avt.png', '2021-11-03', '2022-04-08', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (3, 'cust', '8621753759', '123', 'Leola Tufts', '1930-04-29', 'ltufts2@independent.co.uk', '72707 Pleasure Crossing', 'avt.png', '2022-09-14', '2022-08-01', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (4, 'bondricek3', '9106226310', '1JFMX53Y', 'Brnaby Ondricek', '2013-05-20', 'bondricek3@merriam-webster.com', '32877 Saint Paul Parkway', 'avt.png', '2022-09-25', '2021-10-12', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (5, 'negentan4', '7763459232', 'mazQIIQ', 'Nickola Egentan', '2008-09-10', 'negentan4@mysql.com', '447 Trailsway Center', 'avt.png', '2021-12-10', '2022-03-27', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (6, 'abrandreth5', '7564506674', 'zCwEmxCuqn6', 'Alwyn Brandreth', '1944-12-12', 'abrandreth5@ft.com', '135 Sauthoff Way', 'avt.png', '2022-07-15', '2022-01-30', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (7, 'jpoore6', '4684434379', '6VdsFGk6', 'Johannes Poore', '1953-01-01', 'jpoore6@ifeng.com', '03714 Gulseth Hill', 'avt.png', '2021-11-30', '2022-02-12', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (8, 'smaine7', '4794716126', '4EqoOD3tZf', 'Salomon Maine', '1947-11-19', 'smaine7@ehow.com', '23839 4th Parkway', 'avt.png', '2022-09-15', '2022-09-23', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (9, 'gdambrogio8', '4442416947', 'mZZ7kYNGUi', 'Galvan D''Ambrogio', '1943-12-17', 'gdambrogio8@bloomberg.com', '9 Morrow Terrace', 'avt.png', '2022-08-23', '2022-01-05', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (10, 'gkail9', '1877670536', 'KbtCTBN', 'Glenden Kail', '1971-03-08', 'gkail9@behance.net', '4 Blaine Trail', 'avt.png', '2022-09-21', '2021-11-12', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (11, 'gwillsheara', '7217553467', 'N1NykjO2y', 'Giffie Willshear', '1967-12-11', 'gwillsheara@ebay.com', '34671 6th Way', 'avt.png', '2022-06-14', '2021-11-05', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (12, 'kloftb', '3711482338', 'ZtZMpj5', 'Konstanze Loft', '1963-08-12', 'kloftb@google.it', '92818 Esch Parkway', 'avt.png', '2022-06-28', '2022-04-02', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (13, 'otookerc', '5259497277', 'vM6pWJ', 'Olivier Tooker', '1908-05-29', 'otookerc@prnewswire.com', '68 Twin Pines Avenue', 'avt.png', '2021-12-13', '2022-09-19', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (14, 'abartrapd', '1608956479', 'jrv1xHfxxc', 'Alma Bartrap', '1915-06-01', 'abartrapd@blogger.com', '05781 Springview Street', 'avt.png', '2022-04-02', '2022-02-11', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (15, 'kcawtee', '4775910994', '1rYe4GzXz', 'Kissiah Cawte', '1974-07-04', 'kcawtee@yahoo.com', '18 Redwing Terrace', 'avt.png', '2021-10-29', '2022-04-07', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (16, 'bmattiellif', '6882066287', 'TLVWPMnKtjo', 'Brittan Mattielli', '1906-06-03', 'bmattiellif@baidu.com', '441 American Avenue', 'avt.png', '2022-04-14', '2022-08-05', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (17, 'eperottg', '2428804539', 'B0ZOBoP7JhS', 'Ernestus Perott', '1959-08-22', 'eperottg@google.co.jp', '207 Bartelt Pass', 'avt.png', '2022-02-11', '2022-07-12', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (18, 'dsoppith', '6362316037', 'wQcjyzM', 'Derrick Soppit', '1998-10-07', 'dsoppith@washingtonpost.com', '83 Manley Crossing', 'avt.png', '2022-05-26', '2022-05-21', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (19, 'gbartalonii', '2496782743', 'Cxt1PXhvU', 'Gregoor Bartaloni', '1993-03-05', 'gbartalonii@goodreads.com', '11 Garrison Terrace', 'avt.png', '2021-12-26', '2021-10-26', null);
INSERT INTO Users (id, username, phone, password, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (20, 'gbelisonj', '9066819835', 'Q9FA64H0MkjU', 'Gerek Belison', '1967-01-13', 'gbelisonj@ifeng.com', '685 Randy Court', 'avt.png', '2022-01-12', '2022-05-17', null);
SET IDENTITY_INSERT Users OFF

INSERT INTO Roles (id, name) VALUES ('CUST', 'Customers')
INSERT INTO Roles (id, name) VALUES ('DIRE', 'Directors')
INSERT INTO Roles (id, name) VALUES ('STAF', 'Staffs')

SET IDENTITY_INSERT Authorities ON
INSERT INTO Authorities (id, user_id, role_id) VALUES (1, 1, 'DIRE');
INSERT INTO Authorities (id, user_id, role_id) VALUES (2, 2, 'STAF');
INSERT INTO Authorities (id, user_id, role_id) VALUES (3, 3, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (4, 4, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (5, 5, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (6, 6, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (7, 7, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (8, 8, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (9, 9, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (10, 10, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (11, 11, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (12, 12, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (13, 13, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (14, 14, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (15, 15, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (16, 16, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (17, 17, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (18, 18, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (19, 19, 'CUST');
INSERT INTO Authorities (id, user_id, role_id) VALUES (20, 20, 'CUST');
SET IDENTITY_INSERT Authorities OFF
GO

/* Authorities */
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesUsers FOREIGN KEY (user_id)
REFERENCES Users(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesRoles FOREIGN KEY (role_id)
REFERENCES Roles(id) ON UPDATE CASCADE;
/* Products */
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsUsers FOREIGN KEY (user_id)
REFERENCES Users(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsCategories FOREIGN KEY (category_id)
REFERENCES Categories(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Products WITH CHECK ADD  CONSTRAINT FK_CateatcompanyCompanies FOREIGN KEY (company_id)
REFERENCES Companies(id) ON UPDATE CASCADE ON DELETE CASCADE;
/* Orders */
ALTER TABLE Orders WITH CHECK ADD CONSTRAINT FK_OrdersUsers FOREIGN KEY (user_id)
REFERENCES Users(id) ON UPDATE CASCADE ON DELETE CASCADE;
/* OrderDetails */
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsOrders FOREIGN KEY (order_id)
REFERENCES Orders(id) ON UPDATE NO ACTION;
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsProducts FOREIGN KEY (product_id)
REFERENCES Products(id) ON UPDATE NO ACTION;
/* Reviews */
ALTER TABLE Reviews WITH CHECK ADD CONSTRAINT FK_ReviewsOrderDetails FOREIGN KEY (orderdetail_id)
REFERENCES OrderDetails(id) ON DELETE NO ACTION;
