-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.22 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for graduationdb
CREATE DATABASE IF NOT EXISTS `graduationdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `graduationdb`;

-- Dumping structure for table graduationdb.tb_dan_toc
CREATE TABLE IF NOT EXISTS `tb_dan_toc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_dan_toc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên dân tộc',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_dan_toc: ~61 rows (approximately)
/*!40000 ALTER TABLE `tb_dan_toc` DISABLE KEYS */;
INSERT INTO `tb_dan_toc` (`id`, `ten_dan_toc`) VALUES
	(1, 'KINH'),
	(2, 'TAY'),
	(3, 'THAI'),
	(4, 'HOA'),
	(5, 'KHO ME'),
	(6, 'MUONG'),
	(7, 'NUNG'),
	(8, 'HMONG'),
	(9, 'DAO'),
	(10, 'NGAI'),
	(11, 'SAN CHAY'),
	(12, 'CHAM'),
	(13, 'SAN DIU'),
	(14, 'VAN KIEU'),
	(15, 'THO'),
	(16, 'GIAY'),
	(17, 'CO TU'),
	(18, 'KHO MU'),
	(19, 'TA OI'),
	(20, 'KHANG'),
	(21, 'LAO'),
	(22, 'LA CHI'),
	(23, 'PHU LA'),
	(24, 'LO LO'),
	(25, 'PA THEN'),
	(26, 'CO LAO'),
	(27, 'BO Y'),
	(28, 'SI LA'),
	(29, 'PU PEO'),
	(30, 'KHAC'),
	(31, 'KHAC KINH'),
	(32, 'GIA RAI'),
	(33, 'E DE'),
	(34, 'BA NA'),
	(35, 'XO DANG'),
	(36, 'CO HO'),
	(37, 'HRE'),
	(38, 'MNONG'),
	(39, 'RA GIAI'),
	(40, 'XTIENG'),
	(41, 'GIE TRIENG'),
	(42, 'MA'),
	(43, 'KHO MU'),
	(44, 'CO'),
	(45, 'CHO RO'),
	(46, 'XINH MUN'),
	(47, 'HA NHI'),
	(48, 'CHU RU'),
	(49, 'LA HA'),
	(50, 'LA HU'),
	(51, 'LU'),
	(52, 'CHUT'),
	(53, 'MANG'),
	(54, 'CONG'),
	(55, 'BRAU'),
	(56, 'O DU'),
	(57, 'RO MAM'),
	(58, 'CAO LAN'),
	(59, 'NGAN'),
	(60, 'DAY'),
	(61, 'NUOC NGOAI');
/*!40000 ALTER TABLE `tb_dan_toc` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_don_vi_lk
CREATE TABLE IF NOT EXISTS `tb_don_vi_lk` (
  `ma_dvlk` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã đơn vị liên kết',
  `ten_dvlk` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên đơn vị liên kết',
  PRIMARY KEY (`ma_dvlk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_don_vi_lk: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_don_vi_lk` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_don_vi_lk` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_hk_tot_nghiep
CREATE TABLE IF NOT EXISTS `tb_hk_tot_nghiep` (
  `ma_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã học kì',
  `chi_tiet_hk` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chi tiết học kì',
  PRIMARY KEY (`ma_hk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_hk_tot_nghiep: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_hk_tot_nghiep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_hk_tot_nghiep` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_ho_so_sv
CREATE TABLE IF NOT EXISTS `tb_ho_so_sv` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `id_dan_toc` int DEFAULT NULL COMMENT 'id dân tộc',
  `id_noi_sinh` int DEFAULT NULL COMMENT 'id nơi sinh',
  `id_quoc_tich` int DEFAULT NULL COMMENT 'id quốc tịch',
  `ma_dvlk` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id đơn vị liên kết',
  `ma_nganh` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'id ngành',
  `id_htdt` int DEFAULT NULL COMMENT 'id hình thức đào tạo',
  PRIMARY KEY (`mssv`),
  KEY `ho_so_sinh_vien_ibfk_2_idx` (`id_dan_toc`),
  KEY `ho_so_sinh_vien_ibfk_3_idx` (`id_noi_sinh`),
  KEY `ho_so_sinh_vien_ibfk_4_idx` (`id_quoc_tich`),
  KEY `ho_so_sinh_vien_ibfk_5_idx` (`id_htdt`),
  KEY `ho_so_sinh_vien_ibfk_6` (`ma_nganh`),
  KEY `ho_so_sinh_vien_ibfk_7` (`ma_dvlk`),
  CONSTRAINT `tb_ho_so_sv_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `tb_sinh_vien` (`mssv`),
  CONSTRAINT `tb_ho_so_sv_ibfk_2` FOREIGN KEY (`id_dan_toc`) REFERENCES `tb_dan_toc` (`id`),
  CONSTRAINT `tb_ho_so_sv_ibfk_3` FOREIGN KEY (`id_noi_sinh`) REFERENCES `tb_tinh_thanh` (`id`),
  CONSTRAINT `tb_ho_so_sv_ibfk_4` FOREIGN KEY (`id_quoc_tich`) REFERENCES `tb_quoc_tich` (`id`),
  CONSTRAINT `tb_ho_so_sv_ibfk_5` FOREIGN KEY (`id_htdt`) REFERENCES `tb_ht_dao_tao` (`id`),
  CONSTRAINT `tb_ho_so_sv_ibfk_6` FOREIGN KEY (`ma_nganh`) REFERENCES `tb_nganh` (`ma_nganh`),
  CONSTRAINT `tb_ho_so_sv_ibfk_7` FOREIGN KEY (`ma_dvlk`) REFERENCES `tb_don_vi_lk` (`ma_dvlk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_ho_so_sv: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_ho_so_sv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ho_so_sv` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_ht_dao_tao
CREATE TABLE IF NOT EXISTS `tb_ht_dao_tao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh_thuc` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên hình thức đào tạo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_ht_dao_tao: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_ht_dao_tao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ht_dao_tao` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_ket_qua
CREATE TABLE IF NOT EXISTS `tb_ket_qua` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `diem` int DEFAULT NULL COMMENT 'điểm',
  `xep_loai` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'xếp loại',
  `dk_tn` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'điều kiện tốt nghiệp',
  PRIMARY KEY (`mssv`),
  CONSTRAINT `tb_ket_qua_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `tb_sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_ket_qua: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_ket_qua` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ket_qua` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_nganh
CREATE TABLE IF NOT EXISTS `tb_nganh` (
  `ma_nganh` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã ngành',
  `ten_nganh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên ngành',
  PRIMARY KEY (`ma_nganh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_nganh: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_nganh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nganh` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_quoc_tich
CREATE TABLE IF NOT EXISTS `tb_quoc_tich` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_quoc_tich` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên quốc tịch',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_quoc_tich: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_quoc_tich` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_quoc_tich` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_sinh_vien
CREATE TABLE IF NOT EXISTS `tb_sinh_vien` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `ho` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'họ có dấu',
  `ho_kd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'họ không dấu',
  `ten` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên có dấu',
  `ten_kd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tẻn không có dấu',
  `ngay_sinh` date DEFAULT NULL COMMENT 'ngày sinh',
  `gioi_tinh` tinyint(1) DEFAULT NULL COMMENT 'giới tính',
  PRIMARY KEY (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_sinh_vien: ~2 rows (approximately)
/*!40000 ALTER TABLE `tb_sinh_vien` DISABLE KEYS */;
INSERT INTO `tb_sinh_vien` (`mssv`, `ho`, `ho_kd`, `ten`, `ten_kd`, `ngay_sinh`, `gioi_tinh`) VALUES
	('1651010030', 'nguyễn kim', 'nguyen kim', 'duy', 'duy', '1998-02-27', 1),
	('1651010163', 'Phạm Minh', 'Pham Minh', 'Viễn', 'vien', '1996-06-06', 1);
/*!40000 ALTER TABLE `tb_sinh_vien` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_sv_hk
CREATE TABLE IF NOT EXISTS `tb_sv_hk` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `ma_hk` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã học kì',
  PRIMARY KEY (`mssv`,`ma_hk`),
  KEY `ma_hk` (`ma_hk`),
  CONSTRAINT `tb_sv_hk_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `tb_sinh_vien` (`mssv`),
  CONSTRAINT `tb_sv_hk_ibfk_2` FOREIGN KEY (`ma_hk`) REFERENCES `tb_hk_tot_nghiep` (`ma_hk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_sv_hk: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_sv_hk` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sv_hk` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_tinh_thanh
CREATE TABLE IF NOT EXISTS `tb_tinh_thanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tinh_thanh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên tỉnh thành',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_tinh_thanh: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_tinh_thanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tinh_thanh` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_tinh_trang_sv
CREATE TABLE IF NOT EXISTS `tb_tinh_trang_sv` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `giay_ks` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'giấy khai sinh',
  `bang_cap` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'băng cấp',
  `hinh` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phieu_dkxcb` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'phiếu đăng kí xét cấp băng',
  `ct_dt` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chương trình đào tạo',
  PRIMARY KEY (`mssv`),
  CONSTRAINT `tb_tinh_trang_sv_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `tb_sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_tinh_trang_sv: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_tinh_trang_sv` DISABLE KEYS */;
INSERT INTO `tb_tinh_trang_sv` (`mssv`, `giay_ks`, `bang_cap`, `hinh`, `phieu_dkxcb`, `ct_dt`) VALUES
	('1651010030', 'hợp lệ', 'hợp lệ', 'hợp lệ', 'hợp lệ', 'hoàn thành');
/*!40000 ALTER TABLE `tb_tinh_trang_sv` ENABLE KEYS */;

-- Dumping structure for table graduationdb.tb_upload
CREATE TABLE IF NOT EXISTS `tb_upload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table graduationdb.tb_upload: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_upload` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
