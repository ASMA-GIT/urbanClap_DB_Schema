create database UrbanClapData;
use  UrbanClapData;

-- GENDER TABLE
create table gender(g_id int primary key auto_increment, gender varchar(10));
insert into gender values(1,"Female"),(2 ,"Male"),(3 ,"Others");



-- table user details
create table User_data(user_id int primary key auto_increment, user_name varchar(30) not null, gender_id int not null,email_id varchar(30) not null unique key ,phone_no bigint not null unique key, address varchar(30) not null);
alter table User_data
add foreign key (gender_id) references gender(g_id);
insert into user_data values(23,"John",2,"john@gmail.com",8034527145,"address"),(24,"Cena",2,"Cena@gmail.com",8034327145,"address"),(25,"Emily",1,"emily@gmail.com",8124327145,"address3"),(26,"Joe",2,"joe@gmail.com",8034321145,"address"),(27,"virat",2,"virat@gmail.com",8034117145,"address4");



-- categories in services
create table service_type(service_type_id int primary key auto_increment,service_type_name varchar(30) not null);
insert into service_type values(52,"men's saloon"),(53,"Appliance reapair"),(54,"pest control"),(55,"elctrician"),(56,"house painters"),(57,"plumber"),(58,"carpenter"),(59,"cleaning");
insert into service_type values(51,"women's saloon");

-- service details
create table service(service_id int primary key auto_increment,service_name varchar(20) not null,service_type_id int not null,Price int not null);
insert into service values(61,"styling",51,3000),(62,"hair-cut",52,1000),(63,"refrigerator-repair",53,2500);
alter table service
add foreign key (service_type_id) references service_type(service_type_id);
alter table service
rename to service;


-- selected services details
create table selected_service(selected_service_id int primary key auto_increment,service_id int not null,service_name varchar(30),service_cost int,booking_id int not null,foreign key(booking_id) references booking(booking_id),foreign key(service_id) references service(service_id));
insert into selected_service values(11,61,"styling",3000,71),(12,63,"refrigerator-repair",2500,72);


-- payment details
create table payment_details(payment_details_id int primary key auto_increment,payment_type varchar(30));
insert into payment_details values(1,"credit card"),(2,"debit card"),(3,"upi"),(4,"COD");
alter table payment_details
rename to payment_method;


-- booking details
create table booking(booking_id int primary key auto_increment,user_id int not null,booking_date date not null,service_date date not null,payment_details_id int not null ,foreign key(user_id) references user_data(user_id),foreign key(payment_details_id) references payment_method(payment_details_id));
insert into booking values(71,23,'2023-01-12','2023-01-14',1),(72,23,'2023-02-12','2023-02-14',2),(73,24,'2023-01-12','2023-01-14',2);
show tables;


-- feedback details
create table feedback(fb_id int primary key auto_increment,booking_id int not null,description varchar(30),fb_datetime datetime,user_id int not null,service_id int not null,foreign key(service_id) references service(service_id),foreign key(booking_id) references booking(booking_id));
truncate table feedback; 
insert into feedback values(81,71,"good service",'2023-01-14 11:12:12',23,61);
insert into feedback values(82,72,"satisfactory",'2023-02-14 11:12:12',23,63);

alter table feedback
add foreign key (user_id) references User_data(user_id);