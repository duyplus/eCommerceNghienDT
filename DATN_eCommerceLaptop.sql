USE master
GO

CREATE DATABASE eCommerceLaptop
GO

USE eCommerceLaptop
GO

CREATE TABLE Contact (
	Id INT IDENTITY(1,1) NOT NULL,
	Unit NVARCHAR(255) NOT NULL,
	Address NVARCHAR(255) NOT NULL,
	Fax VARCHAR(20) NOT NULL,
	Hotline VARCHAR(20) NOT NULL,
	Email VARCHAR(55) NOT NULL,
	Facebook NVARCHAR(255) NOT NULL,
	Instagram NVARCHAR(255) NOT NULL,
	Zalo NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_Contact PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Users (
	Username VARCHAR(50) NOT NULL,
	Password VARCHAR(255) NOT NULL,
	Phone VARCHAR(15) NOT NULL,
	Fullname NVARCHAR(255) NOT NULL,
	Birthday DATE NOT NULL,
	Email VARCHAR(255) NOT NULL,
	Address NVARCHAR(MAX) NOT NULL,
	Image NVARCHAR(255) NULL,
	CreatedAt DATETIME NOT NULL,
	UpdatedAt DATETIME NOT NULL,
	Token VARCHAR(50) NULL,
	CONSTRAINT PK_Users PRIMARY KEY CLUSTERED (Username)
);
GO

CREATE TABLE Roles (
	Id NVARCHAR(4) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Authorities (
	Id INT IDENTITY(1,1) NOT NULL,
	UserId VARCHAR(50) NOT NULL,
	RoleId NVARCHAR(4) NOT NULL,
	CONSTRAINT PK_Authorities PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Companies (
	Id INT IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Logo NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_Companies PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Categories (
	Id INT IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Image NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Products (
	Id INT IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(255) NOT NULL,
	Price FLOAT NOT NULL,
	Discount INT NOT NULL,
	Available BIT NOT NULL,
	Description NVARCHAR(MAX) NOT NULL,
	Image NVARCHAR(255) NOT NULL,
	CreatedAt DATETIME NOT NULL,
	UpdatedAt DATETIME NOT NULL,
	UserId VARCHAR(50) NOT NULL,
	CategoryId INT NOT NULL,
	CompanyId INT NOT NULL,
	CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Orders (
	Id INT IDENTITY(1,1) NOT NULL,
	Status BIT NOT NULL,
	CreatedAt DATETIME NOT NULL,
	UpdatedAt DATETIME NOT NULL,
	UserId VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE OrderDetails (
	Id INT IDENTITY(1,1) NOT NULL,
	Price FLOAT NOT NULL,
	Quantity INT NOT NULL,
	OrderId INT NOT NULL,
	ProductId INT NOT NULL,
	CONSTRAINT PK_OrderDetail PRIMARY KEY CLUSTERED (Id)
);
GO

CREATE TABLE Reviews (
	Id INT IDENTITY(1,1) NOT NULL,
	Content NVARCHAR(MAX) NULL,
	Mark INT NOT NULL,
	Image NVARCHAR(255),
	CreatedAt DATETIME NOT NULL,
	OrderDetailId INT NOT NULL,
	CONSTRAINT PK_Reviews PRIMARY KEY CLUSTERED (Id)
);
GO

SET IDENTITY_INSERT Contact ON
INSERT INTO Contact (Id, Unit, Address, Fax, Hotline, Email, Facebook, Instagram, Zalo) VALUES (1, 'Skyndu', '123 Hihi', '014 725 8369', '360 217 9493', 'skyndu@dev.vn', 'Skyndu', 'Skyndu', '1079650095');
SET IDENTITY_INSERT Contact OFF

insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('admin', '5263942068', '123', 'Dori Dwine', '1955-10-14', 'ddwine0@npr.org', '443 Glacier Hill Road', 'avt.png', '2022-01-06', '2021-10-18', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('staff', '2568668500', '123', 'Steve Kittiman', '2022-08-24', 'skittiman1@army.mil', '84536 Lyons Parkway', 'avt.png', '2021-11-03', '2022-04-08', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('cust', '8621753759', '123', 'Leola Tufts', '1930-04-29', 'ltufts2@independent.co.uk', '72707 Pleasure Crossing', 'avt.png', '2022-09-14', '2022-08-01', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('bondricek3', '9106226310', '1JFMX53Y', 'Brnaby Ondricek', '2013-05-20', 'bondricek3@merriam-webster.com', '32877 Saint Paul Parkway', 'avt.png', '2022-09-25', '2021-10-12', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('negentan4', '7763459232', 'mazQIIQ', 'Nickola Egentan', '2008-09-10', 'negentan4@mysql.com', '447 Trailsway Center', 'avt.png', '2021-12-10', '2022-03-27', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('abrandreth5', '7564506674', 'zCwEmxCuqn6', 'Alwyn Brandreth', '1944-12-12', 'abrandreth5@ft.com', '135 Sauthoff Way', 'avt.png', '2022-07-15', '2022-01-30', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('jpoore6', '4684434379', '6VdsFGk6', 'Johannes Poore', '1953-01-01', 'jpoore6@ifeng.com', '03714 Gulseth Hill', 'avt.png', '2021-11-30', '2022-02-12', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('smaine7', '4794716126', '4EqoOD3tZf', 'Salomon Maine', '1947-11-19', 'smaine7@ehow.com', '23839 4th Parkway', 'avt.png', '2022-09-15', '2022-09-23', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('gdambrogio8', '4442416947', 'mZZ7kYNGUi', 'Galvan D''Ambrogio', '1943-12-17', 'gdambrogio8@bloomberg.com', '9 Morrow Terrace', 'avt.png', '2022-08-23', '2022-01-05', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('gkail9', '1877670536', 'KbtCTBN', 'Glenden Kail', '1971-03-08', 'gkail9@behance.net', '4 Blaine Trail', 'avt.png', '2022-09-21', '2021-11-12', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('gwillsheara', '7217553467', 'N1NykjO2y', 'Giffie Willshear', '1967-12-11', 'gwillsheara@ebay.com', '34671 6th Way', 'avt.png', '2022-06-14', '2021-11-05', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('kloftb', '3711482338', 'ZtZMpj5', 'Konstanze Loft', '1963-08-12', 'kloftb@google.it', '92818 Esch Parkway', 'avt.png', '2022-06-28', '2022-04-02', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('otookerc', '5259497277', 'vM6pWJ', 'Olivier Tooker', '1908-05-29', 'otookerc@prnewswire.com', '68 Twin Pines Avenue', 'avt.png', '2021-12-13', '2022-09-19', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('abartrapd', '1608956479', 'jrv1xHfxxc', 'Alma Bartrap', '1915-06-01', 'abartrapd@blogger.com', '05781 Springview Street', 'avt.png', '2022-04-02', '2022-02-11', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('kcawtee', '4775910994', '1rYe4GzXz', 'Kissiah Cawte', '1974-07-04', 'kcawtee@yahoo.com', '18 Redwing Terrace', 'avt.png', '2021-10-29', '2022-04-07', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('bmattiellif', '6882066287', 'TLVWPMnKtjo', 'Brittan Mattielli', '1906-06-03', 'bmattiellif@baidu.com', '441 American Avenue', 'avt.png', '2022-04-14', '2022-08-05', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('eperottg', '2428804539', 'B0ZOBoP7JhS', 'Ernestus Perott', '1959-08-22', 'eperottg@google.co.jp', '207 Bartelt Pass', 'avt.png', '2022-02-11', '2022-07-12', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('dsoppith', '6362316037', 'wQcjyzM', 'Derrick Soppit', '1998-10-07', 'dsoppith@washingtonpost.com', '83 Manley Crossing', 'avt.png', '2022-05-26', '2022-05-21', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('gbartalonii', '2496782743', 'Cxt1PXhvU', 'Gregoor Bartaloni', '1993-03-05', 'gbartalonii@goodreads.com', '11 Garrison Terrace', 'avt.png', '2021-12-26', '2021-10-26', null);
insert into Users (Username, Phone, Password, Fullname, Birthday, Email, Address, Image, CreatedAt, UpdatedAt, Token) values ('gbelisonj', '9066819835', 'Q9FA64H0MkjU', 'Gerek Belison', '1967-01-13', 'gbelisonj@ifeng.com', '685 Randy Court', 'avt.png', '2022-01-12', '2022-05-17', null);

INSERT INTO Roles (Id, Name) VALUES (N'CUST', N'Customers')
INSERT INTO Roles (Id, Name) VALUES (N'DIRE', N'Directors')
INSERT INTO Roles (Id, Name) VALUES (N'STAF', N'Staffs')

SET IDENTITY_INSERT Authorities ON
insert into Authorities (Id, UserId, RoleId) values (1, 'admin', 'DIRE');
insert into Authorities (Id, UserId, RoleId) values (2, 'staff', 'STAF');
insert into Authorities (Id, UserId, RoleId) values (3, 'cust', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (4, 'bondricek3', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (5, 'negentan4', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (6, 'abrandreth5', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (7, 'jpoore6', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (8, 'smaine7', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (9, 'gdambrogio8', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (10, 'gkail9', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (11, 'gwillsheara', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (12, 'kloftb', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (13, 'otookerc', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (14, 'abartrapd', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (15, 'kcawtee', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (16, 'bmattiellif', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (17, 'eperottg', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (18, 'dsoppith', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (19, 'gbartalonii', 'CUST');
insert into Authorities (Id, UserId, RoleId) values (20, 'gbelisonj', 'CUST');
SET IDENTITY_INSERT Authorities OFF

GO

/* Authorities */
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesUsers FOREIGN KEY (UserId)
REFERENCES Users(Username) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesRoles FOREIGN KEY (RoleId)
REFERENCES Roles(Id) ON UPDATE CASCADE;
/* Products */
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsUsers FOREIGN KEY (UserId)
REFERENCES Users(Username) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsCategories FOREIGN KEY (CategoryId)
REFERENCES Categories(Id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Products WITH CHECK ADD  CONSTRAINT FK_CateatcompanyCompanies FOREIGN KEY (CompanyId)
REFERENCES Companies(Id) ON UPDATE CASCADE ON DELETE CASCADE;
/* Orders */
ALTER TABLE Orders WITH CHECK ADD CONSTRAINT FK_OrdersUsers FOREIGN KEY (UserId)
REFERENCES Users(Username) ON UPDATE CASCADE ON DELETE CASCADE;
/* OrderDetails */
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsOrders FOREIGN KEY (OrderId)
REFERENCES Orders(Id) ON UPDATE NO ACTION;
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsProducts FOREIGN KEY (ProductId)
REFERENCES Products(Id) ON UPDATE NO ACTION;
/* Reviews */
ALTER TABLE Reviews WITH CHECK ADD CONSTRAINT FK_ReviewsOrderDetails FOREIGN KEY (OrderDetailId)
REFERENCES OrderDetails(Id) ON DELETE NO ACTION;