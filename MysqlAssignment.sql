/*database creation*/

drop database if exists TravelOnTheGo;
create database TravelOnTheGo;

/*1) You are required to create two tables PASSENGER and PRICE with the following attributes and properties*/

drop table if exists TravelOnTheGo.PASSENGER;
create table TravelOnTheGo.PASSENGER(
Passenger_name varchar(255),
Category varchar(255),
Gender varchar(255),
Boarding_City varchar(255),
Destination_City varchar(255),
Distance int,
Bus_Type varchar(255));

drop table if exists TravelOnTheGo.PRICE;
create table TravelOnTheGo.PRICE(
Bus_Type varchar(255),
Distance int,
Price int);

/*2) Insert the following data in the tables*/

insert into TravelOnTheGo.PASSENGER values (
'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into TravelOnTheGo.PASSENGER values (
'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into TravelOnTheGo.PASSENGER values (
'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into TravelOnTheGo.PASSENGER values (
'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into TravelOnTheGo.PASSENGER values (
'Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into TravelOnTheGo.PASSENGER values (
'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into TravelOnTheGo.PASSENGER values (
'Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into TravelOnTheGo.PASSENGER values (
'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into TravelOnTheGo.PASSENGER values (
'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

commit;

insert into TravelOnTheGo.PRICE values (
'Sleeper',350,770);
insert into TravelOnTheGo.PRICE values (
'Sleeper',500,1100);
insert into TravelOnTheGo.PRICE values (
'Sleeper',600,1320);
insert into TravelOnTheGo.PRICE values (
'Sleeper',700,1540);
insert into TravelOnTheGo.PRICE values (
'Sleeper',1000,2200);
insert into TravelOnTheGo.PRICE values (
'Sleeper',1200,2640);
insert into TravelOnTheGo.PRICE values (
'Sleeper',1500,2700);
insert into TravelOnTheGo.PRICE values (
'Sitting',500,620);
insert into TravelOnTheGo.PRICE values (
'Sitting',600,744);
insert into TravelOnTheGo.PRICE values (
'Sitting',700,868);
insert into TravelOnTheGo.PRICE values (
'Sitting',1000,1240);
insert into TravelOnTheGo.PRICE values (
'Sitting',1200,1488);
insert into TravelOnTheGo.PRICE values (
'Sitting',1500,1860);

commit;

/*3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?*/

select count(1) as count, Gender from TravelOnTheGo.PASSENGER where Distance >= 600 group by Gender;

/*4) Find the minimum ticket price for Sleeper Bus.*/

select min(Price) from TravelOnTheGo.PRICE where Bus_Type = 'Sleeper';

/*5) Select passenger names whose names start with character 'S'*/

select Passenger_name from TravelOnTheGo.PASSENGER where Left(Passenger_name,1) = 'S';

/*6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output*/

select a.Passenger_name, a.Boarding_City, a.Destination_City, a.Bus_Type, b.Price from TravelOnTheGo.PASSENGER a, TravelOnTheGo.PRICE b where
a.Bus_Type = b.Bus_Type and
a.Distance = b.Distance;

/*7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
for a distance of 1000 KM s*/

select a.Passenger_name, b.Price from TravelOnTheGo.PASSENGER a, TravelOnTheGo.PRICE b where
a.Bus_Type = b.Bus_Type and
a.Distance = b.Distance and
a.Bus_Type = 'Sitting' and
a.distance <= 1000;

/*8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji?*/

select Bus_Type, Price from TravelOnTheGo.PRICE where Distance in (
select Distance from TravelOnTheGo.PASSENGER where Passenger_name = 'Pallavi');

/*9) List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order.*/

select distinct(Distance) from TravelOnTheGo.PASSENGER order by Distance desc;

/*10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables*/

select Passenger_name, (Distance/(select sum(Distance) from TravelOnTheGo.PASSENGER))*100 as percentage_travelled from TravelOnTheGo.PASSENGER;

/*11) Display the distance, price in three categories in table Price*/

select Distance, Price,
case
when Price >= 1000 then 'Expensive'
when Price < 1000 and Price > 500 then 'Average Cost'
else 'Cheap'
end as Price_category from TravelOnTheGo.PRICE;

