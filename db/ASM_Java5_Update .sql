create database ASM_EStore_Java5

use ASM_EStore_Java5

create table Users (
	id bigint IDENTITY(1,1) primary key  not null,
	username nvarchar(255) not null ,
	password nvarchar (255) not null,
	fullname  nvarchar (255) not null,
	email nvarchar (255) not null  , /* unique : độc nhất*/
	activated int  default 0,  /* 0 = On, 1 = off*/
	admin int	 default 0  /* 0 = Admin, 1 = NhienVien, 2 = Khach hang*/
)
create table Orders(
	id bigint IDENTITY(1,1) primary key ,
	usernameid bigint   not null,
	address nvarchar(255) not null,
	createdate datetime
	foreign key (usernameid)references Users(id)

)
create table Categories(
	id char(10) primary key,
	name nvarchar(255) not null,

)

create table Products(
	id bigint IDENTITY(1,1)  primary key,
	name nvarchar(255) not null,
	price float not null,
	createdate datetime,
	brand nvarchar(50),
	quantity int default 0 ,
	imgP nvarchar(250),
	description nvarchar(max),
	categoryId char(10)
	foreign key (categoryId)
		references Categories(id) on delete cascade on update cascade
)

create table ProductDetail(
	id bigint IDENTITY(1,1)  primary key,
	productID bigint NOT NULL,
	 size char(5) NOT NULL,
    color nvarchar(50) NOT NULL,
	foreign key (productID)	references Products(id) on delete cascade on update cascade

)

create table ProductImg(
	id bigint IDENTITY(1,1)  primary key,
	productDetailID bigint NOT NULL,
	img nvarchar(255)
	foreign key (productDetailID)	references ProductDetail(id) on delete cascade on update cascade

)
create table Favorite(
	id bigint IDENTITY(1,1)  primary key,
	productId bigint not null,
	userID bigint not null,
	reviews nvarchar(250) 
	foreign key (productId) references Products(id) on delete cascade on update cascade ,
	foreign key (userID) references Users(id) 	on delete cascade on update cascade
)

create table OrdersDetails(
	id bigint IDENTITY(1,1)  primary key ,
	orderId bigint ,
	productId bigint not null,
	price float not null,
	quantity int not null ,
	status int not null
	foreign key (productId)	references Products(id) ,
	foreign key (orderId) references Orders(id) 
)

SELECT p.id,name,price,[pi].img,size FROM Products p JOIN ProductDetail pd on p.id = pd.id JOIN  ProductImg [pi] on pd.id = [pi].id 

SELECT P.id, P.name, P.price, PD.size, PI.img
FROM Products P
INNER JOIN ProductDetail PD ON P.id = PD.productId
INNER JOIN ProductImg PI ON PD.id = PI.productDetailID;

SELECT   P.id, P.name, P.price, PD.size, PI.img
FROM Products P
INNER JOIN ProductDetail PD ON P.id = PD.productId
INNER JOIN ProductImg PI ON PD.id = PI.productDetailID
INNER JOIN Favorite F ON P.id = F.productId
ORDER BY F.id DESC

select top 6  Products.id, name, price ,img from Products join Favorite on Products.id =  Favorite.id
							join ProductDetail on Products.id =  ProductDetail.id 
							join ProductImg on ProductDetail.id =  ProductImg.id 
							ORDER BY Favorite.id DESC

select Favorite.productId, ProductImg.img, Products.[name], SUM(Favorite.productId) as SumFavorite, Products.price									 
										from Favorite 
										join Products on Products.id =  Favorite.productId
										join ProductDetail on Products.id =  ProductDetail.id 
										join ProductImg on ProductDetail.id =  ProductImg.id 	
										GROUP BY Favorite.productId , Products.[name],Products.price, ProductImg.img
										ORDER BY SumFavorite DESC


select * from Favorite 

select  Products.id, name, price ,img from Products join Favorite on Products.id =  Favorite.id
							join ProductDetail on Products.id =  ProductDetail.id 
							join ProductImg on ProductDetail.id =  ProductImg.id where Favorite.id = 2
	
	select * from OrdersDetails

SELECT  p.name, p.price, pi.img, COUNT(od.productId) AS totalSales
FROM Products p
INNER JOIN ProductImg pi ON p.id = pi.productDetailID
INNER JOIN OrdersDetails od ON p.id = od.productId
WHERE od.status IN (1, 2)
GROUP BY  p.name, p.price, pi.img
ORDER BY totalSales DESC;

select  COUNT(od.productId) AS totalSales,p.name, p.price,[pi].img  from OrdersDetails od 
INNER JOIN Products p ON p.id = od.id
INNER JOIN ProductDetail  pd ON p.id = pd.productID
INNER JOIN ProductImg [pi] ON pd.productID = [pi].productDetailID
WHERE p.id = 1
GROUP BY  p.name, p.price, pi.img 


select  COUNT(od.productId) AS totalSales from OrdersDetails od 
group by od.orderId  


select * from OrdersDetails
SELECT Products.id, Products.name, Products.price, SUM(OrdersDetails.quantity) AS total_sold
FROM Products
JOIN ProductDetail ON Products.id = ProductDetail.productID
JOIN ProductImg ON ProductDetail.id = ProductImg.productDetailID
LEFT JOIN OrdersDetails ON Products.id = OrdersDetails.productId
GROUP BY Products.id, Products.name, Products.price
ORDER BY total_sold DESC;

-- thống kê theo ngày 
SELECT Sum(OrdersDetails.quantity) AS SoLuongSanPham, SUM(OrdersDetails.price * OrdersDetails.quantity) AS TongTienBanDuoc
FROM OrdersDetails
INNER JOIN Orders ON OrdersDetails.orderId = Orders.id
WHERE CONVERT(date, Orders.createdate) = CONVERT(date, GETDATE())

select p.id,[pi].img,p.name,p.price,od.quantity,u.username,o.createdate from OrdersDetails od
INNER JOIN Orders o ON od.orderId = o.id
INNER JOIN Users u ON o.usernameid = u.id
INNER JOIN Products p ON  od.productId = p.id
INNER JOIN ProductDetail pd ON pd.productID = p.id
INNER JOIN ProductImg [pi] ON [pi].productDetailID = pd.id
WHERE CONVERT(date, o.createdate) = CONVERT(date, GETDATE())


-- thống kê theo tháng 
SELECT  Sum(OrdersDetails.quantity) AS SoLuongSanPham, SUM(OrdersDetails.price * OrdersDetails.quantity) AS TongTienBanDuoc
FROM OrdersDetails
INNER JOIN Orders ON OrdersDetails.orderId = Orders.id
WHERE   YEAR(Orders.createdate) = YEAR(GETDATE()) AND MONTH(Orders.createdate) = MONTH(GETDATE())

select p.id,[pi].img,p.name,p.price,od.quantity,u.username,od.status, o.createdate from OrdersDetails od
INNER JOIN Orders o ON od.orderId = o.id
INNER JOIN Users u ON o.usernameid = u.id
INNER JOIN Products p ON  od.productId = p.id
INNER JOIN ProductDetail pd ON pd.productID = p.id
INNER JOIN ProductImg [pi] ON [pi].productDetailID = pd.id
WHERE od.status = 0 and YEAR(o.createdate) = YEAR(GETDATE()) AND MONTH(o.createdate) = MONTH(GETDATE()) 


-- lấy ra sản phẩm có Detail

Select * from ProductDetail where size like 'S' and size like 'M'

Select DISTINCT  color from ProductDetail where productID = 1


SELECT DISTINCT PD.productID, P.name, P.price, PD.size, PD.color, PI.img
FROM ProductDetail PD
JOIN Products P ON PD.productID = P.id
JOIN ProductImg PI ON PD.productID = PI.productDetailID
WHERE PD.productID = 1

-- lấy ra sản phẩm Detail img
SELECT PD.productID, P.name, P.price, PD.size, PD.color, PI.img
FROM ProductDetail PD
JOIN Products P ON PD.productID = P.id
JOIN ProductImg PI ON PD.id = PI.productDetailID
WHERE PD.productID = 4

SELECT Products.id, Products.name, ProductImg.img, Products.price, COUNT(OrdersDetails.productID) AS total_ordered
	 		FROM Orders
	 		JOIN OrdersDetails ON Orders.id = OrdersDetails.orderID
	 		JOIN Products ON OrdersDetails.productID = Products.id
	 		JOIN ProductDetail ON Products.id = ProductDetail.productID
	 		JOIN ProductImg ON ProductDetail.id = ProductImg.productDetailID
	 		GROUP BY Products.id, Products.name, ProductImg.img, Products.price
	 		ORDER BY total_ordered DESC

SELECT  name,price,size,color,Products.imgP from Products join ProductDetail on Products.id = ProductDetail.productID where Products.id = 1

select top 6 COUNT(Favorite.productId) as luocYeuThich,Favorite.id,Products.imgP, Products.[name],Products.price
	from Products
	join Favorite on Products.id =  Favorite.productId				
	GROUP BY COUNT(Favorite.productId) ,Favorite.id,Products.imgP, Products.[name],Products.price
	ORDER BY COUNT(Favorite.productId)  DESC

	select top 6 Products.id,  Products.[name],Products.price,imgP,brand,categoryId,quantity,description,createdate
					from  Products
					join Favorite on Products.id =  Favorite.productId				
					GROUP BY Products.id , Products.[name],Products.price,imgP,brand,categoryId,quantity,description,createdate
					ORDER BY COUNT(Favorite.productId) DESC

	select top 6 * 	from  Products	ORDER BY createdate DESC

	select Users.id as idUser,Users.username,reviews from Favorite inner join Products on Products.id = Favorite.productId
						inner join Users on Users.id = Favorite.userID
						where Products.id = 1


-- insert values
INSERT INTO Users (username, password, fullname, email, activated, admin)
VALUES 
	('user1', '123', 'Full Name 1', 'email1@example.com', 0, 0),
	('user2', '123', 'Full Name 2', 'email2@example.com', 0, 1),
	('user3', '123', 'Full Name 3', 'email3@example.com', 0, 0),
	('user4', '123', 'Full Name 4', 'email4@example.com', 1, 0),
	('user5', '123', 'Full Name 5', 'email5@example.com', 0, 0),
	('user6', '123', 'Full Name 6', 'email6@example.com', 0, 1),
	('user7', '123', 'Full Name 7', 'email7@example.com', 0, 2),
	('user8', '123', 'Full Name 8', 'email8@example.com', 0, 0),
	('user9', '123', 'Full Name 9', 'email9@example.com', 0, 0),
	('teolv', '123', 'Full Name 10', 'email10@example.com', 0, 0);
INSERT INTO Orders (usernameid, address, createdate)
VALUES 
	(1, 'Address 1', '2023-06-10'),
	(2, 'Address 2', '2023-06-10'),
	(3, 'Address 3', '2023-06-10'),
	(4, 'Address 4', '2023-06-10'),
	(5, 'Address 5', '2023-06-10'),
	(6, 'Address 6', '2023-06-10'),
	(7, 'Address 7', '2023-06-10'),
	(8, 'Address 8', '2023-06-10'),
	(9, 'Address 9', '2023-06-10'),
	(10, 'Address 10', '2023-06-10');
INSERT INTO Categories (id, name)
VALUES 
	('cat1', 'Category 1'),
	('cat2', 'Category 2'),
	('cat3', 'Category 3'),
	('cat4', 'Category 4'),
	('cat5', 'Category 5'),
	('cat6', 'Category 6'),
	('cat7', 'Category 7'),
	('cat8', 'Category 8'),
	('cat9', 'Category 9'),
	('cat10', 'Category 10');
INSERT INTO Products (name, price, createdate, brand, quantity, imgP, description, categoryId)
VALUES 
	('Product 1', 10.99, '2023-06-10', 'Brand 1', 5, 'image1.jpg', 'Description 1', 'cat1'),
	('Product 2', 20.99, '2023-06-10', 'Brand 2', 10, 'image2.jpg', 'Description 2', 'cat2'),
	('Product 3', 30.99, '2023-06-10', 'Brand 3', 15, 'image3.jpg', 'Description 3', 'cat3'),
	('Product 4', 40.99, '2023-06-10', 'Brand 4', 20, 'image4.jpg', 'Description 4', 'cat4'),
	('Product 5', 50.99, '2023-06-10', 'Brand 5', 25, 'image5.jpg', 'Description 5', 'cat5'),
	('Product 6', 60.99, '2023-06-10', 'Brand 6', 30, 'image6.jpg', 'Description 6', 'cat6'),
	('Product 7', 70.99, '2023-06-10', 'Brand 7', 35, 'image7.jpg', 'Description 7', 'cat7'),
	('Product 8', 80.99, '2023-06-10', 'Brand 8', 40, 'image8.jpg', 'Description 8', 'cat8'),
	('Product 9', 90.99, '2023-06-10', 'Brand 9', 45, 'image9.jpg', 'Description 9', 'cat9'),
	('Product 10', 100.99, '2023-06-10', 'Brand 10', 50, 'image10.jpg', 'Description 10', 'cat10');
INSERT INTO ProductDetail (productID, size, color)
VALUES 
	(1, 'S', 'Red'),
	(1, 'M', 'Blue'),
	(2, 'S', 'Green'),
	(2, 'L', 'Yellow'),
	(3, 'M', 'Orange'),
	(3, 'XL', 'Black'),
	(4, 'L', 'White'),
	(4, 'XL', 'Gray'),
	(5, 'S', 'Purple'),
	(5, 'M', 'Brown');
INSERT INTO ProductImg (productDetailID, img)
VALUES 
	(1, 'image1_1.jpg'),
	(1, 'image1_2.jpg'),
	(2, 'image2_1.jpg'),
	(2, 'image2_2.jpg'),
	(3, 'image3_1.jpg'),
	(3, 'image3_2.jpg'),
	(4, 'image4_1.jpg'),
	(4, 'image4_2.jpg'),
	(5, 'image5_1.jpg'),
	(5, 'image5_2.jpg');
INSERT INTO Favorite (productId, userID, reviews)
VALUES 
	(1, 1, 'Good product'),
	(2, 1, 'Nice color'),
	(3, 2, 'Fast shipping'),
	(4, 2, 'High quality'),
	(5, 3, 'Great value'),
	(6, 3, 'Recommended'),
	(7, 4, 'Excellent'),
	(8, 4, 'Satisfied'),
	(9, 5, 'Love it'),
	(10, 5, 'Perfect fit');
INSERT INTO OrdersDetails (orderId, productId, price, quantity, status)
VALUES 
	(1, 1, 10.99, 1, 1),
	(1, 2, 20.99, 2, 1),
	(2, 3, 30.99, 1, 1),
	(2, 4, 40.99, 1, 1),
	(3, 5, 50.99, 3, 1),
	(3, 6, 60.99, 2, 1),
	(4, 7, 70.99, 1, 1),
	(4, 8, 80.99, 2, 1),
	(5, 9, 90.99, 1, 1),
	(5, 10, 100.99, 3, 1);


