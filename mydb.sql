-- Create database (if not already created)
CREATE DATABASE real_estate_data;

-- Switch to the database
\c real_estate_data;

-- Create the table for the real estate ads
CREATE TABLE property_ads (
    id TEXT PRIMARY KEY,                       -- ID column (unique identifier)
    ad_type VARCHAR(100),                      -- Type of ad (e.g., "Propiedad")
    start_date DATE,                           -- Start date of the ad
    end_date DATE,                             -- End date of the ad
    created_on TIMESTAMP,                      -- Timestamp of ad creation
    lat FLOAT,                                 -- Latitude of the property
    lon FLOAT,                                 -- Longitude of the property
    l1 VARCHAR(255),                           -- Address level 1 (possibly street or region)
    l2 VARCHAR(255),                           -- Address level 2 (e.g., neighborhood)
    l3 VARCHAR(255),                           -- Address level 3 (sub-neighborhood or area)
    l4 VARCHAR(255),                           -- Further address information
    l5 VARCHAR(255),                           -- Further address information
    l6 FLOAT,                                  -- Some other geographic data
    rooms INT,                                 -- Number of rooms
    bedrooms INT,                              -- Number of bedrooms
    bathrooms INT,                             -- Number of bathrooms
    surface_total FLOAT,                       -- Total surface area (m2)
    surface_covered FLOAT,                     -- Covered surface area (m2)
    price DECIMAL(15, 2),                      -- Price of the property
    currency VARCHAR(10),                      -- Currency of the price (e.g., USD, EUR)
    price_period VARCHAR(20),                  -- Price period (e.g., monthly, one-time)
    title VARCHAR(255),                        -- Title of the property listing
    description TEXT,                          -- Detailed description of the property
    property_type VARCHAR(100),                -- Type of property (e.g., "Lote", "Casa")
    operation_type VARCHAR(100)                -- Operation type (e.g., "Venta", "Alquiler")
);

-- Example of inserting a sample record (you can insert many records at once)
INSERT INTO property_ads (
    id, ad_type, start_date, end_date, created_on, lat, lon, l1, l2, l3, l4, l5, l6,
    rooms, bedrooms, bathrooms, surface_total, surface_covered, price, currency, 
    price_period, title, description, property_type, operation_type
) 
VALUES (
    'wdQ5hWhv8P14T7Sh9g4QCg==', 'Propiedad', '2020-12-25', '2021-12-25', 
    '2020-12-25 12:00:00', -29.543326, -50.264793, 'Street 1', 'City', 'Region', 
    'Additional Info', 'Other Info', 6005, 10, 3, 1200, 950, 250000.00, 'USD', 
    'One-time', 'Luxury Property', 'Beautiful luxury property with amazing views.', 'Lote', 'Venta'
);
