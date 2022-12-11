USE master
GO
CREATE DATABASE eCommerceNghienDT
GO
USE eCommerceNghienDT
GO
CREATE TABLE categories (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) NOT NULL,
	image nvarchar(255) NULL,
	CONSTRAINT PK_categories PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE companies (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) NOT NULL,
	logo nvarchar(255) NULL,
	CONSTRAINT PK_companies PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE order_details (
	id int IDENTITY(1,1) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	status tinyint NOT NULL,
	order_id int NOT NULL,
	product_id int NOT NULL,
	CONSTRAINT PK_order_details PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE orders (
	id int IDENTITY(1,1) NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT PK_orders PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE products (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(255) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	discount int NULL,
	available bit NOT NULL,
	description nvarchar(max) NOT NULL,
	image nvarchar(255) NOT NULL,
	created_at datetime NULL,
	updated_at datetime NULL,
	user_id int NOT NULL,
	category_id int NOT NULL,
	company_id int NOT NULL,
	CONSTRAINT PK_products PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE reviews (
	id int IDENTITY(1,1) NOT NULL,
	content nvarchar(max) NULL,
	mark int NULL,
	image nvarchar(255) NULL,
	created_at datetime NULL,
	enable bit NULL,
	ordetail_id int NOT NULL,
	CONSTRAINT PK_Reviews PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE settings (
	id int IDENTITY(1,1) NOT NULL,
	unit nvarchar(255) NULL,
	address nvarchar(max) NULL,
	hotline varchar(20) NULL,
	email varchar(55) NULL,
	facebook nvarchar(255) NULL,
	instagram nvarchar(255) NULL,
	zalo nvarchar(255) NULL,
	CONSTRAINT PK_Settings PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE banners (
	id int IDENTITY(1,1) NOT NULL,
	title nvarchar(255) NOT NULL,
	content nvarchar(255) NOT NULL,
	image nvarchar(255) NULL,
	CONSTRAINT PK_banners PRIMARY KEY CLUSTERED (id)
);
CREATE TABLE users (
	id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password varchar(255) NOT NULL,
	phone varchar(15) NOT NULL,
	fullname nvarchar(255) NULL,
	birthday date NULL,
	email varchar(255) NOT NULL,
	address nvarchar(max) NULL,
	image nvarchar(255) NULL,
	created_at datetime NULL,
	updated_at datetime NULL,
	token varchar(50) NULL,
	CONSTRAINT PK_users PRIMARY KEY CLUSTERED (id)
);
GO
SET IDENTITY_INSERT categories ON
INSERT INTO categories (id, name, image) VALUES (1, N'Máy tính', N'mt.png')
INSERT INTO categories (id, name, image) VALUES (2, N'Laptop', N'lt.png')
INSERT INTO categories (id, name, image) VALUES (3, N'Điện thoại', N'dt.png')
INSERT INTO categories (id, name, image) VALUES (4, N'Máy tính bảng', N'mtb,png')
SET IDENTITY_INSERT categories OFF
GO
SET IDENTITY_INSERT companies ON
INSERT INTO companies (id, name, logo) VALUES (1, N'Asus', N'asus.png')
INSERT INTO companies (id, name, logo) VALUES (2, N'Dell', N'dell.png')
INSERT INTO companies (id, name, logo) VALUES (3, N'MSI', N'msi.png')
INSERT INTO companies (id, name, logo) VALUES (4, N'Acer', N'acer.png')
INSERT INTO companies (id, name, logo) VALUES (5, N'Lenovo', N'lonovo.png')
INSERT INTO companies (id, name, logo) VALUES (6, N'HP', N'hp.png')
INSERT INTO companies (id, name, logo) VALUES (7, N'Alienware', N'alienware.png')
INSERT INTO companies (id, name, logo) VALUES (8, N'Samsung', N'samsung.png')
INSERT INTO companies (id, name, logo) VALUES (9, N'Apple', N'apple.png')
INSERT INTO companies (id, name, logo) VALUES (10, N'Huawei', N'huawei.png')
INSERT INTO companies (id, name, logo) VALUES (11, N'Gigabyte', N'gigabyte.png')
INSERT INTO companies (id, name, logo) VALUES (12, N'LG', N'lg.png')
INSERT INTO companies (id, name, logo) VALUES (13, N'Xiaomi', N'xiaomi.png')
INSERT INTO companies (id, name, logo) VALUES (14, N'Vivo', N'vivo.png')
INSERT INTO companies (id, name, logo) VALUES (15, N'Oppo', N'oppo.png')
INSERT INTO companies (id, name, logo) VALUES (16, N'Realme', N'realme.png')
INSERT INTO companies (id, name, logo) VALUES (17, N'Sony', N'sony.png')
SET IDENTITY_INSERT companies OFF
GO
SET IDENTITY_INSERT users ON
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (1, N'admin', N'$2a$10$7cTi6lUKP85ENU7k0e6oT.9eOxtWFjuBjIe1SSh5UiH/jxWa6BuU2', N'0919993715', N'Nguyen Hoang Duy', CAST(N'1999-08-21' AS Date), N'duyplusdz@gmail.com', N'Phú Nhuận, Hồ Chí Minh', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2021-10-18T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (2, N'staff', N'$2a$10$A7S/.K./WLS3k5W4OJfIAeOrjPaYnu1LFMnEuxFaSo4oH6bpAxoKq', N'0568668500', N'Steve Kittiman', CAST(N'2022-08-23' AS Date), N'skittiman1@gmail.com', N'84536 Lyons Parkway', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2021-11-03T00:00:00.000' AS DateTime), CAST(N'2022-04-08T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (3, N'cust', N'$2a$10$T.x/okk.irxys9lbuYA7.eXx5o5IlKpylEQc95U8FE/nuA969XaZ2', N'0621753759', N'Leola Tufts', CAST(N'1930-04-28' AS Date), N'ltufts2@gmail.com', N'72707 Pleasure Crossing', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-09-14T00:00:00.000' AS DateTime), CAST(N'2022-08-01T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (4, N'bondricek3', N'$2a$10$zsr5pGNhOeT3vT5wBimv6.ePPqwRZm.XJwC1eHEzw8GS4y4cadTH6', N'0106226310', N'Brnaby Ondricek', CAST(N'2013-05-19' AS Date), N'bondricek3@gmail.com', N'32877 Saint Paul Parkway', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-09-25T00:00:00.000' AS DateTime), CAST(N'2021-10-12T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (5, N'negentan4', N'$2a$10$Wo0JmVgoTjgLN5tJYh.u.OPnpKuUxdR0fnbP.ZBJkzFJVG3v/CY2e', N'0763459232', N'Nickola Egentan', CAST(N'2008-09-09' AS Date), N'negentan4@yahoo.com', N'447 Trailsway Center', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2021-12-10T00:00:00.000' AS DateTime), CAST(N'2022-03-27T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (6, N'abrandreth5', N'$2a$10$1Ca2z5ik0Rezz2ROUlSWD.1ikwJUwFZ7PNih/OyxjJiPX7t0sAcKW', N'0564506674', N'Alwyn Brandreth', CAST(N'1944-12-11' AS Date), N'abrandreth5@gmail.com', N'135 Sauthoff Way', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-07-15T00:00:00.000' AS DateTime), CAST(N'2022-01-30T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (7, N'jpoore6', N'$2a$10$I.rBdmZtKMbg4b7JHX9hMO/7GLBa96Ak9aBivOIir3k7XaabBLORm', N'0684434379', N'Johannes Poore', CAST(N'1952-12-31' AS Date), N'jpoore6@yahoo.com', N'03714 Gulseth Hill', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2021-11-30T00:00:00.000' AS DateTime), CAST(N'2022-02-12T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (8, N'smaine7', N'$2a$10$PJyzfNWFwSPZyItgSQVQauN.qEy8KDyiurMJi3rLamMa951WTmx8W', N'0794716126', N'Salomon Maine', CAST(N'1947-11-18' AS Date), N'smaine7@gmail.com', N'23839 4th Parkway', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-09-15T00:00:00.000' AS DateTime), CAST(N'2022-09-23T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (9, N'gdambrogio8', N'$2a$10$xZb7P8M4WwP9tMjzi2H9CejzzSIMgI6ySCctZ5doRz4flcTTjFZF2', N'0442416947', N'Galvan Ambrogio', CAST(N'1943-12-16' AS Date), N'gdambrogio8@gmail.com', N'9 Morrow Terrace', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-08-23T00:00:00.000' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (10, N'gkail9', N'$2a$10$2BF.S4UVYNrBu6mzb9o/lu.xam9sCURALI2NtUJrWBp8auSHDXQ5G', N'0877670536', N'Glenden Kail', CAST(N'1971-03-07' AS Date), N'gkail9@gmail.com', N'4 Blaine Trail', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2021-11-12T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (11, N'gwillsheara', N'$2a$10$cexLZHX2bvEJaBLQolkL5uUuDs.Mofu/x6MSb5m09kPLN.dUhRJWK', N'0217553467', N'Giffie Willshear', CAST(N'1967-12-10' AS Date), N'gwillsheara@gmail.com', N'34671 6th Way', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2021-11-05T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (12, N'kloftb', N'$2a$10$XclCTReYYBj3g0zWAE7WP.pVLwJAYIbIZTiQ84PuU7Rv/TPXMDMUi', N'0711482338', N'Konstanze Loft', CAST(N'1963-08-11' AS Date), N'kloftb@gmail.com', N'92818 Esch Parkway', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-06-28T00:00:00.000' AS DateTime), CAST(N'2022-04-02T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (13, N'otookerc', N'$2a$10$A5s0ZHojB1w3G3vIWde4LeiNRcYcUIAIFmv1iiW/NqiqiH665pcG6', N'0259497277', N'Olivier Tooker', CAST(N'1908-05-28' AS Date), N'otookerc@gmail.com', N'68 Twin Pines Avenue', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2022-09-19T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (14, N'abartrapd', N'$2a$10$590SIqWsZizni0nnUyaTIOx22g2lX3P4ssidALbEmFvOwNDOfe0bi', N'0608956479', N'Alma Bartrap', CAST(N'1915-05-31' AS Date), N'abartrapd@gmail.com', N'05781 Springview Street', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-04-02T00:00:00.000' AS DateTime), CAST(N'2022-02-11T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (15, N'kcawtee', N'$2a$10$/ZKWJfuSoVy7LNp7pDeuTuGCOFxpIRVwoAh9hqjcQjHWwlwj0NJIe', N'0775910994', N'Kissiah Cawte', CAST(N'1974-07-03' AS Date), N'kcawtee@yahoo.com', N'18 Redwing Terrace', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2021-10-29T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (16, N'bmattiellif', N'$2a$10$jQj6cs7Pdj5KMHy2peQjnOISoIBiiI5x8oMihl.OKMV9Ud7.zLlp2', N'0882066287', N'Brittan Mattielli', CAST(N'1906-06-02' AS Date), N'bmattiellif@gmail.com', N'441 American Avenue', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-04-14T00:00:00.000' AS DateTime), CAST(N'2022-08-05T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (17, N'eperottg', N'$2a$10$esD.l.0X.3QyuPauZ/YsLuwyUSYpC82KcGXAuQcHAHB.h/wc8Orre', N'0428804539', N'Ernestus Perott', CAST(N'1959-08-21' AS Date), N'eperottg@gmail.com', N'207 Bartelt Pass', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-02-11T00:00:00.000' AS DateTime), CAST(N'2022-07-12T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (18, N'dsoppith', N'$2a$10$FFJIXfv9BVggJ70rM53rc.YN2L4t7.QRGUGivcSysSFJxctgJ52My', N'0362316037', N'Derrick Soppit', CAST(N'1998-10-06' AS Date), N'dsoppith@gmail.com', N'83 Manley Crossing', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-05-26T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (19, N'gbartalonii', N'$2a$10$RqCe/74TcgRQFSMCTRnOg.0guFPW2z94iPHpEDg8gDoRQQJ0olL4q', N'0496782743', N'Gregoor Bartaloni', CAST(N'1993-03-04' AS Date), N'gbartalonii@gmail.com', N'11 Garrison Terrace', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2021-12-26T00:00:00.000' AS DateTime), CAST(N'2021-10-26T00:00:00.000' AS DateTime), NULL)
INSERT users (id, username, password, phone, fullname, birthday, email, address, image, created_at, updated_at, token) VALUES (20, N'gbelisonj', N'$2a$10$UDBHQ4.oIbvEHJB.XuLzHezzTFpHhQv/hEw04e64KRq9K5ebXXQtu', N'0966819835', N'Gerek Belison', CAST(N'1967-01-12' AS Date), N'gbelisonj@gmail.com', N'685 Randy Court', N'https://i.imgur.com/Y0g3Fi6.png', CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT users OFF
GO
SET IDENTITY_INSERT products ON
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (1, N'MSI Laptop', 20000000, 57, 0, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2022-10-23T18:17:22.000' AS DateTime), CAST(N'2023-02-12T08:15:45.000' AS DateTime), 14, 4, 7)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (2, N'Lenovo Laptop', 35000000, 44, 0, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/siejHeB.jpg', CAST(N'2022-09-15T21:09:23.000' AS DateTime), CAST(N'2022-12-23T07:25:23.000' AS DateTime), 11, 3, 6)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (3, N'MSI Laptop', 31000000, 82, 5, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/0suqsPZ.jpg', CAST(N'2023-03-27T18:20:54.000' AS DateTime), CAST(N'2022-02-13T22:21:07.000' AS DateTime), 14, 2, 14)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (4, N'Laptop Aser', 17000000, 86, 10, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/siejHeB.jpg', CAST(N'2023-03-11T11:43:54.000' AS DateTime), CAST(N'2022-10-10T20:29:33.000' AS DateTime), 18, 1, 11)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (5, N'HP Laptop', 15000000, 64, 10, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/2X0zVP4.jpg', CAST(N'2023-07-07T18:37:33.000' AS DateTime), CAST(N'2023-04-24T12:08:43.000' AS DateTime), 6, 3, 4)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (6, N'Laptop Aser', 24000000, 25, 20, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2022-12-24T13:57:02.000' AS DateTime), CAST(N'2022-06-01T09:07:54.000' AS DateTime), 15, 2, 14)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (7, N'Aser Laptop', 16000000, 50, 20, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/2X0zVP4.jpg', CAST(N'2022-11-22T19:35:17.000' AS DateTime), CAST(N'2021-12-28T04:47:47.000' AS DateTime), 8, 3, 7)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (8, N'Lenovo Laptop', 25500000, 72, 18, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2022-09-14T02:28:31.000' AS DateTime), CAST(N'2021-11-17T14:07:53.000' AS DateTime), 9, 3, 3)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (9, N'Laptop Macbook', 47000000, 34, 15, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/0suqsPZ.jpg', CAST(N'2022-06-10T19:22:30.000' AS DateTime), CAST(N'2022-10-25T00:17:36.000' AS DateTime), 13, 2, 7)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (10, N'Laptop Lenovo', 33400000, 27, 15, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2022-06-15T04:36:41.000' AS DateTime), CAST(N'2023-08-16T15:04:54.000' AS DateTime), 11, 4, 7)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (11, N'Điện thoại Iphone', 11000000, 86, 0, 0, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/6JvGFHT.jpg', CAST(N'2022-09-11T05:37:44.000' AS DateTime), CAST(N'2022-12-23T20:01:22.000' AS DateTime), 2, 2, 17)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (12, N'Điện thoại Xiaomi', 6000000, 35, 10, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/siejHeB.jpg', CAST(N'2022-07-04T00:09:36.000' AS DateTime), CAST(N'2022-04-03T18:13:15.000' AS DateTime), 3, 3, 9)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (13, N'Điện thoại Huawei', 4000000, 20, 5, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/6JvGFHT.jpg', CAST(N'2023-10-19T19:13:55.000' AS DateTime), CAST(N'2023-10-06T23:35:18.000' AS DateTime), 14, 2, 11)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (14, N'Điện thoại Oppo', 9000000, 14, 5, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2022-04-30T21:24:49.000' AS DateTime), CAST(N'2023-05-05T13:06:35.000' AS DateTime), 17, 2, 10)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (15, N'Điện thoại Oppo', 7000000, 107, 5, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/0suqsPZ.jpg', CAST(N'2022-05-23T02:56:55.000' AS DateTime), CAST(N'2022-01-31T02:39:54.000' AS DateTime), 11, 2, 17)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (16, N'Điện thoại Xiaomi', 7200000, 52, 0, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/2X0zVP4.jpg', CAST(N'2023-07-04T09:42:16.000' AS DateTime), CAST(N'2022-04-28T13:51:26.000' AS DateTime), 2, 3, 17)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (17, N'Điện thoại Vivo', 4500000, 75, 20, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2022-02-27T17:44:13.000' AS DateTime), CAST(N'2022-05-08T10:25:55.000' AS DateTime), 11, 2, 12)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (18, N'Điện thoại Oppo', 6100000, 42, 20, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/wMInVIP.jpg', CAST(N'2023-07-25T01:35:17.000' AS DateTime), CAST(N'2022-10-06T00:52:29.000' AS DateTime), 16, 1, 11)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (19, N'Điện thoại Realme', 3200000, 245, 32, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/8hMfwI6.jpg', CAST(N'2023-07-06T20:40:12.000' AS DateTime), CAST(N'2023-06-05T15:40:23.000' AS DateTime), 11, 2, 15)
INSERT products (id, name, price, quantity, discount, available, description, image, created_at, updated_at, user_id, category_id, company_id) VALUES (20, N'Điện thoại Vivo', 5800000, 23, 32, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'https://i.imgur.com/wMInVIP.jpg', CAST(N'2022-06-27T18:30:22.000' AS DateTime), CAST(N'2023-05-01T07:27:05.000' AS DateTime), 8, 4, 10)
SET IDENTITY_INSERT products OFF
GO
SET IDENTITY_INSERT orders ON
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (1, '2022-02-28 11:04:23', '2022-02-04 23:04:57', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (2, '2022-08-15 12:17:28', '2021-12-06 02:33:09', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (3, '2022-04-26 20:45:06', '2022-04-07 10:54:57', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (4, '2022-02-02 15:31:09', '2022-06-21 07:22:51', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (5, '2022-09-08 03:20:35', '2022-02-27 03:11:05', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (6, '2022-09-21 10:15:50', '2021-10-31 11:08:00', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (7, '2022-03-17 06:17:06', '2022-04-23 04:47:09', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (8, '2022-08-07 09:45:41', '2022-08-05 02:39:32', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (9, '2021-11-25 03:10:49', '2022-09-16 07:30:51', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (10, '2022-10-03 00:05:13', '2022-08-29 06:15:27', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (11, '2022-08-29 07:58:04', '2022-10-23 13:16:54', 11)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (12, '2022-05-16 10:19:34', '2022-05-30 12:18:07', 11)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (13, '2022-09-01 00:40:41', '2022-09-04 00:26:12', 11)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (14, '2022-01-19 02:13:05', '2022-01-06 17:09:46', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (15, '2021-11-05 12:05:36', '2021-11-10 16:59:43', 15)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (16, '2022-04-21 20:37:07', '2022-07-17 17:28:04', 15)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (17, '2022-07-18 17:48:10', '2022-06-27 14:17:38', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (18, '2022-03-20 03:35:12', '2021-11-28 15:30:10', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (19, '2022-06-01 23:41:16', '2022-04-19 21:30:23', 15)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (20, '2022-04-01 23:09:56', '2021-11-09 12:01:58', 15)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (21, '2022-04-09 19:31:30', '2022-06-19 12:22:25', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (22, '2022-03-31 05:54:49', '2022-07-13 19:44:36', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (23, '2022-05-15 16:23:48', '2022-02-19 16:04:39', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (24, '2022-09-23 19:03:41', '2022-05-29 09:41:27', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (25, '2021-10-29 14:44:00', '2022-07-05 06:47:15', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (26, '2022-08-19 20:09:44', '2022-07-31 21:05:01', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (27, '2021-12-11 23:13:05', '2021-12-20 10:33:23', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (28, '2022-07-20 23:09:06', '2022-05-28 13:34:25', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (29, '2022-03-12 23:32:41', '2021-10-29 01:32:19', 3)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (30, '2022-03-21 02:33:31', '2022-04-15 22:24:52', 7)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (31, '2022-08-21 06:13:50', '2022-10-24 17:46:07', 7)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (32, '2022-01-06 16:42:57', '2022-08-18 15:49:57', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (33, '2021-10-30 03:00:03', '2022-04-29 23:50:04', 7)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (34, '2022-06-05 03:18:54', '2022-02-05 19:53:10', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (35, '2022-03-18 09:24:49', '2021-11-12 14:20:47', 6)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (36, '2021-10-29 13:43:40', '2022-03-03 02:00:01', 6)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (37, '2022-10-06 14:22:08', '2021-11-01 04:36:55', 6)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (38, '2022-05-20 04:33:32', '2021-11-09 06:15:01', 6)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (39, '2022-05-05 06:03:54', '2022-07-19 03:23:27', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (40, '2021-11-22 14:35:44', '2022-07-11 03:27:43', 6)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (41, '2021-11-19 22:22:34', '2022-07-02 15:40:32', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (42, '2022-07-14 09:32:33', '2022-01-16 05:32:42', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (43, '2022-02-18 15:17:08', '2021-11-20 04:45:36', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (44, '2022-06-10 18:04:55', '2022-02-15 13:29:58', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (45, '2021-12-25 20:16:17', '2022-03-13 06:11:31', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (46, '2022-07-28 07:44:38', '2021-11-27 00:34:57', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (47, '2022-06-13 03:42:24', '2022-03-08 01:44:58', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (48, '2022-04-21 02:13:25', '2022-01-04 08:52:19', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (49, '2022-05-19 22:40:37', '2021-11-16 19:24:09', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (50, '2022-09-02 05:56:26', '2021-12-29 06:53:26', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (51, '2022-06-24 11:06:03', '2022-06-23 08:40:44', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (52, '2022-02-27 14:44:48', '2022-02-28 10:57:59', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (53, '2022-04-23 14:28:45', '2021-11-05 08:21:19', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (54, '2022-08-05 00:35:37', '2021-11-02 06:56:20', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (55, '2021-12-13 08:27:08', '2022-04-02 19:56:46', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (56, '2022-06-19 05:12:42', '2022-09-23 15:08:41', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (57, '2022-03-28 07:17:08', '2021-11-11 12:04:17', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (58, '2022-04-10 08:12:56', '2021-11-18 06:21:13', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (59, '2022-01-13 20:39:55', '2022-04-11 11:58:02', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (60, '2022-02-24 15:34:20', '2022-09-18 13:41:19', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (61, '2021-12-15 09:12:11', '2022-04-09 03:02:49', 8)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (62, '2022-02-15 02:16:18', '2021-11-18 13:17:06', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (63, '2022-04-10 14:04:20', '2022-09-29 00:11:07', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (64, '2022-07-25 12:45:47', '2022-08-01 02:51:18', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (65, '2022-01-10 20:08:30', '2022-03-23 08:03:10', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (66, '2021-11-27 11:50:34', '2021-11-12 09:50:35', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (67, '2022-03-22 19:39:37', '2022-09-10 11:41:49', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (68, '2022-04-07 05:11:49', '2022-03-26 04:53:31', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (69, '2022-08-01 05:09:22', '2021-11-30 18:43:53', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (70, '2022-03-25 04:56:45', '2022-08-07 18:07:51', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (71, '2021-12-25 07:54:05', '2021-11-08 09:37:16', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (72, '2022-03-20 19:55:01', '2022-01-24 03:46:08', 13)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (73, '2022-08-06 19:54:01', '2022-07-16 23:57:56', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (74, '2022-06-09 15:07:07', '2022-01-10 11:49:41', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (75, '2022-09-30 14:02:14', '2022-08-15 13:10:26', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (76, '2022-03-27 19:59:32', '2021-11-26 18:32:18', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (77, '2022-10-27 17:17:30', '2021-12-03 22:32:17', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (78, '2022-10-12 00:11:44', '2021-11-17 14:20:53', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (79, '2022-10-26 07:59:59', '2022-05-18 03:03:23', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (80, '2022-10-18 11:22:49', '2022-05-26 06:31:31', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (81, '2021-11-02 18:16:48', '2022-10-03 12:30:01', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (82, '2022-01-06 23:04:39', '2021-11-11 23:26:41', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (83, '2022-10-07 14:44:34', '2022-04-19 13:40:41', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (84, '2022-07-29 01:40:32', '2022-08-05 21:58:14', 5)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (85, '2022-07-25 04:51:45', '2022-01-16 06:35:21', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (86, '2021-12-27 08:42:49', '2022-02-18 19:18:45', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (87, '2022-02-24 20:06:13', '2022-01-23 12:12:31', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (88, '2021-12-25 13:43:43', '2022-07-13 04:54:12', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (89, '2022-04-16 21:47:37', '2022-04-12 10:43:48', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (90, '2021-11-29 11:03:13', '2022-10-07 23:54:08', 14)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (91, '2022-06-27 19:30:52', '2022-09-26 02:19:01', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (92, '2022-05-31 04:49:49', '2022-10-25 05:53:53', 16)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (93, '2021-11-18 10:17:34', '2022-04-13 22:47:57', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (94, '2022-03-19 16:12:26', '2021-11-13 10:48:35', 16)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (95, '2022-02-28 00:52:11', '2022-04-18 15:49:17', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (96, '2022-10-31 07:20:16', '2022-10-31 07:59:25', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (97, '2022-10-31 08:14:47', '2022-10-31 09:27:08', 4)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (98, '2022-10-31 09:52:14', '2022-10-31 11:07:01', 16)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (99, '2022-10-31 10:32:32', '2022-10-31 12:08:09', 12)
INSERT INTO orders (id, created_at, updated_at, user_id) VALUES (100, '2022-10-31 19:25:33', '2022-10-31 22:17:13', 4)
SET IDENTITY_INSERT orders OFF
GO
SET IDENTITY_INSERT order_details ON 
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (1, 25348395, 47, 2, 36, 14);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (2, 41410920, 3, 3, 1, 18);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (3, 22798890, 21, 1, 6, 4);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (4, 5992905, 27, 3, 10, 11);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (5, 34056264, 49, 1, 42, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (6, 45723758, 45, 2, 30, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (7, 11043870, 33, 4, 21, 8);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (8, 25001290, 8, 4, 19, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (9, 47532518, 3, 3, 92, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (10, 35421124, 1, 2, 89, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (11, 48602966, 36, 2, 42, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (12, 39347184, 34, 3, 2, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (13, 39046654, 28, 4, 66, 7);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (14, 9100771, 40, 1, 73, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (15, 16088599, 23, 2, 56, 8);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (16, 17684375, 21, 3, 20, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (17, 25745334, 10, 1, 88, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (18, 12286289, 5, 4, 27, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (19, 15415471, 29, 1, 32, 6);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (20, 9402708, 3, 1, 78, 15);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (21, 7928236, 22, 2, 87, 18);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (22, 24787552, 7, 3, 14, 6);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (23, 26232175, 36, 2, 72, 19);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (24, 43406485, 17, 3, 16, 1);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (25, 11545336, 6, 4, 3, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (26, 39256974, 16, 1, 87, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (27, 26323450, 23, 2, 14, 15);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (28, 13196660, 27, 3, 23, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (29, 8514161, 13, 4, 11, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (30, 34294399, 9, 1, 84, 3);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (31, 19982662, 48, 2, 13, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (32, 18104943, 19, 3, 13, 19);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (33, 7485834, 23, 4, 47, 1);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (34, 16785669, 37, 1, 58, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (35, 16752777, 5, 2, 26, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (36, 28225339, 26, 1, 80, 13);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (37, 24747669, 46, 2, 23, 4);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (38, 34660888, 36, 3, 69, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (39, 26857659, 1, 4, 56, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (40, 32306827, 5, 4, 93, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (41, 47864492, 46, 1, 75, 1);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (42, 33856184, 8, 2, 42, 13);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (43, 45208023, 26, 2, 5, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (44, 20340408, 30, 1, 64, 4);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (45, 46736610, 47, 4, 88, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (46, 22094064, 28, 1, 39, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (47, 42551253, 43, 2, 97, 11);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (48, 47400209, 2, 3, 24, 6);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (49, 22874482, 10, 4, 75, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (50, 26321475, 35, 2, 97, 10);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (51, 11505203, 36, 1, 43, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (52, 15426416, 29, 3, 43, 18);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (53, 8256656, 43, 4, 40, 11);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (54, 40712760, 5, 1, 11, 4);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (55, 19513034, 16, 4, 83, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (56, 48902762, 50, 1, 95, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (57, 11412878, 26, 2, 87, 19);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (58, 19898755, 15, 1, 33, 15);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (59, 47823320, 38, 3, 39, 17);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (60, 49977622, 3, 3, 44, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (61, 22843223, 24, 4, 99, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (62, 11192531, 6, 4, 59, 11);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (63, 12917500, 43, 1, 20, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (64, 43056491, 49, 2, 54, 19);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (65, 23132184, 10, 1, 71, 8);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (66, 29681727, 48, 3, 92, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (67, 39012605, 12, 4, 30, 14);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (68, 30033335, 8, 1, 81, 11);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (69, 32129611, 2, 2, 45, 12);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (70, 41974458, 40, 3, 54, 3);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (71, 5428641, 18, 4, 6, 18);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (72, 49100204, 46, 1, 63, 1);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (73, 13357335, 1, 2, 69, 17);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (74, 35794223, 38, 3, 3, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (75, 8623966, 15, 4, 64, 17);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (76, 26195302, 29, 1, 10, 6);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (77, 9937762, 11, 2, 68, 7);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (78, 37870537, 16, 3, 95, 15);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (79, 44606696, 7, 4, 90, 17);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (80, 5140739, 3, 1, 59, 17);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (81, 24101392, 20, 2, 10, 11);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (82, 13854940, 46, 1, 83, 6);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (83, 26905656, 25, 4, 51, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (84, 16033864, 30, 3, 100, 7);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (85, 17883323, 29, 1, 16, 20);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (86, 20924061, 49, 2, 28, 8);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (87, 38792774, 16, 1, 82, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (88, 36661963, 25, 3, 66, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (89, 27000628, 15, 4, 90, 2);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (90, 32434697, 7, 1, 68, 1);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (91, 48171227, 42, 2, 81, 4);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (92, 23966638, 9, 3, 2, 10);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (93, 31127802, 28, 4, 66, 16);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (94, 18012629, 47, 2, 96, 5);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (95, 21019774, 13, 1, 76, 7);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (96, 43022719, 19, 1, 36, 9);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (97, 19279960, 2, 1, 83, 18);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (98, 18548795, 30, 1, 38, 10);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (99, 40495574, 26, 1, 13, 3);
INSERT INTO order_details (id, price, quantity,status, order_id, product_id) VALUES (100, 16571363, 34, 1, 74, 16);
SET IDENTITY_INSERT order_details OFF
GO
SET IDENTITY_INSERT reviews ON 
INSERT INTO reviews (id, content, mark, image, created_at, ordetail_id, enable) VALUES (1, N'Hàng sài rất ok', 10, N'anh1.png', CAST(N'2022-10-26T18:15:22.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT reviews OFF
GO
SET IDENTITY_INSERT settings ON 
INSERT INTO settings (id, unit, address, hotline, email, facebook, instagram, zalo) VALUES (1, N'NghienDT', N'140A Huỳnh Văn Bánh, Phú Nhuận, HCM', N'01234567890', N'nghienecomm@gmail.com', N'https://www.facebook.com/nghiendt', N'https://www.instagram.com/nghiendt', N'https://zalo.me/0919993715')
SET IDENTITY_INSERT settings OFF
GO
SET IDENTITY_INSERT banners ON
INSERT INTO banners (id, title, content, image) VALUES (1, N'New Range Of sumsang Camera', N'sumsang EOS600D/Kiss X5', N'https://i.imgur.com/JBH5ybZ.jpg')
INSERT INTO banners (id, title, content, image) VALUES (2, N'Game, Consoles & much more', N'Sega Saturn Disc Drive Replacement', N'https://i.imgur.com/2YAi1iI.jpg')
SET IDENTITY_INSERT banners OFF
GO
/* order_details */
ALTER TABLE order_details ADD CONSTRAINT FK_order_details_orders FOREIGN KEY(order_id)
REFERENCES orders (id) ON UPDATE NO ACTION
ALTER TABLE order_details ADD CONSTRAINT FK_order_details_products FOREIGN KEY(product_id)
REFERENCES products (id) ON UPDATE NO ACTION
/* orders */
ALTER TABLE orders ADD CONSTRAINT FK_orders_users FOREIGN KEY(user_id)
REFERENCES users (id) ON DELETE NO ACTION ON UPDATE CASCADE
/* products */
ALTER TABLE products ADD CONSTRAINT FK_products_companies FOREIGN KEY(company_id)
REFERENCES companies (id) ON DELETE NO ACTION ON UPDATE CASCADE
ALTER TABLE products ADD CONSTRAINT FK_products_categories FOREIGN KEY(category_id)
REFERENCES categories (id) ON DELETE NO ACTION ON UPDATE CASCADE
ALTER TABLE products ADD CONSTRAINT FK_products_users FOREIGN KEY(user_id)
REFERENCES users (id) ON DELETE NO ACTION ON UPDATE CASCADE
/* Reviews */
ALTER TABLE Reviews ADD CONSTRAINT FK_Reviews_OrderDetails FOREIGN KEY(ordetail_id)
REFERENCES order_details (id) ON DELETE NO ACTION
GO

-- Top best selling products
CREATE PROCEDURE getTopProduct
AS BEGIN
	SELECT DISTINCT TOP 5 p.id as id, p.name as product_name, p.price as product_price, od.quantity as order_quantity,
	p.available as product_available, p.image product_image, c.name as company_name, u.fullname as full_name
	FROM order_details od
		JOIN orders o ON o.id = od.order_id
		JOIN users u ON u.id = o.user_id
		JOIN products as p ON p.user_id = u.id
		JOIN companies c ON c.id = p.company_id
	ORDER BY order_quantity DESC
END;
GO
-- Top loyal customers
CREATE PROCEDURE getTopCustomer
AS BEGIN
	SELECT DISTINCT TOP 5 u.id as id, u.fullname as full_name, u.phone as user_phone, u.address as user_address,
	od.quantity as order_quantity, sum(od.price) as sum_order
	FROM order_details od
		JOIN orders o ON o.id = od.order_id
		JOIN users u ON u.id = o.user_id
	GROUP BY u.id, u.fullname, u.phone, u.address, od.quantity
	ORDER BY order_quantity DESC
END;
GO
-- Revenue by day
CREATE PROCEDURE getDailyRevenue
AS BEGIN
	SELECT sum(od.quantity) as order_quantity, CAST(o.created_at as DATE) as today,
	SUM(od.price) as revenue_order, (SELECT SUM(price) FROM order_details) as sum_revenue
	FROM order_details od
		JOIN orders o ON o.id = od.order_id
		JOIN users u ON u.id = o.user_id
	WHERE CAST(o.created_at as DATE) = CAST(GETDATE() as DATE)
	GROUP BY CAST(o.created_at as DATE)
	ORDER BY today DESC
END;
GO
-- Top featured products
CREATE PROCEDURE getFeaturedProducts
AS BEGIN
	SELECT DISTINCT TOP 14 p.id as id, p.name as product_name, p.price as product_price, od.quantity as order_quantity,
	p.available as product_available, p.image product_image, c.name as company_name, u.fullname as full_name
	FROM order_details od
		JOIN orders o ON o.id = od.order_id
		JOIN users u ON u.id = o.user_id
		JOIN products as p ON p.user_id = u.id
		JOIN companies c ON c.id = p.company_id
	ORDER BY order_quantity DESC
END;
GO
-- Number of products sold per year
CREATE PROCEDURE productSalesByYear(@year SMALLINT)
AS
BEGIN
SET NOCOUNT ON;
    SELECT p.id, p.name, SUM(dt.quantity) as sales, @year as year
    FROM products p
		JOIN order_details dt ON p.id = dt.product_id
		JOIN orders o ON dt.order_id = o.id
    WHERE YEAR(o.created_at) = @year
    GROUP BY p.id, p.name, YEAR(o.created_at)
    ORDER BY sales DESC;
END;
GO
-- Products sold by the store
CREATE PROCEDURE productSalesByShop(@shop_id BIGINT)
AS
BEGIN
SET NOCOUNT ON;
    SELECT p.name, p.image, SUM(od.quantity) as sales
    FROM products p
		RIGHT JOIN users u ON u.id = p.user_id
		JOIN order_details od ON p.id = od.product_id
    WHERE u.id = @shop_id
    GROUP BY p.name, p.image, u.fullname
    ORDER BY sales DESC;
END;
GO
-- Store revenue
CREATE FUNCTION revenueShop(@shop_id BIGINT, @year SMALLINT)
    RETURNS BIGINT
BEGIN
    DECLARE @result BIGINT;
    SELECT @result = SUM(od.price * od.quantity)
    FROM order_details od
		JOIN products p ON p.id = od.product_id
		JOIN orders o ON od.order_id = o.id
		JOIN users u ON p.user_id = u.id
    WHERE u.id = @shop_id
		AND YEAR(o.created_at) = @year
    GROUP BY YEAR(o.created_at)
    RETURN COALESCE(@result, 0);
END;
GO
-- Store revenue by year
CREATE PROCEDURE revenueShopByYear(@shop_id BIGINT, @year SMALLINT)
AS
BEGIN
SET NOCOUNT ON;
    SELECT id, fullname as full_name, @year, dbo.revenueShop(@shop_id, @year) as amount
    FROM users
    WHERE id = @shop_id;
END;
GO
-- Sales of all stores by year
CREATE PROCEDURE revenueAllShopsByYear(@year SMALLINT)
AS
BEGIN
SET NOCOUNT ON;
    SELECT id, fullname as full_name, dbo.revenueShop(id, @year) as amount, @year
    FROM users
    ORDER BY amount DESC;
END;
GO
USE master
GO
ALTER DATABASE eCommerceNghienDT SET READ_WRITE 
GO