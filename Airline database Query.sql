USE AirlineReservation
go

create table Users (userid int not null identity(1,1)primary key, firstname nvarchar(50) not null,
 lastname nvarchar(50)not null,email nvarchar(320)not null,phone nvarchar(50) not null,DOB date not null,
 password nvarchar(max), isactive bit )
 go;

create table Admin (adminid int not null identity(1,1)primary key, email nvarchar(320)not null, password nvarchar(max), isactive bit )
go;

create table  flightInfo(flight_id int not null identity(1000,1) primary key,flight_number int not null, 
Departure nvarchar(50) not null,Arrival nvarchar(50) not null,Dept_date datetime not null,arrival_date datetime not null,isactive bit)
go;

create table seats(seats_id int not null identity(8100,1) primary key, class nvarchar(50) not null,seat int not null,price money not null, 
flight_id int not null foreign key references flightInfo(flight_id))
go;

create table passenger (pass_id int not null identity(4897,1) primary key, firstname nvarchar(50) not null,
lastname nvarchar(50) not null, gender nvarchar(50) not null, age int not null, 
userid int not null foreign key references  Users(userid), 
seats_id int not null foreign key references seats(seats_id))


create table Tickets(Ticket_id int not null identity(13693836, 1)primary key,ticket_status bit,
flight_id int not null foreign key references flightInfo(flight_id),
seats_id int not null foreign key references seats(seats_id),
pass_id int not null foreign key references passenger(pass_id));

create table payment(pay_id bigint not null identity(165367448364,1)primary key,
card_no bigint not null, validity date not null,cvv int not null,amount money,tran_status bit,
userid int not null foreign key references  Users(userid));

create table flightdetails(flight_number int not null primary key,flight_model nvarchar(50),flight_range nvarchar(50));

ALTER TABLE flightInfo
ADD FOREIGN KEY (flight_number) REFERENCES flightdetails(flight_number);

alter table flightInfo
add Buisness int  check(Buisness >0)

alter table flightInfo
add Economy  int not null check(Economy >0)

alter table seats
drop column seat;