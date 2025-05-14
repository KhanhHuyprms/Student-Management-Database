-- Chạy quyền
USE MASTER 
GO
-- Kiểm tra đã có database đã được tạo chưa
IF EXISTS (SELECT NAME FROM SYS.DATABASES WHERE NAME = 'QUANLYGIAOVU_3_HUY')
DROP DATABASE QUANLYGIAOVU_3_HUY
-- Tạo database mới
CREATE DATABASE QUANLYGIAOVU_3_HUY

-- Làm việc với DATABASE QUANLYGIAOVU_3_HUY

USE QUANLYGIAOVU_3_HUY

--I. Ngôn ngữ định nghĩa dữ liệu
-- Tạo bảng KHOA
CREATE TABLE KHOA_3_HUY (
    MAKHOA_3_HUY VARCHAR(4) PRIMARY KEY,
    TENKHOA_3_HUY VARCHAR(40),
    NGTLAP_3_HUY SMALLDATETIME,
    TRGKHOA_3_HUY CHAR(4)
);

--Tạo bảng Giáo viên
CREATE TABLE GIAOVIEN_3_HUY (
    MAGV_3_HUY  CHAR(4) PRIMARY KEY,
    HOTEN_3_HUY VARCHAR(40),
    HOCVI_3_HUY VARCHAR(10),
    HOCHAM_3_HUY VARCHAR(10),
    GIOITINH_3_HUY VARCHAR(3),
    NGSINH_3_HUY SMALLDATETIME,
    NGVL_3_HUY SMALLDATETIME,
    HESO_3_HUY NUMERIC(4,2),
    MUCLUONG_3_HUY MONEY,
    MAKHOA_3_HUY VARCHAR(4),
    FOREIGN KEY (MAKHOA_3_HUY) REFERENCES KHOA_3_HUY(MAKHOA_3_HUY)
);

--Tạo bảng Môn Học
CREATE TABLE MONHOC_3_HUY (
    MAMH_3_HUY VARCHAR(10) PRIMARY KEY,
    TENMH_3_HUY VARCHAR(40),
    TCLT_3_HUY TINYINT,
    TCTH_3_HUY TINYINT,
    MAKHOA_3_HUY VARCHAR(4),
    FOREIGN KEY (MAKHOA_3_HUY) REFERENCES KHOA_3_HUY(MAKHOA_3_HUY)
);

--Tạo bảng ĐIỀU KIỆN
CREATE TABLE DIEUKIEN_3_HUY (
    MAMH_3_HUY VARCHAR(10),
    MAMH_TRUOC_3_HUY VARCHAR(10),
    PRIMARY KEY (MAMH_3_HUY, MAMH_TRUOC_3_HUY),
    FOREIGN KEY (MAMH_3_HUY) REFERENCES MONHOC_3_HUY(MAMH_3_HUY),
    FOREIGN KEY (MAMH_TRUOC_3_HUY) REFERENCES MONHOC_3_HUY(MAMH_3_HUY)
);

--Tạo bảng LỚP
CREATE TABLE LOP_3_HUY (
    MALOP_3_HUY CHAR(3) PRIMARY KEY,
    TENLOP_3_HUY VARCHAR(40),
    TRGLOP_3_HUY CHAR(5),
    SISO_3_HUY TINYINT,
    MAGVCN_3_HUY CHAR(4),
    FOREIGN KEY (MAGVCN_3_HUY) REFERENCES GIAOVIEN_3_HUY(MAGV_3_HUY)
);

--Tạo bảng HỌC VIÊN
CREATE TABLE HOCVIEN_3_HUY (
    MAHV_3_HUY CHAR(5) PRIMARY KEY,
    HO_3_HUY VARCHAR(40),
    TEN_3_HUY VARCHAR(10),
    NGSINH_3_HUY SMALLDATETIME,
    GIOITINH_3_HUY VARCHAR(3),
    NOISINH_3_HUY NVARCHAR(40),
    MALOP_3_HUY CHAR(3),
    FOREIGN KEY (MALOP_3_HUY) REFERENCES LOP_3_HUY(MALOP_3_HUY)
);

-- Tạo bảng Giảng Dạy
CREATE TABLE GIANGDAY_3_HUY (
    MALOP_3_HUY CHAR(3),
    MAMH_3_HUY VARCHAR(10),
    MAGV_3_HUY CHAR(4),
    HOCKY_3_HUY TINYINT,
    NAM_3_HUY SMALLINT,
    TUNGAY_3_HUY SMALLDATETIME,
    DENNGAY_3_HUY SMALLDATETIME,
    PRIMARY KEY (MALOP_3_HUY, MAMH_3_HUY, MAGV_3_HUY, HOCKY_3_HUY, NAM_3_HUY),
    FOREIGN KEY (MALOP_3_HUY) REFERENCES LOP_3_HUY(MALOP_3_HUY),
    FOREIGN KEY (MAMH_3_HUY) REFERENCES MONHOC_3_HUY(MAMH_3_HUY),
    FOREIGN KEY (MAGV_3_HUY) REFERENCES GIAOVIEN_3_HUY(MAGV_3_HUY)
);

--Tạo bảng Kết quả Thi
CREATE TABLE KETQUATHI_3_HUY (
    MAHV_3_HUY CHAR(5),
    MAMH_3_HUY VARCHAR(10),
    LANTHI_3_HUY TINYINT,
    NGTHI_3_HUY SMALLDATETIME,
    DIEM_3_HUY NUMERIC (4,2),
    KQUA_3_HUY VARCHAR(10),
    PRIMARY KEY (MAHV_3_HUY, MAMH_3_HUY, LANTHI_3_HUY),
    FOREIGN KEY (MAHV_3_HUY) REFERENCES HOCVIEN_3_HUY(MAHV_3_HUY),
    FOREIGN KEY (MAMH_3_HUY) REFERENCES MONHOC_3_HUY(MAMH_3_HUY)
);

-- Nhập dữ liệu cho bảng KHOA
INSERT INTO KHOA_3_HUY(MAKHOA_3_HUY, TENKHOA_3_HUY, NGTLAP_3_HUY, TRGKHOA_3_HUY)
VALUES 
('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);

---- Nhập dữ liệu cho bảng GIAO VIEN
INSERT INTO GIAOVIEN_3_HUY(MAGV_3_HUY, HOTEN_3_HUY, HOCVI_3_HUY, HOCHAM_3_HUY, GIOITINH_3_HUY, NGSINH_3_HUY, NGVL_3_HUY, HESO_3_HUY, MUCLUONG_3_HUY, MAKHOA_3_HUY)
VALUES
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-11-01', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-04-20', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1961-02-22', '2005-01-12', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-03-12', '2005-01-12', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', 4.50, 2025000, 'KHMT'),
('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-03-01', 4.00, 1800000, 'KHMT'),
('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '1974-03-26', '2005-03-01', 1.69, 760500, 'KHMT'),
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '1972-07-17', '2005-03-01', 1.86, 837000, 'CNPM'),
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-01-12', '2005-05-15', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '1980-05-23', '2005-05-15', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-05-15', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-05-04', '2005-05-15', 3.00, 1350000, 'KHMT');

-- Nhập dữ liệu cho bảng LỚP
INSERT INTO LOP_3_HUY(MALOP_3_HUY, TENLOP_3_HUY, TRGLOP_3_HUY, SISO_3_HUY, MAGVCN_3_HUY)
VALUES
('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');

-- Nhập dữ liệu cho bảng Môn học
INSERT INTO MONHOC_3_HUY(MAMH_3_HUY, TENMH_3_HUY, TCLT_3_HUY, TCTH_3_HUY, MAKHOA_3_HUY)
VALUES
('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');

-- Nhập dữ liệu cho bảng Điều kiện
INSERT INTO DIEUKIEN_3_HUY(MAMH_3_HUY, MAMH_TRUOC_3_HUY)
VALUES
('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL');
-- Nhập dữ liệu cho bảng Giang day
INSERT INTO GIANGDAY_3_HUY (MALOP_3_HUY, MAMH_3_HUY, MAGV_3_HUY, HOCKY_3_HUY, NAM_3_HUY, TUNGAY_3_HUY, DENNGAY_3_HUY)
VALUES
('K11', 'THDC', 'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
('K12', 'THDC', 'GV06', 1, 2006, '2006-01-02', '2006-05-12'),
('K13', 'THDC', 'GV15', 1, 2006, '2006-01-02', '2006-05-12'),
('K11', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K12', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K13', 'CTRR', 'GV08', 1, 2006, '2006-01-09', '2006-05-17'),
('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CSDL', 'GV05', 3, 2006, '2006-08-01', '2006-12-15'),
('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-02-18'),
('K12', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-03-20'),
('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');

-- Nhập dữ liệu cho bảng Học viên
INSERT INTO HOCVIEN_3_HUY (MAHV_3_HUY, HO_3_HUY, TEN_3_HUY, NGSINH_3_HUY, GIOITINH_3_HUY, NOISINH_3_HUY, MALOP_3_HUY)
VALUES
('K1101', 'Nguyen', 'Van A', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '1986-03-14', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '1986-04-18', 'Nam', 'Nghe An', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '1986-02-27', 'Nam', 'TpHCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '1986-01-24', 'Nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '1986-01-27', 'Nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '1986-02-27', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '1986-01-27', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '1986-02-05', 'Nu', 'Can Tho', 'K11'),
('K1111', 'Le Ha', 'Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen', 'Van B', '1986-02-11', 'Nam', 'TpHCM', 'K12'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
('K1203', 'Tran Thi Kim', 'Duyen', '1986-09-17', 'Nu', 'TpHCM', 'K12'),
('K1204', 'Truong My', 'Hanh', '1986-05-19', 'Nu', 'Dong Nai', 'K12'),
('K1205', 'Nguyen Thanh', 'Nam', '1986-04-17', 'Nam', 'TpHCM', 'K12'),
('K1206', 'Nguyen Thi Truc', 'Thanh', '1986-03-04', 'Nu', 'Kien Giang', 'K12'),
('K1207', 'Tran Thi Bich', 'Thuy', '1986-02-08', 'Nu', 'Nghe An', 'K12'),
('K1208', 'Huynh Thi Kim', 'Trieu', '1986-04-08', 'Nu', 'Tay Ninh', 'K12'),
('K1209', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
('K1210', 'Ngo Thanh', 'Tuan', '1986-02-14', 'Nam', 'TpHCM', 'K12'),
('K1211', 'Do Thi', 'Xuan', '1986-03-09', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi Phi', 'Yen', '1986-03-12', 'Nu', 'TpHCM', 'K12'),
('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-06-09', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Hien', '1986-03-21', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien', '1986-04-18', 'Nam', 'TpHCM', 'K13'),
('K1305', 'Le Thi', 'Huong', '1986-03-27', 'Nu', 'TpHCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu', '1986-03-30', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '1986-04-08', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '1987-01-18', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi Hong', 'Tham', '1986-04-22', 'Nu', 'Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
('K1312', 'Nguyen Thi Kim', 'Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13');

-- Nhập dữ liệu cho bảng Ket qua thi
INSERT INTO KETQUATHI_3_HUY (MAHV_3_HUY, MAMH_3_HUY, LANTHI_3_HUY, NGTHI_3_HUY, DIEM_3_HUY, KQUA_3_HUY)
VALUES
('K1101', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '2006-12-28', 9.00, 'Dat'),
('K1101', 'THDC', 1, '2006-05-20', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '2006-05-13', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '2006-07-20', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '2006-07-27', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '2006-08-10', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '2006-12-28', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '2007-01-05', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '2007-01-15', 6.00, 'Dat'),
('K1102', 'THDC', 1, '2006-05-20', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '2006-05-13', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '2006-07-20', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '2006-07-27', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '2006-12-28', 7.00, 'Dat'),
('K1103', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '2006-05-13', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '2006-07-20', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 1, '2006-05-13', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '2006-05-20', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '2006-06-30', 4.00, 'Khong Dat'),
('K1201', 'CSDL', 1, '2006-07-20', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '2006-12-28', 5.00, 'Dat'),
('K1201', 'THDC', 1, '2006-05-20', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '2006-05-13', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '2006-07-20', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '2007-01-05', 5.00, 'Dat'),
('K1202', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '2006-05-27', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '2006-05-13', 3.00, 'Khong Dat'),
('K1202', 'CTRR', 2, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 3, '2006-06-30', 6.25, 'Dat'),
('K1203', 'CSDL', 1, '2006-07-20', 9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '2006-12-28', 9.50, 'Dat'),
('K1203', 'THDC', 1, '2006-05-20', 10.00, 'Dat'),
('K1203', 'CTRR', 1, '2006-05-13', 10.00, 'Dat'),
('K1204', 'CSDL', 1, '2006-07-20', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '2006-12-28', 6.75, 'Dat'),
('K1204', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1204', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),
('K1301', 'CSDL', 1, '2006-12-20', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
('K1301', 'THDC', 1, '2006-05-20', 7.75, 'Dat'),
('K1301', 'CTRR', 1, '2006-05-13', 8.00, 'Dat'),
('K1302', 'CSDL', 1, '2006-12-20', 6.75, 'Dat'),
('K1302', 'CTDLGT', 1, '2006-07-25', 5.00, 'Dat'),
('K1302', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1302', 'CTRR', 1, '2006-05-13', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '2006-12-20', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '2006-07-25', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '2006-08-07', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '2006-08-15', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '2006-05-20', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '2006-05-13', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '2006-05-20', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '2006-12-20', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '2006-07-25', 9.75, 'Dat'),
('K1304', 'THDC', 1, '2006-05-20', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '2006-05-13', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '2006-12-20', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '2006-07-25', 10.00, 'Dat'),
('K1305', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '2006-05-13', 10.00, 'Dat');



--3_HUY Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan h? HOCVIEN.
USE QUANLYGIAOVU_3_HUY
ALTER TABLE HOCVIEN_3_HUY
ADD 
    GHICHU_3_HUY NVARCHAR(255),
    DIEMTB_3_HUY FLOAT, 
    XEPLOAI_3_HUY NVARCHAR(20); 

--II.Ngôn ngữ thao tác dữ liệu
--Cau1_3_HUY Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN_3_HUY
SET HESO_3_HUY = HESO_3_HUY + 0.2
WHERE MAGV_3_HUY IN (
    SELECT TRGKHOA_3_HUY
    FROM KHOA_3_HUY
);

--Cau2_3_HUY: Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các
--môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau
--cùng).
UPDATE HOCVIEN_3_HUY
SET DIEMTB_3_HUY = (
    SELECT AVG(DIEM_3_HUY)
    FROM (
        SELECT MAHV_3_HUY, MAMH_3_HUY, MAX(LANTHI_3_HUY) AS MAX_LANTHI
        FROM KETQUATHI_3_HUY
        GROUP BY MAHV_3_HUY, MAMH_3_HUY
    ) AS LAST_ATTEMPT
    INNER JOIN KETQUATHI_3_HUY ON 
        KETQUATHI_3_HUY.MAHV_3_HUY = LAST_ATTEMPT.MAHV_3_HUY 
        AND KETQUATHI_3_HUY.MAMH_3_HUY = LAST_ATTEMPT.MAMH_3_HUY
        AND KETQUATHI_3_HUY.LANTHI_3_HUY = LAST_ATTEMPT.MAX_LANTHI
    WHERE KETQUATHI_3_HUY.MAHV_3_HUY = HOCVIEN_3_HUY.MAHV_3_HUY
);


--Cau3_3_HUY Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất
-- kỳ thi lần thứ 3 dưới 5 điểm.

UPDATE HOCVIEN_3_HUY
SET GHICHU_3_HUY = 'Cam thi'
WHERE MAHV_3_HUY IN (
    SELECT KEQ.MAHV_3_HUY
    FROM KETQUATHI_3_HUY KEQ
    INNER JOIN (
        SELECT MAHV_3_HUY, MAMH_3_HUY
        FROM KETQUATHI_3_HUY
        WHERE LANTHI_3_HUY = 3 AND DIEM_3_HUY < 5
    ) AS ThirdAttempt
    ON KEQ.MAHV_3_HUY = ThirdAttempt.MAHV_3_HUY AND KEQ.MAMH_3_HUY = ThirdAttempt.MAMH_3_HUY
)
--Cau3_3_HUY: Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
-- Nếu DIEMTB >= 9 thì XEPLOAI = ”XS”
-- Nếu 8 <= DIEMTB < 9 thì XEPLOAI = “G”
-- Nếu 6.5 <= DIEMTB < 8 thì XEPLOAI = “K”
-- Nếu 5 <= DIEMTB < 6.5 thì XEPLOAI = “TB”
-- Nếu DIEMTB < 5 thì XEPLOAI = ”Y”

UPDATE HOCVIEN_3_HUY
SET XEPLOAI_3_HUY = 
    CASE
        WHEN DIEMTB_3_HUY >= 9 THEN 'XS'
        WHEN DIEMTB_3_HUY >= 8 AND DIEMTB_3_HUY < 9 THEN 'G'
        WHEN DIEMTB_3_HUY >= 6.5 AND DIEMTB_3_HUY < 8 THEN 'K'
        WHEN DIEMTB_3_HUY >= 5 AND DIEMTB_3_HUY < 6.5 THEN 'TB'
        WHEN DIEMTB_3_HUY < 5 THEN 'Y'
    END;

--III. Ngôn ngữ truy vấn dữ liệu
--Cau1_3_HUY: In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.

SELECT H.MAHV_3_HUY, H.HO_3_HUY + ' ' + H.TEN_3_HUY AS HOTEN_3_HUY, H.NGSINH_3_HUY, L.MALOP_3_HUY
FROM HOCVIEN_3_HUY H
INNER JOIN LOP_3_HUY L ON H.MAHV_3_HUY = L.TRGLOP_3_HUY;

--Cau2_3_HUY: In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”,
--sắp xếp theo tên, họ học viên.

SELECT *
FROM KETQUATHI_3_HUY
WHERE MAMH_3_HUY = 'CTRR' AND MAHV_3_HUY LIKE 'K12%'

--Cau3_3_HUY: In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi
--lần thứ nhất đã đạt.
SELECT KQ.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, KQ.MAMH_3_HUY
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
WHERE KQ.LANTHI_3_HUY = 1 AND KQ.KQUA_3_HUY = 'Dat';

--Cau4_3_HUY: In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở
-- lần thi 1)

SELECT KQ.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, KQ.MAMH_3_HUY
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
WHERE KQ.LANTHI_3_HUY = 1 AND KQ.KQUA_3_HUY = 'Khong Dat' AND KQ.MAMH_3_HUY = 'CTRR' AND KQ.MAHV_3_HUY LIKE 'K11%';

--Cau5_3_HUY: * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả
--các lần thi).

SELECT DISTINCT HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY
FROM HOCVIEN_3_HUY HV
JOIN KETQUATHI_3_HUY KQ ON HV.MAHV_3_HUY = KQ.MAHV_3_HUY
JOIN LOP_3_HUY L ON HV.MALOP_3_HUY = L.MALOP_3_HUY
WHERE 
    L.MALOP_3_HUY LIKE 'K%' 
    AND KQ.MAMH_3_HUY = 'CTRR'
    AND HV.MAHV_3_HUY NOT IN (
        SELECT KQ1.MAHV_3_HUY
        FROM KETQUATHI_3_HUY KQ1
        WHERE KQ1.MAMH_3_HUY = 'CTRR' AND KQ1.KQUA_3_HUY = 'Dat'
)

--Cau6_3_HUY: Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm
--2006.

SELECT DISTINCT MH.TENMH_3_HUY
FROM GIANGDAY_3_HUY GD
INNER JOIN MONHOC_3_HUY MH ON GD.MAMH_3_HUY = MH.MAMH_3_HUY
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
WHERE GV.HOTEN_3_HUY= 'Tran Tam Thanh' AND GD.HOCKY_3_HUY = 1 AND GD.NAM_3_HUY = 2006;

--Cau7_3_HUY: Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy
--trong học kỳ 1 năm 2006.

SELECT MH.MAMH_3_HUY, MH.TENMH_3_HUY
FROM GIANGDAY_3_HUY GD
INNER JOIN MONHOC_3_HUY MH ON GD.MAMH_3_HUY = MH.MAMH_3_HUY
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
INNER JOIN LOP_3_HUY L ON GV.MAGV_3_HUY = L.MAGVCN_3_HUY
WHERE L.MALOP_3_HUY = 'K11' AND GD.HOCKY_3_HUY = 1 AND GD.NAM_3_HUY = 2006;

--Cau8_3_HUY:Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So
--Du Lieu”.

SELECT HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN_LOPTRG_3_HUY
FROM LOP_3_HUY L
INNER JOIN HOCVIEN_3_HUY HV ON L.TRGLOP_3_HUY = HV.MAHV_3_HUY
INNER JOIN GIANGDAY_3_HUY GD ON L.MALOP_3_HUY = GD.MALOP_3_HUY
INNER JOIN MONHOC_3_HUY MH ON GD.MAMH_3_HUY = MH.MAMH_3_HUY
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
WHERE GV.HOTEN_3_HUY = 'Nguyen To Lan' AND MH.TENMH_3_HUY = 'Co So Du Lieu';

--Cau9_3_HUY: In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So
--Du Lieu”

SELECT MH1.MAMH_3_HUY , MH1.TENMH_3_HUY 
FROM DIEUKIEN_3_HUY DK
INNER JOIN MONHOC_3_HUY  MH1 ON DK.MAMH_TRUOC_3_HUY  = MH1.MAMH_3_HUY 
INNER JOIN MONHOC_3_HUY  MH2 ON DK.MAMH_3_HUY  = MH2.MAMH_3_HUY 
WHERE MH2.TENMH_3_HUY  = 'Co So Du Lieu';

--Cau10_3_HUY: Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học,
-- tên môn học) nào.
SELECT MH.MAMH_3_HUY, MH.TENMH_3_HUY
FROM DIEUKIEN_3_HUY DK
INNER JOIN MONHOC_3_HUY MH ON DK.MAMH_3_HUY = MH.MAMH_3_HUY
WHERE DK.MAMH_TRUOC_3_HUY = (SELECT MAMH_3_HUY FROM MONHOC_3_HUY WHERE TENMH_3_HUY = 'Cau Truc Roi Rac');

--Cau11_3_HUY: Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1
--năm 2006.

SELECT GV.HOTEN_3_HUY
FROM GIANGDAY_3_HUY GD
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
INNER JOIN MONHOC_3_HUY MH ON GD.MAMH_3_HUY = MH.MAMH_3_HUY
INNER JOIN LOP_3_HUY L ON GD.MALOP_3_HUY = L.MALOP_3_HUY
WHERE MH.MAMH_3_HUY = 'CTRR' AND (L.MALOP_3_HUY = 'K11' OR L.MALOP_3_HUY = 'K12') AND GD.HOCKY_3_HUY = 1 AND GD.NAM_3_HUY = 2006
GROUP BY GV.HOTEN_3_HUY
HAVING COUNT(DISTINCT L.MALOP_3_HUY) = 2;

--Cau12_3_HUY: Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng
-- chưa thi lại môn này. 

SELECT KQ.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
WHERE MH.MAMH_3_HUY = 'CSDL' AND KQ.LANTHI_3_HUY = 1 AND KQ.KQUA_3_HUY = 'Khong Dat'
AND NOT EXISTS (
    SELECT 1
    FROM KETQUATHI_3_HUY KQ2
    WHERE KQ2.MAHV_3_HUY = KQ.MAHV_3_HUY AND KQ2.MAMH_3_HUY = KQ.MAMH_3_HUY AND KQ2.LANTHI_3_HUY > 1
);

--Cau13_3_HUY: Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.

SELECT GV.MAGV_3_HUY, GV.HOTEN_3_HUY
FROM GIAOVIEN_3_HUY GV
LEFT JOIN GIANGDAY_3_HUY GD ON GV.MAGV_3_HUY = GD.MAGV_3_HUY
WHERE GD.MAGV_3_HUY IS NULL;

--Cau14_3_HUY: Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào
--thuộc khoa giáo viên đó phụ trách.

SELECT GV.MAGV_3_HUY, GV.HOTEN_3_HUY
FROM GIAOVIEN_3_HUY GV
LEFT JOIN GIANGDAY_3_HUY GD ON GV.MAGV_3_HUY = GD.MAGV_3_HUY
LEFT JOIN KHOA_3_HUY K ON K.TRGKHOA_3_HUY = GV.MAGV_3_HUY
WHERE GD.MAGV_3_HUY IS NULL 

--Cau15_3_HUY: Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat”
-- hoặc thi lần thứ 2 môn CTRR được 5 điểm.

SELECT DISTINCT HV.HO_3_HUY, HV.TEN_3_HUY
FROM HOCVIEN_3_HUY HV
INNER JOIN KETQUATHI_3_HUY KQ ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
WHERE KQ.MAHV_3_HUY LIKE 'K11%' AND 
(
	(KQ.LANTHI_3_HUY >=3 AND KQ.KQUA_3_HUY = 'Khong Dat') 
	OR (KQ.LANTHI_3_HUY = 2 AND KQ.MAMH_3_HUY= 'CTRR')
)

--Cau16_3_HUY: Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm
--học.

SELECT GV.HOTEN_3_HUY
FROM GIANGDAY_3_HUY GD
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
INNER JOIN MONHOC_3_HUY MH ON GD.MAMH_3_HUY = MH.MAMH_3_HUY
INNER JOIN LOP_3_HUY L ON GD.MALOP_3_HUY = L.MALOP_3_HUY
WHERE MH.MAMH_3_HUY = 'CTRR'
GROUP BY GV.HOTEN_3_HUY, GD.HOCKY_3_HUY, GD.NAM_3_HUY
HAVING COUNT(DISTINCT L.MALOP_3_HUY) >= 2;

--Cau17_3_HUY: Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).

SELECT KQ.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, KQ.DIEM_3_HUY
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
WHERE MH.MAMH_3_HUY = 'CSDL'
AND KQ.LANTHI_3_HUY = (SELECT MAX(LANTHI_3_HUY) FROM KETQUATHI_3_HUY WHERE MAHV_3_HUY = KQ.MAHV_3_HUY AND MAMH_3_HUY = KQ.MAMH_3_HUY);

--Cau18_3_HUY: Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần
-- thi).
SELECT KQ.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, MAX(KQ.DIEM_3_HUY) AS DIEM
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
WHERE MH.TENMH_3_HUY = 'Co So Du Lieu'
GROUP BY KQ.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY;

--Cau19_3_HUY:Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất

SELECT TOP 3 MAKHOA_3_HUY, TENKHOA_3_HUY
FROM KHOA_3_HUY
ORDER BY NGTLAP_3_HUY ASC;

--Cau20_3_HUY: Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.

SELECT COUNT(*) AS SO_GIAOVIEN
FROM GIAOVIEN_3_HUY
WHERE HOCHAM_3_HUY IN ('GS', 'PGS');

--Cau21_3_HUY: Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi
--khoa.

SELECT MAKHOA_3_HUY, HOCVI_3_HUY, COUNT(*) AS SO_GIAOVIEN
FROM GIAOVIEN_3_HUY
WHERE HOCVI_3_HUY IN ('CN', 'KS', 'Ths', 'TS', 'PTS')
GROUP BY MAKHOA_3_HUY, HOCVI_3_HUY;

--Cau22_3_HUY: Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).

SELECT KQ.MAMH_3_HUY, MH.TENMH_3_HUY, KQ.KQUA_3_HUY, COUNT(*) AS SO_HOCVIEN
FROM KETQUATHI_3_HUY KQ
INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
GROUP BY KQ.MAMH_3_HUY, MH.TENMH_3_HUY, KQ.KQUA_3_HUY;

--Cau23_3_HUY: Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho
-- lớp đó ít nhất một môn học.

SELECT GV.MAGV_3_HUY, GV.HOTEN_3_HUY
FROM GIAOVIEN_3_HUY GV
INNER JOIN LOP_3_HUY L ON GV.MAGV_3_HUY = L.MAGVCN_3_HUY
INNER JOIN GIANGDAY_3_HUY GD ON L.MALOP_3_HUY = GD.MALOP_3_HUY
WHERE GD.MAGV_3_HUY = GV.MAGV_3_HUY
GROUP BY GV.MAGV_3_HUY, GV.HOTEN_3_HUY;

--Cau24_3_HUY: Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.

SELECT TOP 1 HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN
FROM HOCVIEN_3_HUY HV
INNER JOIN LOP_3_HUY L ON HV.MALOP_3_HUY = L.MALOP_3_HUY
WHERE L.SISO_3_HUY = (SELECT MAX(SISO_3_HUY) FROM LOP_3_HUY);

--Cau25_3_HUY: * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả
--các lần thi).

SELECT LOP_3_HUY.TENLOP_3_HUY, HOCVIEN_3_HUY.HO_3_HUY, HOCVIEN_3_HUY.TEN_3_HUY
FROM LOP_3_HUY
JOIN HOCVIEN_3_HUY ON LOP_3_HUY.MALOP_3_HUY = HOCVIEN_3_HUY.MALOP_3_HUY
JOIN KETQUATHI_3_HUY KQ ON HOCVIEN_3_HUY.MAHV_3_HUY = KQ.MAHV_3_HUY
WHERE LOP_3_HUY.TRGLOP_3_HUY = HOCVIEN_3_HUY.MAHV_3_HUY
AND KQ.KQUA_3_HUY = 'Khong Dat'
GROUP BY LOP_3_HUY.TENLOP_3_HUY, HOCVIEN_3_HUY.HO_3_HUY, HOCVIEN_3_HUY.TEN_3_HUY, HOCVIEN_3_HUY.MAHV_3_HUY
HAVING COUNT(DISTINCT KQ.MAMH_3_HUY) <= 3;

--Cau26_3_HUY: Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.

SELECT HV.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, COUNT(*) AS SO_MON_DAT_9_10
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
WHERE KQ.DIEM_3_HUY IN (9, 10)
GROUP BY HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY
ORDER BY SO_MON_DAT_9_10 DESC

--Cau27_3_HUY: Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.

SELECT HV.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, L.TENLOP_3_HUY, COUNT(*) AS SO_MON_DAT_9_10
FROM KETQUATHI_3_HUY KQ
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
INNER JOIN LOP_3_HUY L ON HV.MALOP_3_HUY = L.MALOP_3_HUY
WHERE KQ.DIEM_3_HUY IN (9, 10)
GROUP BY HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY, L.TENLOP_3_HUY
HAVING COUNT(CASE WHEN KQ.DIEM_3_HUY IN (9, 10) THEN 1 END) = (
    SELECT MAX(SO_MON_DAT_9_10)
    FROM (
        SELECT HV.MAHV_3_HUY, COUNT(*) AS SO_MON_DAT_9_10
        FROM KETQUATHI_3_HUY KQ
        INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
        WHERE KQ.DIEM_3_HUY IN (9, 10)
        GROUP BY HV.MAHV_3_HUY
    ) AS SubQuery
)
ORDER BY L.TENLOP_3_HUY;

--Cau28_3_HUY: Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao
--nhiêu lớp.

SELECT GD.HOCKY_3_HUY, GD.NAM_3_HUY, GD.MAGV_3_HUY, GV.HOTEN_3_HUY, COUNT(DISTINCT GD.MAMH_3_HUY) AS SO_MON, COUNT(DISTINCT GD.MALOP_3_HUY) AS SO_LOP
FROM GIANGDAY_3_HUY GD
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
GROUP BY GD.HOCKY_3_HUY, GD.NAM_3_HUY, GD.MAGV_3_HUY, GV.HOTEN_3_HUY;

-- Cau29_3_HUY: Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.

SELECT GD.HOCKY_3_HUY, GD.NAM_3_HUY, GD.MAGV_3_HUY, GV.HOTEN_3_HUY, COUNT(*) AS SO_MON_LOP
FROM GIANGDAY_3_HUY GD
INNER JOIN GIAOVIEN_3_HUY GV ON GD.MAGV_3_HUY = GV.MAGV_3_HUY
GROUP BY GD.HOCKY_3_HUY, GD.NAM_3_HUY, GD.MAGV_3_HUY, GV.HOTEN_3_HUY
ORDER BY SO_MON_LOP DESC

-- Cau30_3_HUY: Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.

SELECT KQ.MAMH_3_HUY, MH.TENMH_3_HUY, COUNT(*) AS SO_HOCVIEN_KHONG_DAT
FROM KETQUATHI_3_HUY KQ
INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
WHERE KQ.LANTHI_3_HUY = 1 AND KQ.KQUA_3_HUY = 'Khong Dat'
GROUP BY KQ.MAMH_3_HUY, MH.TENMH_3_HUY
ORDER BY SO_HOCVIEN_KHONG_DAT DESC

--Câu 31_3_HUY: Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT HV.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN
FROM HOCVIEN_3_HUY HV
WHERE NOT EXISTS (
    SELECT 1
    FROM KETQUATHI_3_HUY KQ
    WHERE KQ.MAHV_3_HUY = HV.MAHV_3_HUY AND KQ.LANTHI_3_HUY = 1 AND KQ.KQUA_3_HUY = 'Khong Dat'
)
GROUP BY HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY;

--Cau32_3_HUY:  * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT HV.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN
FROM HOCVIEN_3_HUY HV
WHERE NOT EXISTS (
    SELECT 1
    FROM KETQUATHI_3_HUY KQ
    WHERE KQ.MAHV_3_HUY = HV.MAHV_3_HUY AND KQ.LANTHI_3_HUY = (SELECT MAX(LANTHI_3_HUY) FROM KETQUATHI_3_HUY WHERE MAHV_3_HUY = KQ.MAHV_3_HUY AND MAMH_3_HUY = KQ.MAMH_3_HUY) AND KQ.KQUA_3_HUY = 'Khong Dat'
)
GROUP BY HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY;

--Cau 33_3_HUY: * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).

SELECT HV.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN
FROM HOCVIEN_3_HUY HV
WHERE NOT EXISTS (
    SELECT 1
    FROM KETQUATHI_3_HUY KQ
    INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
    WHERE KQ.MAHV_3_HUY = HV.MAHV_3_HUY AND KQ.LANTHI_3_HUY = 1 AND KQ.KQUA_3_HUY = 'Khong Dat'
)
GROUP BY HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY;

--Cau34_3_HUY: * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).

SELECT HV.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN
FROM HOCVIEN_3_HUY HV
WHERE NOT EXISTS (
    SELECT 1
    FROM KETQUATHI_3_HUY KQ
    INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
    WHERE KQ.MAHV_3_HUY = HV.MAHV_3_HUY AND KQ.LANTHI_3_HUY = (SELECT MAX(LANTHI_3_HUY) FROM KETQUATHI_3_HUY WHERE MAHV_3_HUY = KQ.MAHV_3_HUY AND MAMH_3_HUY = KQ.MAMH_3_HUY) AND KQ.KQUA_3_HUY = 'Khong Dat'
)
GROUP BY HV.MAHV_3_HUY, HV.HO_3_HUY, HV.TEN_3_HUY;
--Cau35_3_HUY:  ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần
-- thi sau cùng).

SELECT KQ.MAMH_3_HUY, MH.TENMH_3_HUY, KQ.MAHV_3_HUY, HV.HO_3_HUY + ' ' + HV.TEN_3_HUY AS HOTEN, KQ.DIEM_3_HUY
FROM KETQUATHI_3_HUY KQ
INNER JOIN MONHOC_3_HUY MH ON KQ.MAMH_3_HUY = MH.MAMH_3_HUY
INNER JOIN HOCVIEN_3_HUY HV ON KQ.MAHV_3_HUY = HV.MAHV_3_HUY
WHERE KQ.LANTHI_3_HUY = (SELECT MAX(LANTHI_3_HUY) FROM KETQUATHI_3_HUY WHERE MAHV_3_HUY = KQ.MAHV_3_HUY AND MAMH_3_HUY = KQ.MAMH_3_HUY)
ORDER BY KQ.MAMH_3_HUY, KQ.DIEM_3_HUY DESC;









