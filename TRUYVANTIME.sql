DECLARE @datetime1 DATETIME = '2025-04-14 07:00:00';
DECLARE @datetime2 DATETIME = '2025-04-14 10:00:00';

SELECT 
    gv.HoTen AS [Họ tên GV],
    mh.TenMH AS [Môn dạy],
    tkb.GioVao,
    tkb.GioRa,
    tkb.NgayHoc
FROM 
    TKB tkb
JOIN 
    GiaoVien gv ON tkb.MaGV = gv.MaGV
JOIN 
    MonHoc mh ON tkb.MaMH = mh.MaMH
WHERE 
    -- Ghép Ngày + Giờ để so sánh datetime đầy đủ
    DATEADD(SECOND, DATEDIFF(SECOND, 0, tkb.GioVao), CAST(tkb.NgayHoc AS DATETIME)) <= @datetime2
    AND DATEADD(SECOND, DATEDIFF(SECOND, 0, tkb.GioRa), CAST(tkb.NgayHoc AS DATETIME)) >= @datetime1
