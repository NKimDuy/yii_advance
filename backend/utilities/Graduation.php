<?php
namespace backend\utilities;

class Graduation
{
	
	public static function addToStudentStatus($student, $data)
	{
		$student->mssv = $data[3];
		$student->giay_ks = $data[12];
		$student->bang_cap = $data[13];
		$student->hinh = $data[14];
		$student->phieu_dkxcb = $data[15];
		$student->ct_dt = $data[16];
		
		$student->save();
	}
	
	public static function addToStudent($student, $data)
	{
		$student->mssv = $data[3];
		$student->ho = $data[4];
		$student->ho_kd = $data[21];
		$student->ten = $data[5];
		$student->ten_kd = $data[22];
		$student->ngay_sinh = $data[6];
		$student->gioi_tinh = $data[7];
		
		$student->save();
	}
	
	public static function addToStudentRecord($student, $data)
	{
		
	}
	
	public static function addToGraduationSemester($student, $data)
	{
		$student->ma_hk = $data[24];
		$student->chi_tiet_hk = $data[25];
		
		$student->save();
	}
	
	public static function addToSemesterStudent($student, $data)
	{
		
	}
	
	public static function addToResult($student, $data)
	{
		$student->mssv = $data[3];
		$student->diem = $data[18];
		$student->xep_loai = $data[19];
		$student->dk_tn = $data[20];
		
		$student->save();
	}
}
