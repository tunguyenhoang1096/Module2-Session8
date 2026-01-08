CREATE DATABASE session08_db;
USE session08_db;
-- EX1: Stored Procedure không có tham số
-- Tạo bảng students và thêm dữ liệu
CREATE TABLE students(
    student_id VARCHAR(10) PRIMARY KEY ,
    student_name VARCHAR(100) NOT NULL ,
    class VARCHAR(100) NOT NULL ,
    avg_score FLOAT NOT NULL
);
INSERT INTO students
VALUES ('SV01', 'Nguyễn Văn An', 'CNTT1', 4.2),
       ('SV02', 'Trần Thị Bình', 'CNTT1', 5.0),
       ('SV03', 'Lê Văn Cường', 'CNTT2', 5.8),
       ('SV04', 'Phạm Thị Dung', 'CNTT2', 6.4),
       ('SV05', 'Hoàng Văn Em', 'QTKD1', 6.9),
       ('SV06', 'Vũ Thị Hoa', 'QTKD1', 7.5),
       ('SV07', 'Đặng Văn Long', 'QTKD2', 7.9),
       ('SV08', 'Bùi Thị Mai', 'QTKD2', 8.2),
       ('SV09', 'Ngô Văn Nam', 'KT1', 8.7),
       ('SV10', 'Đỗ Thị Oanh', 'KT1', 9.1);
-- Tạo thủ tục lấy tất cả thông tin của sinh viên
DELIMITER //
    CREATE PROCEDURE get_all_students()
    BEGIN
        SELECT * FROM students;
    END
// DELIMITER ;
-- Gọi thủ tục hiển thị thông tin
CALL get_all_students();