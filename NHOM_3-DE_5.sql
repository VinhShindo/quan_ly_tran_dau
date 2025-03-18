CREATE DATABASE QLTD

USE QLTD

BEGIN -- CREATE TABLE
	CREATE TABLE DoiBong (
		MaDoiBong CHAR(10) PRIMARY KEY,
		TenDoiBong NVARCHAR(100) NOT NULL
	);

	CREATE TABLE ViTriChoi (
		MaViTri CHAR(10) PRIMARY KEY,
		TenViTri NVARCHAR(100) NOT NULL
	);

	CREATE TABLE CauThu (
		MaCauThu CHAR(10) PRIMARY KEY,
		TenCauThu NVARCHAR(100) NOT NULL,
		SoAo INT NOT NULL,
		ViTriChoi CHAR(10),
		FOREIGN KEY (ViTriChoi) REFERENCES ViTriChoi(MaViTri)
	);

	CREATE TABLE TranDau (
		MaTranDau CHAR(10) PRIMARY KEY,
		NgayThiDau DATE NOT NULL,
		ThoiGianThiDau TIME(0) NOT NULL,
		DiaDiem NVARCHAR(MAX) NOT NULL
	);

	CREATE TABLE CauThuDoiBong (
		MaDoiBong CHAR(10),
		MaCauThu CHAR(10),
		FOREIGN KEY (MaDoiBong) REFERENCES DoiBong(MaDoiBong),
		FOREIGN KEY (MaCauThu) REFERENCES CauThu(MaCauThu)
	);

	CREATE TABLE ChiTietTranDau (
		MaDoiBong CHAR(10) NOT NULL,
		MaTranDau CHAR(10) NOT NULL,
		SoBanGhiDuoc INT,
		CoPhaiDoiNhaKhong CHAR(1) NOT NULL,
		KetQua NVARCHAR(MAX) NOT NULL,
		FOREIGN KEY (MaDoiBong) REFERENCES DoiBong(MaDoiBong),
		FOREIGN KEY (MaTranDau) REFERENCES TranDau(MaTranDau)
	);

	CREATE TABLE ThanhTich (
		MaCauThu CHAR(10),
		MaTranDau CHAR(10),
		SoBanGhiDuoc INT,
		FOREIGN KEY (MaCauThu) REFERENCES CauThu(MaCauThu),
		FOREIGN KEY (MaTranDau) REFERENCES TranDau(MaTranDau)
	);
END
GO

BEGIN -- INSERT
	--	Bảng DoiBong
	INSERT INTO DoiBong (MaDoiBong, TenDoiBong)
	VALUES ('DB001', 'Hà Nội FC');
	--	Bảng ViTriChoi
	INSERT INTO ViTriChoi (MaViTri, TenViTri)
	VALUES ('VT001', 'Tiền đạo');
	--	Bảng CauThu
	INSERT INTO CauThu (MaCauThu, TenCauThu, SoAo, ViTriChoi)
	VALUES ('CT001', 'Nguyễn Văn A', 10, 'VT001');
	--	Bảng TranDau
	INSERT INTO TranDau (MaTranDau, NgayThiDau, ThoiGianThiDau, DiaDiem)
	VALUES ('TD001', '2025-02-20', '15:30:00', 'Sân Mỹ Đình');
	--	Bảng CauThuDoiBong
	INSERT INTO CauThuDoiBong (MaDoiBong, MaCauThu)
	VALUES ('DB001', 'CT001');
	--	Bảng ChiTietTranDau
	INSERT INTO ChiTietTranDau (MaDoiBong, MaTranDau, SoBanGhiDuoc, CoPhaiDoiNhaKhong, KetQua)
	VALUES ('DB001', 'TD001', 3, 'Y', 'Hà Nội FC thắng 3-1');
	--	Bảng ThanhTich
	INSERT INTO ThanhTich (MaCauThu, MaTranDau, SoBanGhiDuoc)
	VALUES ('CT001', 'TD001', 2);
END
GO

BEGIN -- UPDATE
	-- Bảng DoiBong
	UPDATE DoiBong
	SET TenDoiBong = 'Hồ Chí Minh FC'
	WHERE MaDoiBong = 'DB001';
	--	Bảng ViTriChoi
	UPDATE ViTriChoi
	SET TenViTri = 'Hậu vệ'
	WHERE MaViTri = 'VT001';
	--	Bảng CauThu
	UPDATE CauThu
	SET TenCauThu = 'Nguyễn Văn B', SoAo = 9, ViTriChoi = 'VT002'
	WHERE MaCauThu = 'CT001';
	--	Bảng TranDau
	UPDATE TranDau
	SET NgayThiDau = '2025-02-22', ThoiGianThiDau = '18:00:00', DiaDiem = 'Sân Thống Nhất'
	WHERE MaTranDau = 'TD001';
	--	Bảng CauThuDoiBong
	UPDATE CauThuDoiBong
	SET MaDoiBong = 'DB002'
	WHERE MaCauThu = 'CT001';
	--	Bảng ChiTietTranDau
	UPDATE ChiTietTranDau
	SET SoBanGhiDuoc = 4, KetQua = 'Hà Nội FC thắng 4-1'
	WHERE MaDoiBong = 'DB001' AND MaTranDau = 'TD001';
	--	Bảng ThanhTich
	UPDATE ThanhTich
	SET SoBanGhiDuoc = 3
	WHERE MaCauThu = 'CT001' AND MaTranDau = 'TD001';
END
GO

BEGIN -- DELETE
	--	Bảng DoiBong
	DELETE FROM DoiBong
	WHERE MaDoiBong = 'DB001';
	--	Bảng ViTriChoi
	DELETE FROM ViTriChoi
	WHERE MaViTri = 'VT001';
	--	Bảng CauThu
	DELETE FROM CauThu
	WHERE MaCauThu = 'CT001';
	--	Bảng TranDau
	DELETE FROM TranDau
	WHERE MaTranDau = 'TD001';
	--	Bảng CauThuDoiBong
	DELETE FROM CauThuDoiBong
	WHERE MaDoiBong = 'DB001' AND MaCauThu = 'CT001';
	--	Bảng ChiTietTranDau
	DELETE FROM ChiTietTranDau
	WHERE MaDoiBong = 'DB001' AND MaTranDau = 'TD001';
	--	Bảng ThanhTich
	DELETE FROM ThanhTich
	WHERE MaCauThu = 'CT001' AND MaTranDau = 'TD001';
END
GO

BEGIN -- SELECT
	-- BẢNG ĐỘI BÓNG
	SELECT * FROM DoiBong

	SELECT * FROM DoiBong
	WHERE MaDoiBong = 'DB1'
	-- BẢNG VITRICHOI
	SELECT * FROM ViTriChoi

	SELECT * FROM ViTriChoi
	WHERE MaViTri = 'VT1'
	-- BẢNG CAUTHU
	SELECT * FROM CauThu

	SELECT TenCauThu, SoAo FROM CauThu
	WHERE MaCauThu LIKE 'HN%'
	-- BẢNG TRANDAU
	SELECT * FROM TranDau

	SELECT NgayThiDau, ThoiGianThiDau, DiaDiem FROM TranDau
	WHERE MaTranDau = 'TD3'
	-- BẢNG CAUTHUDOIBONG
	SELECT * FROM CauThuDoiBong

	SELECT MaCauThu FROM CauThuDoiBong
	WHERE MaDoiBong = 'DB5'
	-- BẢNG CHITIETTRANDAU
	SELECT * FROM ChiTietTranDau

	SELECT SoBanGhiDuoc, KetQua FROM ChiTietTranDau
	WHERE MaTranDau = 'TD1'
	-- BẢNG THANHTICH
	SELECT * FROM ThanhTich

	SELECT SoBanGhiDuoc FROM ThanhTich
	WHERE MaCauThu = 'HG8' AND MaTranDau = 'TD10'


	-- SELECT NÂNG CAO
	-- BẢNG ĐỘI BÓNG
	-- Kết hợp bảng DoiBong và bảng CauThu để lấy tên đội bóng và tên cầu thủ
	SELECT DoiBong.TenDoiBong, CauThu.TenCauThu
	FROM DoiBong
	INNER JOIN CauThuDoiBong ON DoiBong.MaDoiBong = CauThuDoiBong.MaDoiBong
	INNER JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu;
	-- Nhóm các đội bóng và chỉ lấy những đội có hơn 10 cầu thủ
	SELECT DoiBong.TenDoiBong, COUNT(CauThu.MaCauThu) AS SoCauThu
	FROM DoiBong
	INNER JOIN CauThuDoiBong ON DoiBong.MaDoiBong = CauThuDoiBong.MaDoiBong
	INNER JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu
	GROUP BY DoiBong.TenDoiBong
	HAVING COUNT(CauThu.MaCauThu) > 10;

	-- BẢNG VỊ TRÍ CHƠI
	-- Lấy vị trí và thông tin cầu thủ ở vị trí đó
	SELECT ViTriChoi.TenViTri, CauThu.TenCauThu
	FROM ViTriChoi
	INNER JOIN CauThu ON ViTriChoi.MaViTri = CauThu.ViTriChoi;
	--Nhóm theo vị trí và chỉ lấy các vị trí có ít nhất 5 cầu thủ
	SELECT ViTriChoi.TenViTri, COUNT(CauThu.MaCauThu) AS SoCauThu
	FROM ViTriChoi
	INNER JOIN CauThu ON ViTriChoi.MaViTri = CauThu.ViTriChoi
	GROUP BY ViTriChoi.TenViTri
	HAVING COUNT(CauThu.MaCauThu) >= 5;

	-- BẢNG CẦU THỦ
	-- Lấy thông tin cầu thủ và đội bóng của họ
	SELECT CauThu.TenCauThu, DoiBong.TenDoiBong
	FROM CauThu
	INNER JOIN CauThuDoiBong ON CauThu.MaCauThu = CauThuDoiBong.MaCauThu
	INNER JOIN DoiBong ON CauThuDoiBong.MaDoiBong = DoiBong.MaDoiBong;
	-- Nhóm theo cầu thủ và chỉ lấy cầu thủ ghi được hơn 3 bàn thắng
	SELECT CauThu.TenCauThu, SUM(ThanhTich.SoBanGhiDuoc) AS TongSoBan
	FROM CauThu
	INNER JOIN ThanhTich ON CauThu.MaCauThu = ThanhTich.MaCauThu
	GROUP BY CauThu.TenCauThu
	HAVING SUM(ThanhTich.SoBanGhiDuoc) > 3;

	-- BẢNG TRẬN ĐẤU
	-- Lấy thông tin trận đấu và đội bóng tham gia
	SELECT TranDau.MaTranDau, DoiBong.TenDoiBong
	FROM TranDau
	INNER JOIN ChiTietTranDau ON TranDau.MaTranDau = ChiTietTranDau.MaTranDau
	INNER JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong;
	-- Nhóm theo trận đấu và chỉ lấy những trận đấu có kết quả là hòa
	SELECT TranDau.MaTranDau, ChiTietTranDau.KetQua
	FROM TranDau
	INNER JOIN ChiTietTranDau ON TranDau.MaTranDau = ChiTietTranDau.MaTranDau
	GROUP BY TranDau.MaTranDau, ChiTietTranDau.KetQua
	HAVING ChiTietTranDau.KetQua LIKE '%Hòa%';

	-- BẢNG CẦU THỦ ĐỘI BÓNG
	-- Lấy tên đội bóng và tên cầu thủ từ bảng CauThuDoiBong
	SELECT DoiBong.TenDoiBong, CauThu.TenCauThu
	FROM CauThuDoiBong
	INNER JOIN DoiBong ON CauThuDoiBong.MaDoiBong = DoiBong.MaDoiBong
	INNER JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu;
	-- Lấy tên đội bóng có ít nhất 5 cầu thủ
	SELECT DoiBong.TenDoiBong
	FROM DoiBong
	WHERE DoiBong.MaDoiBong IN (
		SELECT MaDoiBong
		FROM CauThuDoiBong
		GROUP BY MaDoiBong
		HAVING COUNT(MaCauThu) >= 5
	);

	-- BẢNG CHI TIẾT TRẬN ĐẤU
	-- Lấy thông tin chi tiết trận đấu với tên đội bóng
	SELECT ChiTietTranDau.MaTranDau, DoiBong.TenDoiBong, ChiTietTranDau.KetQua
	FROM ChiTietTranDau
	INNER JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong;
	-- Nhóm các trận đấu theo đội bóng và lấy những trận có kết quả "THUA"
	SELECT DoiBong.TenDoiBong, COUNT(ChiTietTranDau.MaTranDau) AS SoTranThang
	FROM ChiTietTranDau
	INNER JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong
	WHERE ChiTietTranDau.KetQua LIKE '%thua%'
	GROUP BY DoiBong.TenDoiBong
	HAVING COUNT(ChiTietTranDau.MaTranDau) >= 3;

	-- BẢNG THÀNH TÍCH
	-- Lấy tên cầu thủ có tổng số bàn ghi được lớn hơn 4
	SELECT CauThu.TenCauThu
	FROM CauThu
	WHERE CauThu.MaCauThu IN (
		SELECT MaCauThu
		FROM ThanhTich
		GROUP BY MaCauThu
		HAVING SUM(ThanhTich.SoBanGhiDuoc) > 4
	);
	-- Nhóm các cầu thủ và lấy những cầu thủ ghi được nhiều hơn 5 bàn
	SELECT CauThu.TenCauThu, SUM(ThanhTich.SoBanGhiDuoc) AS TongSoBan
	FROM ThanhTich
	INNER JOIN CauThu ON ThanhTich.MaCauThu = CauThu.MaCauThu
	GROUP BY CauThu.TenCauThu
	HAVING SUM(ThanhTich.SoBanGhiDuoc) > 4;
END
GO

-- XÂY DỰNG CÁC VIEW
--	Bảng DoiBong
-- Danh sách các đội bóng cùng với tổng số cầu thủ của mỗi đội bóng
GO
CREATE VIEW View_DoiBong_TongCauThu AS
SELECT DoiBong.MaDoiBong, DoiBong.TenDoiBong, COUNT(CauThu.MaCauThu) AS TongCauThu
FROM DoiBong
LEFT JOIN CauThuDoiBong ON DoiBong.MaDoiBong = CauThuDoiBong.MaDoiBong
LEFT JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu
GROUP BY DoiBong.MaDoiBong, DoiBong.TenDoiBong;
GO
SELECT * FROM View_DoiBong_TongCauThu
-- Các đội bóng và số lần tham gia các trận đấu
GO
CREATE VIEW View_DoiBong_TranDau AS
SELECT DoiBong.MaDoiBong, DoiBong.TenDoiBong, COUNT(ChiTietTranDau.MaTranDau) AS SoTranDau
FROM DoiBong
INNER JOIN ChiTietTranDau ON DoiBong.MaDoiBong = ChiTietTranDau.MaDoiBong
GROUP BY DoiBong.MaDoiBong, DoiBong.TenDoiBong;
GO
SELECT * FROM View_DoiBong_TranDau

--	Bảng ViTriChoi
-- Danh sách các cầu thủ và vị trí thi đấu của họ
GO
CREATE VIEW View_CauThu_ViTri AS
SELECT CauThu.MaCauThu, CauThu.TenCauThu, ViTriChoi.TenViTri
FROM CauThu
INNER JOIN ViTriChoi ON CauThu.ViTriChoi = ViTriChoi.MaViTri;
GO
SELECT * FROM View_CauThu_ViTri
-- Tổng số cầu thủ ở mỗi vị trí
GO
CREATE VIEW View_TongCauThuViTri AS
SELECT ViTriChoi.MaViTri, ViTriChoi.TenViTri, COUNT(CauThu.MaCauThu) AS SoCauThu
FROM ViTriChoi
INNER JOIN CauThu ON ViTriChoi.MaViTri = CauThu.ViTriChoi
GROUP BY ViTriChoi.MaViTri, ViTriChoi.TenViTri;
GO
SELECT * FROM View_TongCauThuViTri

--	Bảng CauThu
-- Các cầu thủ có số bàn thắng lớn hơn một giá trị cụ thể
GO
CREATE VIEW View_CauThu_BanThang_LonHon AS
SELECT CauThu.MaCauThu, CauThu.TenCauThu, SUM(ThanhTich.SoBanGhiDuoc) AS TongSoBan
FROM CauThu
INNER JOIN ThanhTich ON CauThu.MaCauThu = ThanhTich.MaCauThu
GROUP BY CauThu.MaCauThu, CauThu.TenCauThu
HAVING SUM(ThanhTich.SoBanGhiDuoc) > 4;
GO
SELECT * FROM  View_CauThu_BanThang_LonHon
-- Danh sách các cầu thủ và số bàn thắng của họ
GO
CREATE VIEW View_CauThuBanThang AS
SELECT CauThu.MaCauThu, CauThu.TenCauThu, SUM(ThanhTich.SoBanGhiDuoc) AS TongSoBan
FROM CauThu
INNER JOIN ThanhTich ON CauThu.MaCauThu = ThanhTich.MaCauThu
GROUP BY CauThu.MaCauThu, CauThu.TenCauThu;
GO
SELECT * FROM View_CauThuBanThang

--	Bảng TranDau
-- Các trận đấu có kết quả thắng
GO
CREATE VIEW View_TranDau_Thang AS
SELECT TranDau.MaTranDau, ChiTietTranDau.KetQua
FROM TranDau
INNER JOIN ChiTietTranDau ON ChiTietTranDau.MaTranDau = TranDau.MaTranDau
WHERE ChiTietTranDau.KetQua LIKE '%thắng%';
GO
SELECT * FROM View_TranDau_Thang
-- Các trận đấu theo thời gian (Sắp xếp theo thời gian diễn ra trận đấu)
GO
CREATE VIEW View_TranDau_TheoThoiGian AS
SELECT TranDau.MaTranDau, TranDau.NgayThiDau, TranDau.ThoiGianThiDau
FROM TranDau
WHERE TranDau.ThoiGianThiDau >= '2023-01-01';
GO
SELECT * FROM View_TranDau_TheoThoiGian
ORDER BY ThoiGianThiDau ASC;

--	Bảng CauThuDoiBong
-- Danh sách đội bóng và cầu thủ của họ
GO
CREATE VIEW View_CauThuDoiBong AS
SELECT DoiBong.MaDoiBong, DoiBong.TenDoiBong, CauThu.MaCauThu, CauThu.TenCauThu
FROM CauThuDoiBong
INNER JOIN DoiBong ON CauThuDoiBong.MaDoiBong = DoiBong.MaDoiBong
INNER JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu;
GO
SELECT * FROM View_CauThuDoiBong
-- Danh sách cầu thủ và đội bóng của họ (Kèm theo thông tin vị trí thi đấu)
GO
CREATE VIEW View_CauThuDoiBong_ViTri AS
SELECT DoiBong.TenDoiBong, CauThu.TenCauThu, ViTriChoi.TenViTri
FROM CauThuDoiBong
INNER JOIN DoiBong ON CauThuDoiBong.MaDoiBong = DoiBong.MaDoiBong
INNER JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu
INNER JOIN ViTriChoi ON CauThu.ViTriChoi = ViTriChoi.MaViTri;
GO
SELECT * FROM View_CauThuDoiBong_ViTri
--	Bảng ChiTietTranDau
-- Thông tin chi tiết trận đấu và đội bóng tham gia
GO
CREATE VIEW View_ChiTietTranDau_DoiBong AS
SELECT ChiTietTranDau.MaTranDau, DoiBong.MaDoiBong, DoiBong.TenDoiBong, ChiTietTranDau.KetQua
FROM ChiTietTranDau
INNER JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong;
GO
SELECT * FROM View_ChiTietTranDau_DoiBong
-- Danh sách các trận đấu của đội bóng với kết quả
GO
CREATE VIEW View_TranDau_KetQua AS
SELECT DoiBong.TenDoiBong, ChiTietTranDau.MaTranDau, ChiTietTranDau.KetQua
FROM ChiTietTranDau
INNER JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong;
GO
SELECT * FROM View_TranDau_KetQua
--	Bảng ThanhTich
-- Danh sách cầu thủ và bàn thắng
GO
CREATE VIEW View_ThanhTich_CauThu AS
SELECT CauThu.MaCauThu, CauThu.TenCauThu, SUM(ThanhTich.SoBanGhiDuoc) AS TongSoBan
FROM ThanhTich
INNER JOIN CauThu ON ThanhTich.MaCauThu = CauThu.MaCauThu
GROUP BY CauThu.MaCauThu, CauThu.TenCauThu;
GO
SELECT * FROM View_ThanhTich_CauThu
-- Danh sách các cầu thủ với thành tích ghi bàn theo từng trận đấu
GO
CREATE VIEW View_ThanhTich_TranDau AS
SELECT CauThu.MaCauThu, CauThu.TenCauThu, TranDau.MaTranDau, SUM(ThanhTich.SoBanGhiDuoc) AS TongSoBan
FROM ThanhTich
INNER JOIN CauThu ON ThanhTich.MaCauThu = CauThu.MaCauThu
INNER JOIN ChiTietTranDau ON ThanhTich.MaTranDau = ChiTietTranDau.MaTranDau
INNER JOIN TranDau ON ChiTietTranDau.MaTranDau = TranDau.MaTranDau
GROUP BY CauThu.MaCauThu, CauThu.TenCauThu, TranDau.MaTranDau;
GO
SELECT * FROM View_ThanhTich_TranDau





-- Xây dựng các store procedures
-- Proc này sẽ trả về danh sách cầu thủ và thông tin đội bóng của họ, lọc theo ngày thi đấu và địa điểm của trận đấu.
GO
CREATE PROCEDURE proc_LayCauThuTheoNgayVaDiaDiem
    @NgayThiDau DATE,
    @DiaDiem NVARCHAR(MAX)
AS
BEGIN
    SELECT c.MaCauThu, c.TenCauThu, db.TenDoiBong, t.NgayThiDau, t.DiaDiem
    FROM CauThu c
    JOIN CauThuDoiBong ctdb ON c.MaCauThu = ctdb.MaCauThu
    JOIN DoiBong db ON ctdb.MaDoiBong = db.MaDoiBong
    JOIN ThanhTich tt ON c.MaCauThu = tt.MaCauThu
    JOIN TranDau t ON tt.MaTranDau = t.MaTranDau
    WHERE t.NgayThiDau = @NgayThiDau AND t.DiaDiem = @DiaDiem
END

EXEC proc_LayCauThuTheoNgayVaDiaDiem @NgayThiDau = '2020-12-19', @DiaDiem = N'Sân vận động Nam Định'

-- Lấy thông tin các trận đấu và tổng số bàn thắng của đội bóng
GO
CREATE PROCEDURE proc_LayThongTinTranDauVaTongSoBanCuaDoiBong
    @MaDoiBong CHAR(10),
    @TongSoBan INT OUTPUT
AS
BEGIN
    SELECT td.MaTranDau, td.NgayThiDau, td.ThoiGianThiDau, td.DiaDiem, ctd.SoBanGhiDuoc
    FROM TranDau td
    JOIN ChiTietTranDau ctd ON td.MaTranDau = ctd.MaTranDau
    WHERE ctd.MaDoiBong = @MaDoiBong

    SELECT @TongSoBan = SUM(ctd.SoBanGhiDuoc)
    FROM ChiTietTranDau ctd
    WHERE ctd.MaDoiBong = @MaDoiBong
END

DECLARE @TongSoBanThang INT
EXEC proc_LayThongTinTranDauVaTongSoBanCuaDoiBong @MaDoiBong = 'DB9', @TongSoBan = @TongSoBanThang OUTPUT
SELECT @TongSoBanThang AS N'Tổng số bàn thắng của đội bóng'

-- Lấy thông tin các cầu thủ ghi bàn và số lần tham gia trận đấu
GO
CREATE PROCEDURE proc_LayCauThuGhiBanVaSoLanThamGia
    @MaTranDau CHAR(10)
AS
BEGIN
    SELECT c.MaCauThu, c.TenCauThu, COUNT(t.MaTranDau) AS SoLanThamGia, SUM(tt.SoBanGhiDuoc) AS SoBanGhi
    FROM CauThu c
    JOIN ThanhTich tt ON c.MaCauThu = tt.MaCauThu
    JOIN TranDau t ON tt.MaTranDau = t.MaTranDau
    WHERE t.MaTranDau = @MaTranDau
    GROUP BY c.MaCauThu, c.TenCauThu
END

EXEC proc_LayCauThuGhiBanVaSoLanThamGia @MaTranDau = 'TD10'

-- Cập nhật thông tin trận đấu và kết quả
GO
CREATE PROCEDURE proc_CapNhatThongTinTranDau
    @MaTranDau CHAR(10),
    @NgayThiDau DATE,
    @ThoiGianThiDau TIME(0),
    @DiaDiem NVARCHAR(MAX),
    @KetQua NVARCHAR(MAX)
AS
BEGIN
    UPDATE TranDau
    SET NgayThiDau = @NgayThiDau, ThoiGianThiDau = @ThoiGianThiDau, DiaDiem = @DiaDiem
    WHERE MaTranDau = @MaTranDau;

    UPDATE ChiTietTranDau
    SET KetQua = @KetQua
    WHERE MaTranDau = @MaTranDau
END

EXEC proc_CapNhatThongTinTranDau @MaTranDau = 'TD11', @NgayThiDau = '2023-12-23', @ThoiGianThiDau = '11:12:13', 
								@DiaDiem = 'Sân vận động Quảng Ninh', @KetQua = N'Hoà với tỷ số 2-2'

-- Xóa cầu thủ khỏi đội bóng
GO
CREATE PROCEDURE proc_XoaCauThuKhoiDoiBong
    @MaCauThu CHAR(10)
AS
BEGIN
    DELETE FROM CauThuDoiBong WHERE MaCauThu = @MaCauThu;
    DELETE FROM ThanhTich WHERE MaCauThu = @MaCauThu;
    DELETE FROM CauThu WHERE MaCauThu = @MaCauThu;
END

EXEC proc_XoaCauThuKhoiDoiBong @MaCauThu = 'HNF10'

-- Lấy thông tin cầu thủ và đội bóng theo vị trí chơi
GO
CREATE PROCEDURE proc_LayCauThuTheoViTriChoi
    @MaViTri CHAR(10)
AS
BEGIN
    SELECT c.MaCauThu, c.TenCauThu, db.TenDoiBong, v.TenViTri
    FROM CauThu c
    JOIN ViTriChoi v ON c.ViTriChoi = v.MaViTri
    JOIN CauThuDoiBong ctdb ON c.MaCauThu = ctdb.MaCauThu
    JOIN DoiBong db ON ctdb.MaDoiBong = db.MaDoiBong
    WHERE c.ViTriChoi = @MaViTri
END

EXEC proc_LayCauThuTheoViTriChoi @MaViTri = 'VT10'

-- Lấy danh sách trận đấu trong một khoảng thời gian
GO
CREATE PROCEDURE proc_LayDanhSachTranDauTheoKhoangThoiGian
    @NgayBatDau DATE,
    @NgayKetThuc DATE
AS
BEGIN
    SELECT MaTranDau, NgayThiDau, ThoiGianThiDau, DiaDiem
    FROM TranDau
    WHERE NgayThiDau BETWEEN @NgayBatDau AND @NgayKetThuc
END

EXEC proc_LayDanhSachTranDauTheoKhoangThoiGian @NgayBatDau = '2022-12-29', @NgayKetThuc = '2023-7-15'

-- Tính điểm số trung bình của cầu thủ trong các trận đấu
GO
CREATE PROCEDURE proc_TinhDiemTrungBinhCauThu
    @MaCauThu CHAR(10),
    @DiemTrungBinh FLOAT OUTPUT
AS
BEGIN
    SELECT @DiemTrungBinh = ISNULL(AVG(SoBanGhiDuoc), 0)
    FROM ThanhTich
    WHERE MaCauThu = @MaCauThu
END

DECLARE @DiemTrungBinhCT FLOAT
EXEC proc_TinhDiemTrungBinhCauThu @MaCauThu = 'HP10', @DiemTrungBinh = @DiemTrungBinhCT OUTPUT
SELECT @DiemTrungBinhCT AS N'Điểm số trung bình của cầu thủ'

EXEC proc_TinhDiemTrungBinhCauThu @MaCauThu = 'HD7', @DiemTrungBinh = @DiemTrungBinhCT OUTPUT
SELECT @DiemTrungBinhCT AS N'Điểm số trung bình của cầu thủ'

-- Cập nhật thông tin vị trí chơi của cầu thủ
GO
CREATE PROCEDURE proc_CapNhatViTriCauThu
    @MaCauThu CHAR(10),
    @MaViTriChoi CHAR(10)
AS
BEGIN
    UPDATE CauThu
    SET ViTriChoi = @MaViTriChoi
    WHERE MaCauThu = @MaCauThu
END

EXEC proc_CapNhatViTriCauThu @MaCauThu = 'HAGL6', @MaViTriChoi = 'VT1'

-- Lấy Thông Tin Trận Đấu và Tổng Số Bàn Thắng
GO
CREATE PROCEDURE proc_LayThongTinTatCaTranDau
AS
BEGIN
    SELECT td.MaTranDau, td.NgayThiDau, td.ThoiGianThiDau, td.DiaDiem, 
           ctd.MaDoiBong, db.TenDoiBong, SUM(ctd.SoBanGhiDuoc) AS TongSoBan
    FROM TranDau td
    JOIN ChiTietTranDau ctd ON td.MaTranDau = ctd.MaTranDau
    JOIN DoiBong db ON ctd.MaDoiBong = db.MaDoiBong
    GROUP BY td.MaTranDau, td.NgayThiDau, td.ThoiGianThiDau, td.DiaDiem, ctd.MaDoiBong, db.TenDoiBong
END

EXEC proc_LayThongTinTatCaTranDau





-- Xây dựng các function
-- 1. Hàm trả về số lượng cầu thủ trong một đội bóng
GO
CREATE FUNCTION func_DemCauThuTronGDoiBong(@MaDoiBong CHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @SoLuong INT

    SELECT @SoLuong = COUNT(*) 
    FROM CauThuDoiBong
    WHERE MaDoiBong = @MaDoiBong

    RETURN @SoLuong
END
GO
SELECT dbo.func_DemCauThuTronGDoiBong('DB18') AS N'Số lượng cầu thủ của đội bóng'
-- 2. Hàm trả về số lượng bàn thắng của một cầu thủ trong một trận đấu
GO
CREATE FUNCTION func_LaySoBanCauThuTrongTranDau(@MaCauThu CHAR(10), @MaTranDau CHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @SoBan INT

    SELECT @SoBan = ISNULL(SUM(ThanhTich.SoBanGhiDuoc), 0)
    FROM ThanhTich
    WHERE ThanhTich.MaCauThu = @MaCauThu AND ThanhTich.MaTranDau = @MaTranDau

    RETURN @SoBan
END
GO
SELECT dbo.func_LaySoBanCauThuTrongTranDau('AG8', 'TD10') AS N'Số bàn ghi được'
-- 3. Hàm trả về kết quả của trận đấu
GO
CREATE FUNCTION func_LayKetQuaTranDau(@MaTranDau CHAR(10))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @KetQua NVARCHAR(MAX)

    SELECT @KetQua = KetQua
    FROM ChiTietTranDau
    WHERE MaTranDau = @MaTranDau

    RETURN @KetQua
END
GO
SELECT dbo.func_LayKetQuaTranDau('TD47') AS N'Kết quả trận đấu'
-- 4. Hàm trả về đội bóng có số bàn thắng cao nhất trong một giải đấu
GO
CREATE FUNCTION func_LayDoiBongSoBanThangCaoNhat(@MaTranDau CHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 DoiBong.TenDoiBong, SUM(ChiTietTranDau.SoBanGhiDuoc) AS SoBanThang
    FROM ChiTietTranDau
    JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong
    WHERE ChiTietTranDau.MaTranDau = @MaTranDau
    GROUP BY DoiBong.TenDoiBong
    ORDER BY SoBanThang DESC
)
GO
SELECT * FROM dbo.func_LayDoiBongSoBanThangCaoNhat('TD40')
-- 5. Hàm trả về cầu thủ ghi bàn nhiều nhất trong một giải đấu
GO
CREATE FUNCTION func_LayCauThuGhiBanNhieuNhat(@MaTranDau CHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 CauThu.TenCauThu, SUM(ThanhTich.SoBanGhiDuoc) AS SoBan
    FROM ThanhTich
    JOIN CauThu ON ThanhTich.MaCauThu = CauThu.MaCauThu
    WHERE ThanhTich.MaTranDau = @MaTranDau
    GROUP BY CauThu.TenCauThu
    ORDER BY SoBan DESC
)
GO
SELECT * FROM dbo.func_LayCauThuGhiBanNhieuNhat ('TD28')
-- 6. Hàm trả về cầu thủ có hiệu suất ghi bàn tốt nhất (bàn thắng/trận đấu)
GO
CREATE FUNCTION func_LayCauThuHieuSuatGhiBan(@MaDoiBong CHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT CauThu.MaCauThu, CauThu.TenCauThu,
           SUM(ThanhTich.SoBanGhiDuoc) * 1.0 / COUNT(DISTINCT ThanhTich.MaTranDau) AS HieuSuat
    FROM ThanhTich
    JOIN CauThu ON ThanhTich.MaCauThu = CauThu.MaCauThu
    WHERE CauThu.MaCauThu IN (SELECT MaCauThu FROM CauThuDoiBong WHERE MaDoiBong = @MaDoiBong)
    GROUP BY CauThu.MaCauThu, CauThu.TenCauThu
)
GO
SELECT * FROM dbo.func_LayCauThuHieuSuatGhiBan('DB17')
-- 7. Hàm trả về các đội bóng có số trận thua nhiều nhất trong giải đấu
GO
CREATE FUNCTION func_LayDoiBongSoTranThuaCaoNhat()
RETURNS TABLE
AS
RETURN
(
    SELECT DoiBong.TenDoiBong, COUNT(ChiTietTranDau.MaTranDau) AS SoTranThua
    FROM ChiTietTranDau
    INNER JOIN DoiBong ON ChiTietTranDau.MaDoiBong = DoiBong.MaDoiBong
    WHERE ChiTietTranDau.KetQua LIKE 'Thua%'
    GROUP BY DoiBong.TenDoiBong
)
GO
SELECT *
FROM dbo.func_LayDoiBongSoTranThuaCaoNhat()
ORDER BY SoTranThua DESC;
-- 8. Hàm trả về đội bóng có số lượng cầu thủ nhiều nhất
GO
CREATE FUNCTION func_LayDoiBongCoNhieuCauThuNhat()
RETURNS TABLE
AS
RETURN
(
    SELECT DoiBong.TenDoiBong, COUNT(DISTINCT CauThu.MaCauThu) AS SoCauThu
    FROM DoiBong
    JOIN CauThuDoiBong ON DoiBong.MaDoiBong = CauThuDoiBong.MaDoiBong
    JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu
    GROUP BY DoiBong.TenDoiBong
)
GO
SELECT * 
FROM dbo.func_LayDoiBongCoNhieuCauThuNhat()
ORDER BY SoCauThu DESC
-- 9. Hàm trả về các trận đấu của đội bóng đối thủ (nếu có) và số bàn thắng
GO
CREATE FUNCTION func_LayDoiNhaSoBanThangTrongTranDau(@MaDoiBong CHAR(10))
RETURNS TABLE
AS
RETURN
(
    -- Lấy thông tin trận đấu mà đội bóng tham gia
    SELECT TranDau.MaTranDau, TranDau.NgayThiDau, TranDau.ThoiGianThiDau, TranDau.DiaDiem,
           ChiTietTranDau.MaDoiBong, SUM(ChiTietTranDau.SoBanGhiDuoc) AS SoBan
    FROM ChiTietTranDau
    JOIN TranDau ON ChiTietTranDau.MaTranDau = TranDau.MaTranDau
    WHERE ChiTietTranDau.MaTranDau IN 
    (
        SELECT MaTranDau 
        FROM ChiTietTranDau
        WHERE MaDoiBong = @MaDoiBong
    )
    AND ChiTietTranDau.MaDoiBong <> @MaDoiBong -- Loại bỏ đội bóng đã cho
    GROUP BY TranDau.MaTranDau, TranDau.NgayThiDau, TranDau.ThoiGianThiDau, TranDau.DiaDiem, ChiTietTranDau.MaDoiBong
)
GO
SELECT * FROM dbo.func_LayDoiNhaSoBanThangTrongTranDau('DB22')
-- 10. Hàm trả về cầu thủ tham gia nhiều trận đấu nhất có nhiều thành tích nhất
GO
CREATE FUNCTION func_LayCauThuThamGiaTranDauNhieuThanhTichNhat()
RETURNS TABLE
AS
RETURN
(
    SELECT CauThu.TenCauThu, COUNT(DISTINCT ThanhTich.MaTranDau) AS SoTranDau
    FROM ThanhTich
    JOIN CauThu ON ThanhTich.MaCauThu = CauThu.MaCauThu
    GROUP BY CauThu.TenCauThu
)
GO
SELECT * FROM func_LayCauThuThamGiaTranDauNhieuThanhTichNhat()
ORDER BY SoTranDau DESC;







-- Xây dựng các trigger
-- 1 Kiểm tra khi thêm cầu thủ vào đội bóng (CauThuDoiBong)
-- Giả sử, đảm bảo rằng một cầu thủ không thể gia nhập một đội bóng nếu đội bóng đó đã có đủ số lượng cầu thủ 
-- trong một vị trí nhất định (ví dụ: một đội bóng chỉ có thể có tối đa 2 tiền đạo).
GO
CREATE TRIGGER trg_KiemTraViTri
ON CauThuDoiBong
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaDoiBong CHAR(10), @MaCauThu CHAR(10), @ViTriChoi CHAR(10)
    DECLARE @SoLuongCauThu INT

    -- Lấy MaDoiBong và MaCauThu từ bảng inserted
    SELECT @MaDoiBong = MaDoiBong, @MaCauThu = MaCauThu FROM inserted

    -- Lấy vị trí của cầu thủ từ bảng CauThu
    SELECT @ViTriChoi = ViTriChoi FROM CauThu WHERE MaCauThu = @MaCauThu

    -- Kiểm tra số lượng cầu thủ theo vị trí trong đội bóng
    SELECT @SoLuongCauThu = COUNT(*)
    FROM CauThuDoiBong
    JOIN CauThu ON CauThuDoiBong.MaCauThu = CauThu.MaCauThu
    WHERE CauThuDoiBong.MaDoiBong = @MaDoiBong AND CauThu.ViTriChoi = @ViTriChoi

    -- Giả sử đội bóng chỉ có thể có tối đa 1 cầu thủ cho mỗi vị trí
    IF (@SoLuongCauThu >= 1)
    BEGIN
        -- Nếu đã có cầu thủ cho vị trí này, tạo lỗi
        PRINT N'Đội bóng này đã có đủ cầu thủ cho vị trí ' + @ViTriChoi + N', không thể thêm cầu thủ này vào!'
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        -- Nếu không có vấn đề, thực hiện thêm cầu thủ vào đội bóng
        INSERT INTO CauThuDoiBong (MaDoiBong, MaCauThu)
        SELECT MaDoiBong, MaCauThu FROM inserted
    END
END
-- Tạo mới 1 dữ liệu cầu thủ
INSERT INTO CauThu ([MaCauThu], [TenCauThu], [SoAo], [ViTriChoi])
VALUES ('HNF10', 'Nguyễn Văn Sinh', 18, 'VT3')

INSERT INTO [dbo].[CauThuDoiBong] ([MaDoiBong], [MaCauThu])
VALUES ('DB1', 'HNF10')


-- 2. Tự động cập nhật kết quả trận đấu (ChiTietTranDau)
-- Giả sử bạn muốn tự động cập nhật kết quả của một trận đấu trong bảng ChiTietTranDau nếu có sự thay đổi 
-- trong bảng ThanhTich, chẳng hạn như nếu một cầu thủ ghi thêm bàn thắng.
GO
CREATE TRIGGER trg_CapNhatKetQua
ON ThanhTich
AFTER UPDATE
AS
BEGIN
    DECLARE @MaTranDau CHAR(10), @MaCauThu CHAR(10), @MaDoiBong CHAR(10)
    DECLARE @SoBanGhiDuocMoi INT, @SoBanGhiDuocTruoc INT
    DECLARE @KetQua NVARCHAR(MAX), @KetQuaConLai NVARCHAR(MAX)

    -- Lấy thông tin từ bảng inserted (mới cập nhật) và deleted (cũ)
    SELECT @MaTranDau = MaTranDau, @SoBanGhiDuocMoi = SoBanGhiDuoc, @MaCauThu = MaCauThu
    FROM inserted

    -- Lấy mã đội bóng từ bảng CauThuDoiBong
    SELECT @MaDoiBong = MaDoiBong
    FROM CauThuDoiBong
    WHERE MaCauThu = @MaCauThu

    -- Lấy số bàn ghi được trước và sau khi cập nhật
    SELECT @SoBanGhiDuocTruoc = SoBanGhiDuoc FROM deleted

    -- Tính lại tổng số bàn ghi được cho đội bóng sau khi cập nhật
    DECLARE @TongSoBanGhiDuoc INT

    SELECT @TongSoBanGhiDuoc = SUM(SoBanGhiDuoc)
    FROM ThanhTich
    WHERE MaTranDau = @MaTranDau AND MaCauThu IN (SELECT MaCauThu FROM CauThuDoiBong WHERE MaDoiBong = @MaDoiBong)
    GROUP BY MaTranDau

    -- Tính tổng số bàn ghi được cho đội đối thủ (đội còn lại)
    DECLARE @TongSoBanGhiDuocDoiThu INT
    
    SELECT @TongSoBanGhiDuocDoiThu = SUM(SoBanGhiDuoc)
    FROM ThanhTich
    WHERE MaTranDau = @MaTranDau AND MaCauThu NOT IN (SELECT MaCauThu FROM CauThuDoiBong WHERE MaDoiBong = @MaDoiBong)
    GROUP BY MaTranDau

    -- Cập nhật lại kết quả trận đấu nếu có sự thay đổi số bàn ghi được
    IF (@SoBanGhiDuocTruoc != @SoBanGhiDuocMoi)
    BEGIN
        -- Tạo chuỗi kết quả mới
        IF (@TongSoBanGhiDuoc > @TongSoBanGhiDuocDoiThu)
        BEGIN
            SET @KetQua = N'Thắng với tỉ số ' + CAST(@TongSoBanGhiDuoc AS NVARCHAR) + N' - ' + CAST(@TongSoBanGhiDuocDoiThu AS NVARCHAR)
            SET @KetQuaConLai = N'Thua với tỉ số ' + CAST(@TongSoBanGhiDuoc AS NVARCHAR) + N' - ' + CAST(@TongSoBanGhiDuocDoiThu AS NVARCHAR)
        END
        ELSE IF (@TongSoBanGhiDuoc < @TongSoBanGhiDuocDoiThu)
        BEGIN
            SET @KetQua = N'Thua với tỉ số ' + CAST(@TongSoBanGhiDuocDoiThu AS NVARCHAR) + N' - ' + CAST(@TongSoBanGhiDuoc AS NVARCHAR)
            SET @KetQuaConLai = N'Thắng với tỉ số ' + CAST(@TongSoBanGhiDuoc AS NVARCHAR) + N' - ' + CAST(@TongSoBanGhiDuocDoiThu AS NVARCHAR)
        END
        ELSE
        BEGIN
            SET @KetQua = N'Hòa với tỉ số ' + CAST(@TongSoBanGhiDuoc AS NVARCHAR) + N' - ' + CAST(@TongSoBanGhiDuoc AS NVARCHAR)
            SET @KetQuaConLai = @KetQua
        END

        -- Cập nhật kết quả vào bảng ChiTietTranDau
        UPDATE ChiTietTranDau
        SET KetQua = @KetQuaConLai
        WHERE MaTranDau = @MaTranDau

        -- Cập nhật thông tin số bàn ghi được và kết quả trận đấu cho đội bóng
        UPDATE ChiTietTranDau
        SET SoBanGhiDuoc = @TongSoBanGhiDuoc,
            KetQua = @KetQua
        WHERE MaTranDau = @MaTranDau AND MaDoiBong = @MaDoiBong

        PRINT N'Kết quả trận đấu đã được cập nhật.'
    END
    ELSE
    BEGIN
        PRINT N'Không có sự thay đổi về thành tích, không cập nhật kết quả trận đấu.'
    END
END

UPDATE ThanhTich
SET SoBanGhiDuoc = 2
WHERE MaCauThu = 'KG9'

-- 3. Kiểm tra khi một trận đấu đã diễn ra (AFTER UPDATE trên ChiTietTranDau)
-- Nếu trận đấu đã diễn ra (ThoiGianThiDau đã qua), hệ thống không cho phép thay đổi kết quả trận đấu nữa.
GO
CREATE TRIGGER trg_KiemTraThoiGian
ON ChiTietTranDau
AFTER UPDATE
AS
BEGIN
    DECLARE @thoi_gian_tran_dau TIME(0), @thoi_gian_hien_tai TIME(0)
    DECLARE @ngay_tran_dau DATE, @ngay_hien_tai DATE
    
    -- Lấy thời gian thi đấu của trận đấu
    SELECT @thoi_gian_tran_dau = ThoiGianThiDau, @ngay_tran_dau = NgayThiDau FROM TranDau
    INNER JOIN deleted ON TranDau.MaTranDau = deleted.MaTranDau
    
    -- Lấy thời gian hiện tại
	SET @ngay_hien_tai = GETDATE()
    SET @thoi_gian_hien_tai = CONVERT(TIME(0), GETDATE())
    
    -- Nếu trận đấu đã diễn ra, không cho phép thay đổi kết quả
	IF @ngay_tran_dau = @ngay_hien_tai
	BEGIN
		IF @thoi_gian_tran_dau < @thoi_gian_hien_tai
		BEGIN
			RAISERROR('Không thể thay đổi kết quả vì trận đấu đã diễn ra.', 16, 1)
			ROLLBACK TRANSACTION
		END
	END
	ELSE
	BEGIN
		RAISERROR('Không thể thay đổi kết quả vì trận đấu đã diễn ra.', 16, 1)
		ROLLBACK TRANSACTION
	END
END

UPDATE ChiTietTranDau
SET SoBanGhiDuoc = 2,
	KetQua = N'Thắng với tỷ số 2-1'
WHERE MaTranDau = 'TD10' AND MaDoiBong = 'DB44'

-- 4. Ngừng trận đấu nếu đội bóng không đủ cầu thủ (AFTER INSERT trên ChiTietTranDau)
-- Trước khi trận đấu được bắt đầu, hệ thống sẽ kiểm tra xem đội bóng có đủ cầu thủ (tối thiểu 9 cầu thủ) 
-- tham gia trận đấu hay không. Nếu đội bóng không đủ cầu thủ, trận đấu sẽ bị hủy.
GO
CREATE TRIGGER trg_KiemTraCauThuTruocTran
ON ChiTietTranDau
AFTER INSERT
AS
BEGIN
    DECLARE @so_cau_thu INT
    DECLARE @ma_doi_bong CHAR(10)
    
    -- Lấy mã đội bóng từ dòng vừa thêm
    SELECT @ma_doi_bong = MaDoiBong FROM INSERTED
    
    -- Đếm số lượng cầu thủ tham gia đội bóng
    SELECT @so_cau_thu = COUNT(*)
    FROM CauThuDoiBong
    WHERE MaDoiBong = @ma_doi_bong
    
    -- Kiểm tra nếu đội bóng có ít hơn 9 cầu thủ
    IF @so_cau_thu < 9
    BEGIN
        RAISERROR('Đội bóng không đủ cầu thủ (ít nhất 9 cầu thủ) để tham gia trận đấu.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

GO
INSERT INTO ChiTietTranDau ([MaDoiBong], [MaTranDau], [SoBanGhiDuoc], [CoPhaiDoiNhaKhong], [KetQua])
VALUES ('DB3', 'TD51', 2, 'C', 'Hoà với tỷ số 2-2')
-- 5. Kiểm tra hợp lệ của số áo (AFTER INSERT và AFTER UPDATE vào bảng CauThu)
--Khi thêm hoặc cập nhật cầu thủ, trigger sẽ kiểm tra nếu số áo của cầu thủ đã tồn tại trong đội bóng. 
--Nếu số áo trùng lặp, trigger sẽ ngừng thao tác.
GO
CREATE TRIGGER trg_KiemTraSoAo
ON CauThu
AFTER INSERT
AS
BEGIN
    DECLARE @so_ao_count INT
    DECLARE @so_ao INT
    
    -- Lấy số áo và vị trí chơi từ dòng vừa thêm
    SELECT @so_ao = SoAo FROM INSERTED
    
    -- Kiểm tra nếu số áo đã tồn tại trong đội bóng cho cùng vị trí chơi
    SELECT @so_ao_count = COUNT(*)
    FROM CauThu
    WHERE SoAo = @so_ao
    
    -- Kiểm tra nếu số áo đã tồn tại
    IF @so_ao_count > 0
    BEGIN
        RAISERROR('Số áo này đã được sử dụng trong đội bóng này.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

INSERT INTO CauThu ([MaCauThu], [TenCauThu], [SoAo], [ViTriChoi])
VALUES('AG11', N'Nguyễn Xuân Quang', 95, 'VT3')

-- 6. Tự động thay đổi thời gian trận đấu nếu trùng (AFTER UPDATE trên TranDau)
-- Khi một trận đấu bị thay đổi thời gian và có trùng với thời gian thi đấu của trận đấu khác, trigger sẽ tự động thay đổi thời gian trận đấu.
GO
CREATE TRIGGER trg_TuDongThayDoiThoiGian
ON TranDau
AFTER UPDATE
AS
BEGIN
    DECLARE @thoi_gian_xung_dot TIME(0)
    
    -- Kiểm tra nếu thời gian thi đấu trùng
    SELECT @thoi_gian_xung_dot = ThoiGianThiDau
    FROM TranDau
    WHERE ThoiGianThiDau = (SELECT ThoiGianThiDau FROM INSERTED) 
    AND MaTranDau != (SELECT MaTranDau FROM INSERTED)
    
    IF @thoi_gian_xung_dot IS NOT NULL
    BEGIN
        -- Thay đổi thời gian trận đấu nếu trùng
        UPDATE TranDau
        SET ThoiGianThiDau = DATEADD(HOUR, 1, (SELECT ThoiGianThiDau FROM INSERTED))
        WHERE MaTranDau = (SELECT MaTranDau FROM INSERTED)

		PRINT(N'Thời gian này đã trùng với 1 trận đấu khác. Đã thay đổi thời gian thi đấu thành công')
    END
END

UPDATE TranDau
SET ThoiGianThiDau = '22:05:21'
WHERE MaTranDau = 'TD1'
-- 8. Tự động ghi lại lịch sử thay đổi thông tin cầu thủ (AFTER UPDATE trên CauThu)
-- Khi thông tin cầu thủ được cập nhật, hệ thống sẽ tự động ghi lại lịch sử thay đổi vào một bảng 
-- LichSuThayDoiCauThu để theo dõi các thay đổi của cầu thủ.
GO
CREATE TABLE LichSuThayDoiCauThu (
    MaLichSu INT IDENTITY(1,1) PRIMARY KEY,
    MaCauThu CHAR(10),
    TenCauThuTruoc NVARCHAR(100),
    TenCauThuSau NVARCHAR(100),
    SoAoTruoc INT,
    SoAoSau INT,
    ThoiGianThayDoi DATETIME DEFAULT GETDATE(),
    LyDoThayDoi NVARCHAR(255)
)

GO
CREATE TRIGGER trg_GhiLaiLichSuCapNhat
ON CauThu
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra nếu tên hoặc số áo của cầu thủ thay đổi
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN DELETED d ON i.MaCauThu = d.MaCauThu
        WHERE i.TenCauThu != d.TenCauThu OR i.SoAo != d.SoAo
    )
    BEGIN
        -- Ghi lại lịch sử thay đổi của cầu thủ
        INSERT INTO LichSuThayDoiCauThu 
        (MaCauThu, TenCauThuTruoc, TenCauThuSau, SoAoTruoc, SoAoSau, LyDoThayDoi)
        SELECT 
            d.MaCauThu, 
            d.TenCauThu, 
            i.TenCauThu, 
            d.SoAo, 
            i.SoAo, 
            'Cập nhật thông tin cầu thủ'
        FROM INSERTED i
        JOIN DELETED d ON i.MaCauThu = d.MaCauThu
    END
END

UPDATE CauThu
SET MaCauThu = 'BP10',
	TenCauThu = 'Nguyễn Văn Vĩnh',
	SoAo = 57
WHERE MaCauThu = 'BP10'

-- 8. Kiểm tra và cảnh báo khi đội bóng có quá ít cầu thủ (AFTER DELETE trên CauThuDoiBong)
-- Nếu xóa cầu thủ khiến một đội bóng có ít hơn 7 cầu thủ, trigger sẽ cảnh báo và không cho phép xóa cầu thủ đó.
GO
CREATE TRIGGER trg_KiemTraSoCauThuDoiBong
ON CauThuDoiBong
AFTER DELETE
AS
BEGIN
    DECLARE @so_cau_thu INT
    DECLARE @ma_doi_bong CHAR(10)
    
    -- Lấy mã đội bóng từ dòng bị xóa
    SELECT @ma_doi_bong = MaDoiBong FROM DELETED
    
    -- Đếm số lượng cầu thủ của đội bóng sau khi xóa
    SELECT @so_cau_thu = COUNT(*)
    FROM CauThuDoiBong
    WHERE MaDoiBong = @ma_doi_bong
    
    -- Kiểm tra nếu đội bóng có ít hơn 9 cầu thủ
    IF @so_cau_thu < 9
    BEGIN
        RAISERROR('Đội bóng không đủ cầu thủ (ít nhất 9 cầu thủ).', 16, 1)
        ROLLBACK TRANSACTION
    END
END

DELETE CauThuDoiBong
WHERE MaDoiBong = 'DB16' AND MaCauThu = 'QN3'





