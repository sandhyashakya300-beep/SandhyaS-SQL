CREATE DATABASE  airbnb_analytics;
USE airbnb_analytics;

-- Dimension: Hosts
CREATE TABLE hosts_ (
    host_id INT PRIMARY KEY,
    host_name VARCHAR(100),
    is_superhost VARCHAR(10) -- 'Yes' or 'No'
);

-- Dimension: Properties
CREATE TABLE properties (
    property_id INT PRIMARY KEY,
    property_type VARCHAR(50),
    neighborhood VARCHAR(100)
);

-- Dimension: Guests
CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(100),
    age_group VARCHAR(20), -- e.g., '18-25', '26-35', etc.
    nationality VARCHAR(50)
);

-- Fact Table: Bookings
CREATE TABLE fact_bookings (
    booking_id INT PRIMARY KEY,
    property_id INT,
    guest_id INT,
    host_id INT,
    booking_date DATE,
    price_per_night DECIMAL(10, 2),
    nights_stayed INT,
    total_revenue DECIMAL(10, 2),
    rating DECIMAL(3, 2),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (host_id) REFERENCES hosts_(host_id)
);

-- Insert data into Dimension: Hosts
INSERT INTO hosts_ (host_id, host_name, is_superhost) VALUES
(101, 'Rajesh Kumar', 'Yes'),
(102, 'Priya Sharma', 'No'),
(103, 'Amit Patel', 'Yes'),
(104, 'Sneha Reddy', 'No'),
(105, 'Rahul Sharma', 'Yes');

-- Insert data into Dimension: Properties
INSERT INTO properties (property_id, property_type, neighborhood) VALUES
(201, 'Entire Apartment', 'Downtown'),
(202, 'Private Room', 'Suburbs'),
(203, 'Villa', 'Beachside'),
(204, 'Entire Apartment', 'Midtown'),
(205, 'Condo', 'Downtown');

-- Insert data into Dimension: Guests
INSERT INTO guests (guest_id, guest_name, age_group, nationality) VALUES
(301, 'John Doe', '18-25', 'USA'),
(302, 'Yuki Tanaka', '26-35', 'Japan'),
(303, 'Carlos Silva', '36-50', 'Brazil'),
(304, 'Sarah Jenkins', '26-35', 'UK'),
(305, 'Liam O\'Connor', '50+', 'Ireland');


-- Insert data into Fact Table: Bookings
INSERT INTO fact_bookings (booking_id, property_id, guest_id, host_id, booking_date, price_per_night, nights_stayed, total_revenue, rating) VALUES
(1, 201, 301, 101, '2026-05-01', 120.00, 3, 360.00, 4.8),
(2, 202, 302, 102, '2026-05-03', 50.00,  5, 250.00, 4.2),
(3, 203, 303, 103, '2026-05-10', 350.00, 2, 700.00, 4.9),
(4, 204, 304, 101, '2026-05-12', 150.00, 4, 600.00, 4.6),
(5, 205, 305, 104, '2026-05-15', 200.00, 2, 400.00, 3.9),
(6, 201, 303, 101, '2026-05-18', 120.00, 1, 120.00, 4.7);

-- Host Success - Superhosts and total bookings recevied
SELECT 
    h.host_id,
    h.host_name,
    h.is_superhost,
    COUNT(b.booking_id) AS total_bookings_received
FROM fact_bookings b
JOIN hosts_ h ON b.host_id = h.host_id
GROUP BY h.host_id, h.host_name, h.is_superhost
ORDER BY total_bookings_received DESC;

-- property revenue - revenue by property type 
SELECT 
    p.property_type,
    SUM(b.total_revenue) AS total_revenue_generated
FROM fact_bookings b
JOIN properties p ON b.property_id = p.property_id
GROUP BY p.property_type
ORDER BY total_revenue_generated DESC;

-- Guest Demographics - Average booking price by age group 
SELECT 
    g.age_group,
    ROUND(AVG(b.total_revenue), 2) AS average_booking_price
FROM fact_bookings b
JOIN guests g ON b.guest_id = g.guest_id
GROUP BY g.age_group
ORDER BY g.age_group ASC;

-- Booking Origin - Total Bookings By nationality
SELECT 
    n.nationality,
    COUNT(b.booking_id) AS total_bookings
FROM fact_bookings b
JOIN guests n ON b.guest_id = n.guest_id
GROUP BY n.nationality
ORDER BY total_bookings DESC;

-- Rating Analysis - Properties with averages ratings above 4.5
SELECT 
    b.property_id,
    l.property_type,
    ROUND(AVG(b.rating), 2) AS average_rating
FROM fact_bookings b
JOIN properties l ON b.property_id = l.property_id
GROUP BY b.property_id, l.property_type
HAVING AVG(b.rating) > 4.5
ORDER BY average_rating DESC;