
create table Account(
	username varchar(20) primary key,
	password varchar(30) not null,
	lastname nvarchar(100),
	isAdmin bit
)
insert into Account(username,password,lastname,isAdmin)
values ('hutruc','123456','Hu Truc','0')
insert into Account(username,password,lastname,isAdmin)
values ('naruto','123456','Na Ru To','1')
insert into Account(username,password,lastname,isAdmin)
values ('goku','123556','Go Ku','0')
insert into Account(username,password,lastname,isAdmin)
values ('luffy','123456','Lù Phe','0')


Create table Product (
	sku varchar(10) primary key,
	[name] nvarchar(50),
	price float,
	quantity int,
	status bit
)

insert into Product(sku,name,price,quantity,status)
values('00001','Servlet',10000,100,'1')
insert into Product(sku,name,price,quantity,status)
values('00002','Java',11000,90,'1')
insert into Product(sku,name,price,quantity,status)
values('00003','Tomcat',9000,80,'1')
insert into Product(sku,name,price,quantity,status)
values('00004','J2EE',15000,170,'1')
insert into Product(sku,name,price,quantity,status)
values('00005','Sun',90000,10,'1')


create table [Order](
	id int identity primary key,
	date datetime,
	total float
)

create table orderDetail(
	id int identity,
	skuDetail varchar(10),
	orderID int,
	price float,
	quantity int,
	foreign key (skuDetail) references Product(sku),
	foreign key(orderID) references [Order](id),
	primary key (id)
)
