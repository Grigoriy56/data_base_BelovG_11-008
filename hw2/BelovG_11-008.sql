CREATE DATABASE hw2;
\c hw2;

create table app (
	name_app VARCHAR(50) NOT NULL PRIMARY KEY,
	clients_number INT,
	drivers_number INT,
	trips_numbers INT
);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Hatity', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Keylex', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Tresom', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Trippledex', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Sonsing', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Rank', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Voyatouch', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Konklux', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Bigtax', 1, 1, 1);
insert into app (name_app, clients_number, drivers_number, trips_numbers) values ('Bitchip', 1, 1, 1);

create table driver (
	id_driver INT NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	car_model VARCHAR(50),
	car_number VARCHAR(50),
	experience DECIMAL(3,1),
	rating DECIMAL(3,2),
	trip_number INT
);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values (1,  'Bunnie Grangier', 'Vibe', 'JN8AZ2KRXDT732078', 7.0, 4.35, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 2, 'Finley Vynall', 'Viper', 'WBAWV13558P599485', 7.2, 3.79, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 3, 'Robbie Marcham', 'Quattroporte', 'WA1WKBFP5AA364649', 4.1, 3.21, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 4, 'Weidar Longley', 'Xterra', 'WBAYB6C54ED677914', 9.2, 4.46, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 5, 'Erasmus Dewer', 'Trooper', 'WBSBL934X3J482602', 6.4, 4.19, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 6, 'Philippa Syrett', 'M', '5TFBW5F11BX387026', 6.2, 3.61, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 7, 'Charmain Kierans', 'Express 3500', 'WAUSF98E58A852777', 4.5, 3.67, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 8, 'Donal Kiddie', '2500', '1FTWW3DYXAE264645', 3.1, 3.8, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values ( 9, 'Rosaleen Ormes', 'Savana 3500', '3GYFNAE36FS020754', 5.9, 3.46, 1);
insert into driver (id_driver, name, car_model, car_number, experience, rating, trip_number) values (10, 'Sylas Menary', 'Q', '1C4RDHEG4FC576035', 8.5, 4.43, 1);

ALTER TABLE driver ADD name_app VARCHAR(50) REFERENCES app (name_app);

UPDATE driver SET name_app = 'Hatity' WHERE name = 'Bunnie Grangier';
UPDATE driver SET name_app = 'Keylex' WHERE name = 'Finley Vynall';
UPDATE driver SET name_app = 'Tresom' WHERE name = 'Robbie Marcham';
UPDATE driver SET name_app = 'Trippledex' WHERE name = 'Weidar Longley';
UPDATE driver SET name_app = 'Sonsing' WHERE name = 'Erasmus Dewer';
UPDATE driver SET name_app = 'Rank' WHERE name = 'Philippa Syrett';
UPDATE driver SET name_app = 'Voyatouch' WHERE name = 'Charmain Kierans';
UPDATE driver SET name_app = 'Konklux' WHERE name = 'Donal Kiddie';
UPDATE driver SET name_app = 'Bigtax' WHERE name = 'Rosaleen Ormes';
UPDATE driver SET name_app = 'Bitchip' WHERE name = 'Sylas Menary';
create table client (
	id_client INT NOT NULL PRIMARY KEY,
	full_name VARCHAR(50),
	trips_number INT,
	rating DECIMAL(3,2)
);
insert into client (id_client, full_name, trips_number, rating) values (1, 'Julian Dealtry', 1, 4.23);
insert into client (id_client, full_name, trips_number, rating) values (2, 'Lina Pinwell', 1, 4.96);
insert into client (id_client, full_name, trips_number, rating) values (3, 'Gerald Menis', 1, 4.15);
insert into client (id_client, full_name, trips_number, rating) values (4, 'Hershel Cordner', 1, 4.61);
insert into client (id_client, full_name, trips_number, rating) values (5, 'Harald Laidel', 1, 3.51);
insert into client (id_client, full_name, trips_number, rating) values (6, 'Vanni Yexley', 1, 4.84);
insert into client (id_client, full_name, trips_number, rating) values (7, 'Tessie Dmitrienko', 1, 4.58);
insert into client (id_client, full_name, trips_number, rating) values (8, 'Maxie Elwel', 1, 4.36);
insert into client (id_client, full_name, trips_number, rating) values (9, 'Alexandros Oliveras', 1, 3.08);
insert into client (id_client, full_name, trips_number, rating) values (10, 'Englebert Bicheno', 1, 4.53);

ALTER TABLE client ADD name_app VARCHAR(50) REFERENCES app (name_app);

UPDATE client SET name_app = 'Hatity' WHERE id_client = 1;
UPDATE client SET name_app = 'Keylex' WHERE id_client = 2;
UPDATE client SET name_app = 'Tresom' WHERE id_client = 3;
UPDATE client SET name_app = 'Trippledex' WHERE id_client = 4;
UPDATE client SET name_app = 'Sonsing' WHERE id_client = 5;
UPDATE client SET name_app = 'Rank' WHERE id_client = 6;
UPDATE client SET name_app = 'Voyatouch' WHERE id_client = 7;
UPDATE client SET name_app = 'Konklux' WHERE id_client = 8;
UPDATE client SET name_app = 'Bigtax' WHERE id_client = 9;
UPDATE client SET name_app = 'Bitchip' WHERE id_client = 10;

create table trip (
	id_trip INT,
	distance_km DECIMAL(4,2),
	time VARCHAR(50),
	price DECIMAL(5,2)
);
insert into trip (id_trip, distance_km, time, price) values (1, 8.03, '7:24', 176.46);
insert into trip (id_trip, distance_km, time, price) values (2, 14.94, '7:02', 376.2);
insert into trip (id_trip, distance_km, time, price) values (3, 3.98, '3:31', 139.3);
insert into trip (id_trip, distance_km, time, price) values (4, 10.7, '3:14', 336.63);
insert into trip (id_trip, distance_km, time, price) values (5, 5.16, '7:39', 392.79);
insert into trip (id_trip, distance_km, time, price) values (6, 14.17, '10:26', 126.24);
insert into trip (id_trip, distance_km, time, price) values (7, 3.54, '2:39', 250.05);
insert into trip (id_trip, distance_km, time, price) values (8, 14.47, '8:42', 196.18);
insert into trip (id_trip, distance_km, time, price) values (9, 8.54, '9:32', 438.69);
insert into trip (id_trip, distance_km, time, price) values (10, 12.36, '0:43', 393.02);

ALTER TABLE trip ADD name_app VARCHAR(50) REFERENCES app (name_app);

UPDATE trip SET name_app = 'Hatity' WHERE id_trip = 6;
UPDATE trip SET name_app = 'Keylex' WHERE id_trip = 5;
UPDATE trip SET name_app = 'Tresom' WHERE id_trip = 9;
UPDATE trip SET name_app = 'Trippledex' WHERE id_trip = 2;
UPDATE trip SET name_app = 'Sonsing' WHERE id_trip = 10;
UPDATE trip SET name_app = 'Rank' WHERE id_trip = 3;
UPDATE trip SET name_app = 'Voyatouch' WHERE id_trip = 4;
UPDATE trip SET name_app = 'Konklux' WHERE  id_trip = 8;
UPDATE trip SET name_app = 'Bigtax' WHERE  id_trip = 7;
UPDATE trip SET name_app = 'Bitchip' WHERE id_trip = 1;

ALTER TABLE trip ADD id_client INT REFERENCES client (id_client);

UPDATE trip SET id_client = 5 WHERE id_trip = 1;
UPDATE trip SET id_client = 4 WHERE id_trip = 2;
UPDATE trip SET id_client = 3 WHERE id_trip = 3;
UPDATE trip SET id_client = 2 WHERE id_trip = 4;
UPDATE trip SET id_client = 6 WHERE id_trip = 5;
UPDATE trip SET id_client = 1 WHERE id_trip = 6;
UPDATE trip SET id_client = 7 WHERE id_trip = 7;
UPDATE trip SET id_client = 8 WHERE id_trip = 8;
UPDATE trip SET id_client = 10 WHERE id_trip = 9;
UPDATE trip SET id_client = 9 WHERE id_trip = 10;

ALTER TABLE trip ADD id_driver INT REFERENCES driver (id_driver);

UPDATE trip SET id_driver = 4 WHERE id_trip = 2;
UPDATE trip SET id_driver = 3 WHERE id_trip = 3;
UPDATE trip SET id_driver = 2 WHERE id_trip = 4;
UPDATE trip SET id_driver = 5 WHERE id_trip = 1;
UPDATE trip SET id_driver = 6 WHERE id_trip = 5;
UPDATE trip SET id_driver = 1 WHERE id_trip = 6;
UPDATE trip SET id_driver = 7 WHERE id_trip = 7;
UPDATE trip SET id_driver = 8 WHERE id_trip = 8;
UPDATE trip SET id_driver = 10 WHERE id_trip = 9;
UPDATE trip SET id_driver = 9 WHERE id_trip = 10;