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


-- Dumping database structure for new_oude
CREATE DATABASE IF NOT EXISTS `new_oude` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `new_oude`;

-- Dumping structure for table new_oude.ho_so_sinh_vien
DROP TABLE IF EXISTS `ho_so_sinh_vien`;
CREATE TABLE IF NOT EXISTS `ho_so_sinh_vien` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `id_dan_toc` int DEFAULT NULL COMMENT 'id dân tộc',
  `id_noi_sinh` int DEFAULT NULL COMMENT 'id nơi sinh',
  `id_quoc_tich` int DEFAULT NULL COMMENT 'id quốc tịch',
  `id_dvlk` int DEFAULT NULL COMMENT 'id đơn vị liên kết',
  `id_nganh` int DEFAULT NULL COMMENT 'id ngành',
  `id_htdt` int DEFAULT NULL COMMENT 'id hình thức đào tạo',
  PRIMARY KEY (`mssv`),
  CONSTRAINT `ho_so_sinh_vien_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.ho_so_sinh_vien: ~0 rows (approximately)
/*!40000 ALTER TABLE `ho_so_sinh_vien` DISABLE KEYS */;
/*!40000 ALTER TABLE `ho_so_sinh_vien` ENABLE KEYS */;

-- Dumping structure for table new_oude.sinh_vien
DROP TABLE IF EXISTS `sinh_vien`;
CREATE TABLE IF NOT EXISTS `sinh_vien` (
  `mssv` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `ho` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'họ có dấu',
  `ho_kd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'họ không dấu',
  `ten` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên có dấu',
  `ten_kd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tẻn không có dấu',
  `ngay_sinh` date DEFAULT NULL COMMENT 'ngày sinh',
  `gioi_tinh` tinyint(1) DEFAULT NULL COMMENT 'giới tính',
  PRIMARY KEY (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.sinh_vien: ~2 rows (approximately)
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` (`mssv`, `ho`, `ho_kd`, `ten`, `ten_kd`, `ngay_sinh`, `gioi_tinh`) VALUES
	('1651010030', 'nguyễn kim', 'nguyen kim', 'duy', 'duy', '1998-02-27', 1),
	('1651010163', 'Phạm Minh', 'Pham Minh', 'Viễn', 'vien', '1996-06-06', 1);
/*!40000 ALTER TABLE `sinh_vien` ENABLE KEYS */;

-- Dumping structure for table new_oude.sv_hk
DROP TABLE IF EXISTS `sv_hk`;
CREATE TABLE IF NOT EXISTS `sv_hk` (
  `mssv` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `ma_hk` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã học kì',
  PRIMARY KEY (`mssv`,`ma_hk`),
  KEY `ma_hk` (`ma_hk`),
  CONSTRAINT `sv_hk_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`),
  CONSTRAINT `sv_hk_ibfk_2` FOREIGN KEY (`ma_hk`) REFERENCES `tb_hk_tot_nghiep` (`ma_hk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.sv_hk: ~0 rows (approximately)
/*!40000 ALTER TABLE `sv_hk` DISABLE KEYS */;
/*!40000 ALTER TABLE `sv_hk` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_dan_toc
DROP TABLE IF EXISTS `tb_dan_toc`;
CREATE TABLE IF NOT EXISTS `tb_dan_toc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_dan_toc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên dân tộc',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_dan_toc: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_dan_toc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dan_toc` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_don_vi_lk
DROP TABLE IF EXISTS `tb_don_vi_lk`;
CREATE TABLE IF NOT EXISTS `tb_don_vi_lk` (
  `ma_dvlk` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã đơn vị liên kết',
  `ten_dvlk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên đơn vị liên kết',
  PRIMARY KEY (`ma_dvlk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_don_vi_lk: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_don_vi_lk` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_don_vi_lk` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_hk_tot_nghiep
DROP TABLE IF EXISTS `tb_hk_tot_nghiep`;
CREATE TABLE IF NOT EXISTS `tb_hk_tot_nghiep` (
  `ma_hk` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã học kì',
  `chi_tiet_hk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chi tiết học kì',
  PRIMARY KEY (`ma_hk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_hk_tot_nghiep: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_hk_tot_nghiep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_hk_tot_nghiep` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_ht_dao_tao
DROP TABLE IF EXISTS `tb_ht_dao_tao`;
CREATE TABLE IF NOT EXISTS `tb_ht_dao_tao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh_thuc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên hình thức đào tạo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_ht_dao_tao: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_ht_dao_tao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ht_dao_tao` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_ket_qua
DROP TABLE IF EXISTS `tb_ket_qua`;
CREATE TABLE IF NOT EXISTS `tb_ket_qua` (
  `mssv` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `diem` int DEFAULT NULL COMMENT 'điểm',
  `xep_loai` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'xếp loại',
  `dk_tn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'điều kiện tốt nghiệp',
  PRIMARY KEY (`mssv`),
  CONSTRAINT `tb_ket_qua_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_ket_qua: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_ket_qua` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ket_qua` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_nganh
DROP TABLE IF EXISTS `tb_nganh`;
CREATE TABLE IF NOT EXISTS `tb_nganh` (
  `ma_nganh` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã ngành',
  `ten_nganh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên ngành',
  PRIMARY KEY (`ma_nganh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_nganh: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_nganh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nganh` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_quoc_tich
DROP TABLE IF EXISTS `tb_quoc_tich`;
CREATE TABLE IF NOT EXISTS `tb_quoc_tich` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_quoc_tich` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên quốc tịch',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_quoc_tich: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_quoc_tich` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_quoc_tich` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_tinh_thanh
DROP TABLE IF EXISTS `tb_tinh_thanh`;
CREATE TABLE IF NOT EXISTS `tb_tinh_thanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tinh_thanh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên tỉnh thành',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_tinh_thanh: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_tinh_thanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tinh_thanh` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_tinh_trang_sv
DROP TABLE IF EXISTS `tb_tinh_trang_sv`;
CREATE TABLE IF NOT EXISTS `tb_tinh_trang_sv` (
  `mssv` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mã số sinh viên',
  `giay_ks` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'giấy khai sinh',
  `bang_cap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'băng cấp',
  `hinh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phieu_dkxcb` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'phiếu đăng kí xét cấp băng',
  `ct_dt` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chương trình đào tạo',
  PRIMARY KEY (`mssv`),
  CONSTRAINT `tb_tinh_trang_sv_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_tinh_trang_sv: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_tinh_trang_sv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tinh_trang_sv` ENABLE KEYS */;

-- Dumping structure for table new_oude.tb_upload
DROP TABLE IF EXISTS `tb_upload`;
CREATE TABLE IF NOT EXISTS `tb_upload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table new_oude.tb_upload: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_upload` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
