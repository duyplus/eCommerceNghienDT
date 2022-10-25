USE master
GO

ALTER DATABASE eCommerceNghienDT SET single_user WITH ROLLBACK immediate
GO

DROP DATABASE eCommerceNghienDT
GO

CREATE DATABASE eCommerceNghienDT
GO

USE eCommerceNghienDT
GO

CREATE TABLE Authorities (
	id int IDENTITY(1,1) NOT NULL,
	user_id int NOT NULL,
	role_id nvarchar(4) NOT NULL,
	CONSTRAINT PK_Authorities PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Categories (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) NOT NULL,
	image nvarchar(255) NOT NULL,
	CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Companies (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) NOT NULL,
	logo nvarchar(255) NOT NULL,
	CONSTRAINT PK_Companies PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE OrderDetails (
	id int IDENTITY(1,1) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	order_id int NOT NULL,
	product_id int NOT NULL,
	CONSTRAINT PK_OrderDetails PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Orders (
	id int IDENTITY(1,1) NOT NULL,
	status bit NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Products (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	discount int NULL,
	available bit NOT NULL,
	description nvarchar(max) NOT NULL,
	image nvarchar(255) NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	user_id int NOT NULL,
	category_id int NOT NULL,
	company_id int NOT NULL,
	CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Reviews (
	id int IDENTITY(1,1) NOT NULL,
	content nvarchar(max) NULL,
	mark int NOT NULL,
	image nvarchar(255) NULL,
	created_at datetime NOT NULL,
	orderdetail_id int NOT NULL,
	CONSTRAINT PK_Reviews PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Roles (
	id nvarchar(4) NOT NULL,
	name nvarchar(50) NOT NULL,
	CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Settings (
	id int IDENTITY(1,1) NOT NULL,
	unit nvarchar(255) NOT NULL,
	address nvarchar(max) NOT NULL,
	hotline varchar(20) NOT NULL,
	email varchar(55) NOT NULL,
	facebook nvarchar(255) NOT NULL,
	instagram nvarchar(255) NOT NULL,
	zalo nvarchar(255) NOT NULL,
	CONSTRAINT PK_Settings PRIMARY KEY CLUSTERED (id)
)
GO

CREATE TABLE Users (
	id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password varchar(255) NOT NULL,
	phone varchar(15) NOT NULL,
	fullname nvarchar(255) NOT NULL,
	birthday date NOT NULL,
	email varchar(255) NOT NULL,
	address nvarchar(max) NOT NULL,
	image nvarchar(255) NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	token varchar(50) NULL,
	CONSTRAINT PK_Users PRIMARY KEY CLUSTERED (id)
)
GO

SET IDENTITY_INSERT Products ON
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (1, N'MSI Laptop', 2, 7, 0, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', N'anh3.png', CAST(N'2022-10-23 18:17:22.000' AS DateTime), CAST(N'2023-02-12 08:15:45.000' AS DateTime), 14, 4, 7)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (2, N'Lenovo Laptop', 5, 8, 0, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', N'anh3.png', CAST(N'2022-09-15 21:09:23.000' AS DateTime), CAST(N'2022-12-23 07:25:23.000' AS DateTime), 11, 3, 6)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (3, N'MSI Laptop', 1, 3, 5, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', N'anh2.png', CAST(N'2023-03-27 18:20:54.000' AS DateTime), CAST(N'2022-02-13 22:21:07.000' AS DateTime), 14, 2, 14)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (4, N'Laptop Aser', 6, 2, 10, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', N'anh1.png', CAST(N'2023-03-11 11:43:54.000' AS DateTime), CAST(N'2022-10-10 20:29:33.000' AS DateTime), 18, 1, 11)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (5, N'HP Laptop', 9, 2, 10, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', N'anh2.png', CAST(N'2023-07-07 18:37:33.000' AS DateTime), CAST(N'2023-04-24 12:08:43.000' AS DateTime), 6, 3, 4)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (6, N'Laptop Aser', 7, 9, 20, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', N'anh3.png', CAST(N'2022-12-24 13:57:02.000' AS DateTime), CAST(N'2022-06-01 09:07:54.000' AS DateTime), 15, 2, 14)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (7, N'Aser Laptop', 1, 5, 20, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', N'anh4.png', CAST(N'2022-11-22 19:35:17.000' AS DateTime), CAST(N'2021-12-28 04:47:47.000' AS DateTime), 8, 3, 7)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (8, N'Lenovo Laptop', 5, 3, 18, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', N'anh1.png', CAST(N'2022-09-14 02:28:31.000' AS DateTime), CAST(N'2021-11-17 14:07:53.000' AS DateTime), 9, 3, 3)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (9, N'Laptop Macbook', 7, 1, 15, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', N'anh4.png', CAST(N'2022-06-10 19:22:30.000' AS DateTime), CAST(N'2022-10-25 00:17:36.000' AS DateTime), 13, 2, 7)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (10, N'Laptop Lenovo', 7, 9, 15, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', N'anh2.png', CAST(N'2022-06-15 04:36:41.000' AS DateTime), CAST(N'2023-08-16 15:04:54.000' AS DateTime), 11, 4, 7)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (11, N'Điện thoại Iphone', 1, 8, 0, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', N'anh3.png,', CAST(N'2022-09-11 05:37:44.000' AS DateTime), CAST(N'2022-12-23 20:01:22.000' AS DateTime), 2, 2, 17)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (12, N'Điện thoại Xiaomi', 6, 0, 10, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', N'anh3.png,', CAST(N'2022-07-04 00:09:36.000' AS DateTime), CAST(N'2022-04-03 18:13:15.000' AS DateTime), 3, 3, 9)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (13, N'Điện thoại Huawei', 4, 3, 5, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', N'anh1.png,', CAST(N'2023-10-19 19:13:55.000' AS DateTime), CAST(N'2023-10-06 23:35:18.000' AS DateTime), 14, 2, 11)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (14, N'Điện thoại Oppo', 9, 2, 5, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', N'anh1.png,', CAST(N'2022-04-30 21:24:49.000' AS DateTime), CAST(N'2023-05-05 13:06:35.000' AS DateTime), 17, 2, 10)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (15, N'Điện thoại Oppo', 1, 1, 5, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', N'anh2.png,', CAST(N'2022-05-23 02:56:55.000' AS DateTime), CAST(N'2022-01-31 02:39:54.000' AS DateTime), 11, 2, 17)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (16, N'Điện thoại Xiaomi', 8, 8, 0, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', N'anh4.png,', CAST(N'2023-07-04 09:42:16.000' AS DateTime), CAST(N'2022-04-28 13:51:26.000' AS DateTime), 2, 3, 17)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (17, N'Điện thoại Vivo', 2, 10, 20, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', N'anh3.png,', CAST(N'2022-02-27 17:44:13.000' AS DateTime), CAST(N'2022-05-08 10:25:55.000' AS DateTime), 11, 2, 12)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (18, N'Điện thoại Oppo', 8, 9, 20, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', N'anh3.png,', CAST(N'2023-07-25 01:35:17.000' AS DateTime), CAST(N'2022-10-06 00:52:29.000' AS DateTime), 16, 1, 11)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (19, N'Điện thoại Realme', 6, 1, 32, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', N'anh2.png,', CAST(N'2023-07-06 20:40:12.000' AS DateTime), CAST(N'2023-06-05 15:40:23.000' AS DateTime), 11, 2, 15)
INSERT Products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (20, N'Điện thoại Vivo', 5, 3, 32, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', N'anh2.png,', CAST(N'2022-06-27 18:30:22.000' AS DateTime), CAST(N'2023-05-01 07:27:05.000' AS DateTime), 8, 4, 10)
SET IDENTITY_INSERT Products OFF


SET IDENTITY_INSERT Categories ON
INSERT Categories (id, name, image) VALUES (1, N'Máy tính', N'mt.png')
INSERT Categories (id, name, image) VALUES (2, N'Laptop', N'lt.png')
INSERT Categories (id, name, image) VALUES (3, N'Điện thoại', N'dt.png')
INSERT Categories (id, name, image) VALUES (4, N'Máy tính bảng', N'mtb,png')
SET IDENTITY_INSERT Categories OFF

SET IDENTITY_INSERT Companies ON
INSERT Companies (id, name, logo) VALUES (1, N'Asus', N'asus.png')
INSERT Companies (id, name, logo) VALUES (2, N'Dell', N'dell.png')
INSERT Companies (id, name, logo) VALUES (3, N'MSI', N'msi.png')
INSERT Companies (id, name, logo) VALUES (4, N'Acer', N'acer.png')
INSERT Companies (id, name, logo) VALUES (5, N'Lenovo', N'lonovo.png')
INSERT Companies (id, name, logo) VALUES (6, N'HP', N'hp.png')
INSERT Companies (id, name, logo) VALUES (7, N'Alienware', N'alienware.png')
INSERT Companies (id, name, logo) VALUES (8, N'Samsung', N'samsung.png')
INSERT Companies (id, name, logo) VALUES (9, N'Apple', N'apple.png')
INSERT Companies (id, name, logo) VALUES (10, N'Huawei', N'huawei.png')
INSERT Companies (id, name, logo) VALUES (11, N'Gigabyte', N'gigabyte.png')
INSERT Companies (id, name, logo) VALUES (12, N'LG', N'lg.png')
INSERT Companies (id, name, logo) VALUES (13, N'Xiaomi', N'xiaomi.png')
INSERT Companies (id, name, logo) VALUES (14, N'Vivo', N'vivo.png')
INSERT Companies (id, name, logo) VALUES (15, N'Oppo', N'oppo.png')
INSERT Companies (id, name, logo) VALUES (16, N'Realme', N'realme.png')
INSERT Companies (id, name, logo) VALUES (17, N'Sony', N'sony.png')
SET IDENTITY_INSERT Companies OFF

SET IDENTITY_INSERT Authorities ON
INSERT Authorities (id, user_id, role_id) VALUES (1, 1, N'DIRE')
INSERT Authorities (id, user_id, role_id) VALUES (2, 2, N'STAF')
INSERT Authorities (id, user_id, role_id) VALUES (3, 3, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (4, 4, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (5, 5, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (6, 6, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (7, 7, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (8, 8, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (9, 9, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (10, 10, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (11, 11, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (12, 12, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (13, 13, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (14, 14, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (15, 15, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (16, 16, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (17, 17, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (18, 18, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (19, 19, N'CUST')
INSERT Authorities (id, user_id, role_id) VALUES (20, 20, N'CUST')
SET IDENTITY_INSERT Authorities OFF

INSERT Roles (id, name) VALUES (N'CUST', N'Customers')
INSERT Roles (id, name) VALUES (N'DIRE', N'Directors')
INSERT Roles (id, name) VALUES (N'STAF', N'Staffs')

SET IDENTITY_INSERT Settings ON
INSERT Settings (id, unit, address, hotline, email, facebook, instagram, zalo) VALUES (1, N'NghienDT', N'140A Huỳnh Văn Bánh, Phú Nhuận, HCM', N'01234567890', N'nghienecomm@gmail.com', N'https://www.facebook.com/nghiendt', N'https://www.instagram.com/nghiendt', N'https://zalo.me/0919993715')
SET IDENTITY_INSERT Settings OFF

SET IDENTITY_INSERT Users ON
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (1, N'admin', N'123', N'5263942068', N'Dori Dwine', CAST(N'1955-10-14' AS Date), N'ddwine0@npr.org', N'443 Glacier Hill Road', N'avt.png', CAST(N'2022-01-06 01:00:00.000' AS DateTime), CAST(N'2021-10-18 07:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (2, N'staff', N'123', N'2568668500', N'Steve Kittiman', CAST(N'2022-08-24' AS Date), N'skittiman1@army.mil', N'84536 Lyons Parkway', N'avt.png', CAST(N'2021-11-03 05:00:00.000' AS DateTime), CAST(N'2022-04-08 01:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (3, N'cust', N'123', N'8621753759', N'Leola Tufts', CAST(N'1930-04-29' AS Date), N'ltufts2@independent.co.uk', N'72707 Pleasure Crossing', N'avt.png', CAST(N'2022-09-14 07:00:00.000' AS DateTime), CAST(N'2022-08-01 02:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (4, N'bondricek3', N'1JFMX53Y', N'9106226310', N'Brnaby Ondricek', CAST(N'2013-05-20' AS Date), N'bondricek3@merriam-webster.com', N'32877 Saint Paul Parkway', N'avt.png', CAST(N'2022-09-25 10:00:00.000' AS DateTime), CAST(N'2021-10-12 09:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (5, N'negentan4', N'mazQIIQ', N'7763459232', N'Nickola Egentan', CAST(N'2008-09-10' AS Date), N'negentan4@mysql.com', N'447 Trailsway Center', N'avt.png', CAST(N'2021-12-10 02:00:00.000' AS DateTime), CAST(N'2022-03-27 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (6, N'abrandreth5', N'zCwEmxCuqn6', N'7564506674', N'Alwyn Brandreth', CAST(N'1944-12-12' AS Date), N'abrandreth5@ft.com', N'135 Sauthoff Way', N'avt.png', CAST(N'2022-07-15 05:00:00.000' AS DateTime), CAST(N'2022-01-30 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (7, N'jpoore6', N'6VdsFGk6', N'4684434379', N'Johannes Poore', CAST(N'1953-01-01' AS Date), N'jpoore6@ifeng.com', N'03714 Gulseth Hill', N'avt.png', CAST(N'2021-11-30 07:10:00.000' AS DateTime), CAST(N'2022-02-12 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (8, N'smaine7', N'4EqoOD3tZf', N'4794716126', N'Salomon Maine', CAST(N'1947-11-19' AS Date), N'smaine7@ehow.com', N'23839 4th Parkway', N'avt.png', CAST(N'2022-09-15 12:30:00.000' AS DateTime), CAST(N'2022-09-23 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (9, N'gdambrogio8', N'mZZ7kYNGUi', N'4442416947', N'Galvan D''Ambrogio', CAST(N'1943-12-17' AS Date), N'gdambrogio8@bloomberg.com', N'9 Morrow Terrace', N'avt.png', CAST(N'2022-08-23 00:00:00.000' AS DateTime), CAST(N'2022-01-05 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (10, N'gkail9', N'KbtCTBN', N'1877670536', N'Glenden Kail', CAST(N'1971-03-08' AS Date), N'gkail9@behance.net', N'4 Blaine Trail', N'avt.png', CAST(N'2022-09-21 00:00:00.000' AS DateTime), CAST(N'2021-11-12 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (11, N'gwillsheara', N'N1NykjO2y', N'7217553467', N'Giffie Willshear', CAST(N'1967-12-11' AS Date), N'gwillsheara@ebay.com', N'34671 6th Way', N'avt.png', CAST(N'2022-06-14 00:00:00.000' AS DateTime), CAST(N'2021-11-05 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (12, N'kloftb', N'ZtZMpj5', N'3711482338', N'Konstanze Loft', CAST(N'1963-08-12' AS Date), N'kloftb@google.it', N'92818 Esch Parkway', N'avt.png', CAST(N'2022-06-28 00:00:00.000' AS DateTime), CAST(N'2022-04-02 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (13, N'otookerc', N'vM6pWJ', N'5259497277', N'Olivier Tooker', CAST(N'1908-05-29' AS Date), N'otookerc@prnewswire.com', N'68 Twin Pines Avenue', N'avt.png', CAST(N'2021-12-13 00:00:00.000' AS DateTime), CAST(N'2022-09-19 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (14, N'abartrapd', N'jrv1xHfxxc', N'1608956479', N'Alma Bartrap', CAST(N'1915-06-01' AS Date), N'abartrapd@blogger.com', N'05781 Springview Street', N'avt.png', CAST(N'2022-04-02 00:00:00.000' AS DateTime), CAST(N'2022-02-11 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (15, N'kcawtee', N'1rYe4GzXz', N'4775910994', N'Kissiah Cawte', CAST(N'1974-07-04' AS Date), N'kcawtee@yahoo.com', N'18 Redwing Terrace', N'avt.png', CAST(N'2021-10-29 00:00:00.000' AS DateTime), CAST(N'2022-04-07 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (16, N'bmattiellif', N'TLVWPMnKtjo', N'6882066287', N'Brittan Mattielli', CAST(N'1906-06-03' AS Date), N'bmattiellif@baidu.com', N'441 American Avenue', N'avt.png', CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2022-08-05 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (17, N'eperottg', N'B0ZOBoP7JhS', N'2428804539', N'Ernestus Perott', CAST(N'1959-08-22' AS Date), N'eperottg@google.co.jp', N'207 Bartelt Pass', N'avt.png', CAST(N'2022-02-11 00:00:00.000' AS DateTime), CAST(N'2022-07-12 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (18, N'dsoppith', N'wQcjyzM', N'6362316037', N'Derrick Soppit', CAST(N'1998-10-07' AS Date), N'dsoppith@washingtonpost.com', N'83 Manley Crossing', N'avt.png', CAST(N'2022-05-26 00:00:00.000' AS DateTime), CAST(N'2022-05-21 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (19, N'gbartalonii', N'Cxt1PXhvU', N'2496782743', N'Gregoor Bartaloni', CAST(N'1993-03-05' AS Date), N'gbartalonii@goodreads.com', N'11 Garrison Terrace', N'avt.png', CAST(N'2021-12-26 00:00:00.000' AS DateTime), CAST(N'2021-10-26 00:00:00.000' AS DateTime), NULL)
INSERT Users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (20, N'gbelisonj', N'Q9FA64H0MkjU', N'9066819835', N'Gerek Belison', CAST(N'1967-01-13' AS Date), N'gbelisonj@ifeng.com', N'685 Randy Court', N'avt.png', CAST(N'2022-01-12 00:00:00.000' AS DateTime), CAST(N'2022-05-17 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT Users OFF
GO

/* Authorities */
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesRoles FOREIGN KEY(role_id)
REFERENCES Roles (id) ON UPDATE CASCADE
GO
ALTER TABLE Authorities CHECK CONSTRAINT FK_AuthoritiesRoles
GO
ALTER TABLE Authorities WITH CHECK ADD CONSTRAINT FK_AuthoritiesUsers FOREIGN KEY(user_id)
REFERENCES Users (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE Authorities CHECK CONSTRAINT FK_AuthoritiesUsers
GO

/* OrderDetails */
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsOrders FOREIGN KEY(order_id)
REFERENCES Orders (id) ON UPDATE NO ACTION
GO
ALTER TABLE OrderDetails CHECK CONSTRAINT FK_OrderDetailsOrders
GO
ALTER TABLE OrderDetails WITH CHECK ADD CONSTRAINT FK_OrderDetailsProducts FOREIGN KEY(product_id)
REFERENCES Products (id) ON UPDATE NO ACTION
GO
ALTER TABLE OrderDetails CHECK CONSTRAINT FK_OrderDetailsProducts
GO

/* Orders */
ALTER TABLE Orders WITH CHECK ADD CONSTRAINT FK_OrdersUsers FOREIGN KEY(user_id)
REFERENCES Users (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE Orders CHECK CONSTRAINT FK_OrdersUsers
GO

/* Products */
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_CateatcompanyCompanies FOREIGN KEY(company_id)
REFERENCES Companies (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE Products CHECK CONSTRAINT FK_CateatcompanyCompanies
GO
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsCategories FOREIGN KEY(category_id)
REFERENCES Categories (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE Products CHECK CONSTRAINT FK_ProductsCategories
GO
ALTER TABLE Products WITH CHECK ADD CONSTRAINT FK_ProductsUsers FOREIGN KEY(user_id)
REFERENCES Users (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE Products CHECK CONSTRAINT FK_ProductsUsers
GO

/* Reviews */
ALTER TABLE Reviews WITH CHECK ADD CONSTRAINT FK_ReviewsOrderDetails FOREIGN KEY(orderdetail_id)
REFERENCES OrderDetails (id) ON DELETE NO ACTION
GO
ALTER TABLE Reviews CHECK CONSTRAINT FK_ReviewsOrderDetails
GO

USE master
GO
ALTER DATABASE eCommerceNghienDT SET READ_WRITE 
GO