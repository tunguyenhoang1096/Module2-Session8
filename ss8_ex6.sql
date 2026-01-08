USE session08_db;
-- EX6: Stored Procedure sử dụng biến + CASE + Tham số OUT
DELIMITER //
    CREATE PROCEDURE sp_classify_student(IN  p_avg_score DECIMAL(4,2),OUT p_rank VARCHAR(20))
    BEGIN
        -- Biến trung gian
        DECLARE v_rank VARCHAR(20);
        -- Phân loại học lực bằng CASE
        SET v_rank = CASE
                     WHEN p_avg_score >= 8.0 THEN 'Giỏi'
                     WHEN p_avg_score >= 6.5 THEN 'Khá'
                     WHEN p_avg_score >= 5.0 THEN 'Trung bình'
                     ELSE 'Yếu'
        END;
        -- Gán kết quả cho tham số OUT
        SET p_rank = v_rank;
    END //
DELIMITER ;
CALL sp_classify_student(4.2, @result);
SELECT @result AS hoc_luc;
CALL sp_classify_student(5.8, @result);
SELECT @result AS hoc_luc;
CALL sp_classify_student(7.5, @result);
SELECT @result AS hoc_luc;
CALL sp_classify_student(8.7, @result);
SELECT @result AS hoc_luc;