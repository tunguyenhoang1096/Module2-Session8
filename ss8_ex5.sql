USE session08_db;
-- EX5:  Stored Procedure sử dụng nhiều tham số và IF
DELIMITER //
    CREATE PROCEDURE sp_check_employee_income(IN p_full_name VARCHAR(100),IN p_salary DECIMAL(10,0))
    BEGIN
        DECLARE income_level VARCHAR(50);
        IF p_salary >= 15000000 THEN
            SET income_level = 'Thu nhập cao';
        ELSEIF p_salary >= 8000000 THEN
            SET income_level = 'Thu nhập trung bình';
        ELSE
            SET income_level = 'Thu nhập thấp';
        END IF;
        -- Hiển thị kết quả
        SELECT p_full_name AS ten_nhan_vien,
               income_level AS muc_thu_nhap;
    END //
DELIMITER ;
CALL sp_check_employee_income('Nguyễn Văn An', 18000000);
-- Thu nhập cao
CALL sp_check_employee_income('Trần Thị Bình', 12000000);
-- Thu nhập trung bình
CALL sp_check_employee_income('Lê Văn Cường', 6500000);
-- Thu nhập thấp