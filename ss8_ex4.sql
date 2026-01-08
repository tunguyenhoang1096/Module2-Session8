USE session08_db;
-- EX4: Stored Procedure có câu lệnh điều kiện IF
CREATE TABLE orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    total DECIMAL(10,0) NOT NULL
);
INSERT INTO orders(total)
VALUES ('10000'),
       ('15000'),
       ('39000'),
       ('23000'),
       ('30000');
/*
Hệ thống cần kiểm tra giá trị đơn hàng:
nếu tổng tiền lớn hơn hoặc bằng 5.000.000 → đơn hàng giá trị cao
ngược lại → đơn hàng bình thường
 */
DELIMITER //
    CREATE PROCEDURE sp_check_order_value(IN p_total DECIMAL(12,0))
    BEGIN
        IF p_total >= 5000000 THEN
            SELECT 'Đơn hàng giá trị cao' AS message;
        ELSE
            SELECT 'Đơn hàng bình thường' AS message;
        END IF;
    END //
DELIMITER ;
CALL sp_check_order_value(7000000);
-- Đơn hàng giá trị cao
CALL sp_check_order_value(3200000);
-- Đơn hàng bình thường