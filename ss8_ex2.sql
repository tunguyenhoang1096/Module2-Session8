USE session08_db;
-- EX2:  Stored Procedure có tham số in
-- Tạo bảng products và thêm dữ liệu
CREATE TABLE products(
    product_id VARCHAR(10) PRIMARY KEY ,
    product_name VARCHAR(100) NOT NULL UNIQUE ,
    product_price DECIMAL(5,2) NOT NULL ,
    product_type VARCHAR(100) NOT NULL
);
INSERT INTO products
VALUES ('P01', 'Laptop Dell Inspiron', 899.99, 'Laptop'),
       ('P02', 'Laptop HP Pavilion', 799.50, 'Laptop'),
       ('P03', 'iPhone 13', 999.00, 'Điện thoại'),
       ('P04', 'Samsung Galaxy S22', 850.00, 'Điện thoại'),
       ('P05', 'Tai nghe Sony WH-1000XM4', 299.99, 'Phụ kiện'),
       ('P06', 'Chuột Logitech MX Master 3', 129.50, 'Phụ kiện'),
       ('P07', 'Bàn phím cơ Keychron K6', 149.99, 'Phụ kiện'),
       ('P08', 'iPad Air 5', 699.00, 'Tablet'),
       ('P09', 'Apple Watch Series 8', 399.99, 'Thiết bị đeo'),
       ('P10', 'Màn hình LG UltraWide', 549.75, 'Màn hình');
-- Tạo thủ tục hiển thị sản phẩm theo loại sản phẩm
DELIMITER //
    CREATE PROCEDURE get_product_by_category(product_type_in VARCHAR(100))
    BEGIN
       SELECT * FROM products WHERE product_type = product_type_in;
    END //
// DELIMITER ;
-- Gọi thủ tục và truyền vào loại sản phẩm để hiển thị thông tin
CALL get_product_by_category('Điện Thoại');
