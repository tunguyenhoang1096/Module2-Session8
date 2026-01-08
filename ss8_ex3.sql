USE session08_db;
-- EX3: Sử dụng biến trong Stored Procedure
-- Tạo bảng employees và thêm dữ liệu
CREATE TABLE employees(
    emp_id VARCHAR(10) PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL ,
    department VARCHAR(100) NOT NULL ,
    salary DECIMAL(10,0)
);
INSERT INTO employees
VALUES ('E01', 'Nguyễn Văn An', 'Kế toán', 12000000),
       ('E02', 'Trần Thị Bình', 'Nhân sự', 15000000),
       ('E03', 'Lê Văn Cường', 'IT', 20000000),
       ('E04', 'Phạm Thị Dung', 'Marketing', 18000000),
       ('E05', 'Hoàng Văn Em', 'Kinh doanh', 22000000);
-- Tạo thủ tục tính lương trung bình của toàn bộ nhân viên
DELIMITER //
    CREATE PROCEDURE get_avg_salary()
    BEGIN
        -- Khai báo biến
        DECLARE avg_salary DECIMAL(10,0);
        -- Gán gt cho biến
        SELECT  AVG(salary) INTO  avg_salary
        FROM employees;
        -- In biến
        SELECT avg_salary AS 'Luong TB';
    END //
DELIMITER ;
-- Gọi thủ tục
CALL get_avg_salary();
