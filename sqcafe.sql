-- Chạy file này trong MySQL Workbench / DBeaver
CREATE DATABASE IF NOT EXISTS coffee_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE coffee_db;

-- Bảng món uống (Version 1)
CREATE TABLE IF NOT EXISTS drinks (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(200)   NOT NULL,
    price       DECIMAL(10, 0) NOT NULL,
    category    VARCHAR(100),                       -- 'Cà phê', 'Trà', 'Sinh tố'
    available   TINYINT        NOT NULL DEFAULT 1,  -- 1 = còn hàng, 0 = hết
    created_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);

-- Dữ liệu mẫu để test ngay
INSERT INTO drinks (name, price, category, available) VALUES
('Cà phê đen',  25000, 'Cà phê',  1),
('Cà phê sữa',  30000, 'Cà phê',  1),
('Bạc xỉu',     28000, 'Cà phê',  1),
('Trà đào',     35000, 'Trà',     1),
('Trà xanh',    30000, 'Trà',     1),
('Sinh tố dâu', 45000, 'Sinh tố', 1),
('Nước cam',    30000, 'Nước ép', 1);