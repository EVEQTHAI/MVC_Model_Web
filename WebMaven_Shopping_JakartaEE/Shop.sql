
create table Accounts (
        User_Name varchar(20) not null,
        Active bit not null,
        Password varchar(20) not null,
        User_Role varchar(20) not null,
        primary key (User_Name)
    );

    create table Order_Details (
        ID varchar(50) not null,
        Amount double precision not null,
        Price double precision not null,
        Quanity int not null,
        ORDER_ID varchar(50) not null,
        PRODUCT_ID varchar(20) not null,
        primary key (ID)
    );

    create table Orders (
        ID varchar(50) not null,
        Amount double precision not null,
        Customer_Address varchar(255) not null,
        Customer_Email varchar(128) not null,
        Customer_Name varchar(255) not null,
        Customer_Phone varchar(128) not null,
        Order_Date datetime not null,
        primary key (ID)
    );
	




    create table Products (
        Code varchar(20) not null,
        Create_Date datetime not null,
        Image nvarchar(255),
        Name varchar(255) not null,
        Price double precision not null,
        primary key (Code)
    );

    alter table Order_Details
        add constraint ORDER_DETAIL_ORD_FK
        foreign key (ORDER_ID)
        references Orders;

    alter table Order_Details
        add constraint ORDER_DETAIL_PROD_FK
        foreign key (PRODUCT_ID)
        references Products;

---------------------------------------  
insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE)
values ('employee1', 1, '123', 'EMPLOYEE');

insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE)
values ('manager1', 1, '123', 'MANAGER');

----------------
insert into products (CODE, NAME, PRICE, CREATE_DATE,Image)
values ('S001', 'Dell-core i5', 1000, SYSDATETIME(),N'img\product01.png');
insert into products (CODE, NAME, PRICE, CREATE_DATE,Image)
values ('S002', 'Dell-core i6', 2000, SYSDATETIME(),N'img\product03.png');
insert into products (CODE, NAME, PRICE, CREATE_DATE,Image)
values ('S003', 'SONY-DIGIPHONE', 3000, SYSDATETIME(),N'img\product04.png');
insert into products (CODE, NAME, PRICE, CREATE_DATE,Image)
values ('S004', 'MSI-2019', 4000, SYSDATETIME(),N'img\product06.png');
insert into products (CODE, NAME, PRICE, CREATE_DATE,Image)
values ('S006', 'ASUS-Gaming', 5000, SYSDATETIME(),N'img\product08.png');


