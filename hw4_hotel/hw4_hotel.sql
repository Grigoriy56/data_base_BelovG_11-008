create database hw4_hotel;
\c hw4_hotel;

CREATE TABLE hotels (
      hotel_id SERIAL PRIMARY KEY NOT NULL,
      hotel_name VARCHAR (20) NOT NULL,
      address VARCHAR (20) NOT NULL,
      category VARCHAR (20)
);

CREATE TABLE posts (
      post_id SERIAL PRIMARY KEY NOT NULL,
      post_name VARCHAR (20)
);

CREATE TABLE guests (
      guest_id SERIAL PRIMARY KEY NOT NULL,
      guest_name VARCHAR (20),
      documents VARCHAR (20) NOT NULL,
      contacts VARCHAR (50)
);

CREATE TABLE rooms (
      room_id SERIAL PRIMARY KEY NOT NULL,
      number INT UNIQUE NOT NULL,
      number_of_beds INT,
      category VARCHAR (20),
      hotel_id INTEGER NOT NULL,
      FOREIGN KEY (hotel_id) REFERENCES hotels (hotel_id) ON DELETE CASCADE

);


CREATE TABLE employees (
    stuffer_id SERIAL PRIMARY KEY NOT NULL,
    employee_name VARCHAR (20),
    post_id INTEGER NOT NULL,
    hotel_id INTEGER NOT NULL,
    salary VARCHAR(10) NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts (post_id) ON DELETE SET NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels (hotel_id) ON DELETE CASCADE

);

CREATE TABLE cleanings (
      clean_id SERIAL NOT NULL,
      cleaning_time TIME,
      stuffer_id INTEGER,
      room_id INTEGER,
      FOREIGN KEY (stuffer_id) REFERENCES employees (stuffer_id) ON DELETE SET NULL,
      FOREIGN KEY (room_id) REFERENCES rooms (room_id) ON DELETE SET NULL

);

CREATE TABLE livings (
      living_id INT PRIMARY KEY NOT NULL,
      period INTERVAL NOT NULL,
      pay MONEY NOT NULL,
      guest_id INTEGER,
      room_id INTEGER,
      FOREIGN KEY (guest_id) REFERENCES guests (guest_id) ON DELETE  SET NULL,
      FOREIGN KEY (room_id) REFERENCES rooms (room_id) ON DELETE SET NULL
);

INSERT INTO hotels (hotel_id, hotel_name, address, category) VALUES (1, 'Kempinskiy', 'mis Kempnskiy', '5 stars');
INSERT INTO posts (post_id, post_name) VALUES (1, 'cleaner');
INSERT INTO guests (guest_id, guest_name, documents, contacts) VALUES (1, 'Amir', 'Pasport RF', '88005553535');
INSERT INTO rooms (room_id, number, number_of_beds, category, hotel_id) VALUES (1, 123, 4, 'luxury',
(SELECT hotel_id FROM hotels where hotel_id = 1));
INSERT INTO employees (stuffer_id, employee_name, post_id, salary, hotel_id) VALUES (1, 'Makar',
 (SELECT post_id from posts where post_name = 'cleaner'), '$30.0', (SELECT hotel_id FROM hotels where hotel_id = 1));
INSERT INTO cleanings (cleaning_time, stuffer_id, room_id)VALUES ('04:05 AM',
(SELECT stuffer_id from employees where employee_name = 'Makar'), (SELECT room_id from rooms where rooms.room_id = 1));
INSERT INTO livings (living_id, period, pay, guest_id, room_id) VALUES (1, '3 days', 3200,
(SELECT guest_id from guests where guests.guest_id = 1), (SELECT room_id from rooms where rooms.room_id = 1) );