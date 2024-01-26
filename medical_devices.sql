/*
@authors: Kamil Kubiak & Radoslaw Plawecki
*/

DROP DATABASE IF EXISTS medical_devices;
CREATE DATABASE medical_devices;

USE medical_devices;

CREATE TABLE devices(
	device_id INT PRIMARY KEY,
    device_name VARCHAR(50) NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    production_date DATE NOT NULL,
    last_service DATE NOT NULL,
    device_status ENUM('FREE', 'BUSY'),
    service_period INT UNSIGNED NOT NULL
);

CREATE TABLE service_history(
	service_id INT PRIMARY KEY,
    service_date DATE NOT NULL,
    serviced_device INT NOT NULL,
    FOREIGN KEY (serviced_device) REFERENCES devices(device_id),
    service_technician VARCHAR(50) NOT NULL,
    service_description TEXT
);

CREATE TABLE reservations(
	reservation_id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reserved_device INT NOT NULL,
    FOREIGN KEY (reserved_device) REFERENCES devices(device_id),
    reserving_person VARCHAR(50) NOT NULL
);
