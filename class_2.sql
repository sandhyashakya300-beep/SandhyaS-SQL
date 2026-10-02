create DATABASE Car_Service_center;

USE Car_Service_center;

CREATE TABLE car_service(
    car_id int PRIMARY KEY,
    car_name varchar(344),
    car_model varchar(333),
    service_type varchar(455),
    service_date DATE NOT NULL,
    mechanic_name varchar(322),
    service_cost DECIMAL(10,2),
    fuel_type varchar(23),
    car_color varchar(34),
    car_number varchar(20),
    engine_type TEXT

);

INSERT INTO car_service (
    car_id, 
    car_name, 
    car_model, 
    service_type, 
    service_date, 
    mechanic_name, 
    service_cost, 
    fuel_type, 
    car_color, 
    car_number, 
    engine_type
) 
VALUES 
    (1, 'Toyota', 'Corolla', 'Battery Replacement', '2026-09-01', 'John Doe', 120.00, 'Petrol', 'Blue', 'MH-12-AB-1234', 'Inline 4'),
    (2, 'Hyundai', 'i20', 'Oil Change', '2026-09-02', 'Jane Smith', 45.50, 'Petrol', 'White', 'MH-14-CD-5678', 'Inline 4'),
    (3, 'Maruti Suzuki', 'Swift', 'Wheel Alignment', '2026-09-03', 'Mike Johnson', 30.00, 'Diesel', 'Red', 'DL-01-EF-9012', 'Inline 4'),
    (4, 'Honda', 'City', 'AC Service', '2026-09-04', 'David Lee', 85.00, 'Petrol', 'Silver', 'KA-03-GH-3456', 'i-VTEC'),
    (5, 'Ford', 'EcoSport', 'Brake Pad Replacement', '2026-09-05', 'Sarah Connor', 110.25, 'Diesel', 'Black', 'TN-09-IJ-7890', 'TDCi'),
    (6, 'Volkswagen', 'Polo', 'Engine Tuning', '2026-09-06', 'John Doe', 150.00, 'Petrol', 'Red', 'GJ-05-KL-1122', 'TSI'),
    (7, 'Tata', 'Nexon', 'Full Wash & Polish', '2026-09-07', 'Jane Smith', 40.00, 'EV', 'Green', 'MH-12-MN-3344', 'Electric Motor'),
    (8, 'Mahindra', 'Thar', 'Suspension Check', '2026-09-08', 'Mike Johnson', 200.00, 'Diesel', 'Black', 'UP-14-OP-5566', 'mHawk'),
    (9, 'Kia', 'Seltos', 'Oil Change', '2026-09-09', 'David Lee', 55.00, 'Diesel', 'White', 'HR-26-QR-7788', 'CRDi'),
    (10, 'MG', 'Hector', 'Transmission Fluid', '2026-09-10', 'Sarah Connor', 95.50, 'Petrol', 'Burgundy', 'KA-01-ST-9900', 'Turbocharged'),
    (11, 'Renault', 'Duster', 'Wiper Blade Replacement', '2026-09-11', 'John Doe', 15.00, 'Petrol', 'Orange', 'MH-43-UV-1234', 'Inline 4'),
    (12, 'Skoda', 'Slavia', 'Battery Replacement', '2026-09-12', 'Jane Smith', 130.00, 'Petrol', 'Blue', 'DL-04-WX-5678', 'TSI'),
    (13, 'Jeep', 'Compass', 'Wheel Alignment', '2026-09-13', 'Mike Johnson', 35.00, 'Diesel', 'Grey', 'UP-16-YZ-9012', 'Multijet'),
    (14, 'Toyota', 'Fortuner', 'Major Service', '2026-09-14', 'David Lee', 350.00, 'Diesel', 'White', 'GJ-01-AB-3456', 'D-4D'),
    (15, 'Honda', 'Amaze', 'AC Service', '2026-09-15', 'Sarah Connor', 75.00, 'Petrol', 'Silver', 'HR-98-CD-7890', 'i-VTEC'),
    (16, 'Hyundai', 'Creta', 'Brake Pad Replacement', '2026-09-16', 'John Doe', 115.00, 'Petrol', 'Black', 'MH-12-EF-1122', 'MPi'),
    (17, 'Maruti Suzuki', 'Baleno', 'Oil Change', '2026-09-17', 'Jane Smith', 48.00, 'Petrol', 'Blue', 'TN-01-GH-3344', 'VVT'),
    (18, 'Tata', 'Harrier', 'Clutch Plate Replacement', '2026-09-18', 'Mike Johnson', 420.00, 'Diesel', 'Camo Green', 'KA-05-IJ-5566', 'Kryotec'),
    (19, 'Nissan', 'Magnite', 'Spark Plug Replacement', '2026-09-19', 'David Lee', 60.00, 'Petrol', 'Red', 'DL-10-KL-7788', 'Turbo'),
    (20, 'BMW', '3 Series', 'General Inspection', '2026-09-20', 'Sarah Connor', 250.00, 'Petrol', 'Black', 'MH-01-MN-9900', 'TwinPower Turbo');


    Create TABLE owner(
        owner_id int PRIMARY KEY,
        car_id int,
        owner_name varchar(366)
    );


    INSERT INTO owner (owner_id, car_id, owner_name) 
VALUES 
    (101, 1, 'Dr.Sachin saxena'),
    (102, 2, 'Sandhya Shakya'),
    (103, 3, 'Amit Kumar'),
    (104, 4, 'Bhuvnesh Kumar'),
    (105, 5, 'Deepak Kumar'),
    (106, 6, 'Anjali Verma'),
    (107, 7, 'Rohan Kapoor'),
    (108, 8, 'Sneha Iyer'),
    (109, 9, 'Karan Malhotra'),
    (110, 10, 'Pooja Reddy'),
    (111, 11, 'Siddharth Joshi'),
    (112, 12, 'Kavita Nair'),
    (113, 13, 'Rajesh Kumar'),
    (114, 14, 'Meera Menon'),
    (115, 15, 'Arun Prakash'),
    (116, 16, 'Divya Pillai'),
    (117, 17, 'Suresh Babu'),
    (118, 18, 'Anita Das'),
    (119, 19, 'Manish Tiwari'),
    (200, 20, 'Preeti Jain');

    SELECT * FROM owner;

alter table owner ADD DOB int;

select *  from owner;

update owner set DOB =1990 WHERE owner_id = 101;

select AVG(car_model)from car_service;

select * from car_service;

select * from owner 
where owner_name LIKE 'R%';


select * from owner o , car_service cs
where o.car_id = cs.car_id;

select * from owner o 
Inner join car_service cs on o.car_id = cs.car_id;

