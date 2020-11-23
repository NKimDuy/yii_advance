<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use yii\web\UploadedFile;

use backend\models\UploadForm;
use backend\models\TinhTrangSinhVien;
use backend\models\SinhVien;
use backend\models\HocKiTotNghiep;
use backend\models\HoSoSinhVien;
use backend\models\KetQua;
use backend\models\SinhVienHocKi;


/**
 * Site controller
 */
class OudeController extends Controller
{
	public $layout = 'demo1';
    
	private function addToSinhVien($data = []) 
	{
		$sinhVien = new SinhVien();
		
		$sinhVien->mssv = $data[3];
		$sinhVien->ho = $data[4];
		$sinhVien->ho_kd = $data[21];
		$sinhVien->ten = $data[5];
		$sinhVien->ten_kd = $data[22];
		$sinhVien->ngay_sinh = $data[6];
		$sinhVien->gioi_tinh = $data[7];
		
		$sinhVien->save();
	}
	
	private function addToHoSoSinhVien($data = []) 
	{
		$sinhVien = new HoSoSinhVien();
		
	}
	
	private function addToTinhTrangSinhVien($data)
	{
		
		$sinhVien = new TinhTrangSinhVien();
		$sinhVien->mssv = $data[3];
		$sinhVien->giay_ks = $data[12];
		$sinhVien->bang_cap = $data[13];
		$sinhVien->hinh = $data[14];
		$sinhVien->phieu_dkxcb = $data[15];
		$sinhVien->ct_dt = $data[16];
		
		$sinhVien->save();
	}
	
	private function addToHocKiTotNghiep($data = []) 
	{
		$sinhVien = new HocKiTotNghiep();
		$sinhVien->ma_hk = $data[24];
		$sinhVien->chi_tiet_hk = $data[25];
		
		$sinhVien->save();
	}
	
	private function addToSinhVienHocKi($data = []) {}
	
	private function addToKetQua($data = []) 
	{
		$sinhVien = new KetQua();
		$sinhVien->mssv = $data[3];
		$sinhVien->diem = $data[18];
		$sinhVien->xep_loai = $data[19];
		$sinhVien->dk_tn = $data[20];
		
		$sinhVien->save();
	}
	
	public function actionIndex()
	{
		return $this->render('index', [
            'nhieuSinhVien' => 'dy'
        ]);
	}
	
	public function actionUpload()
	{
		$model = new UploadForm();
		   
		if (Yii::$app->request->isPost)
		{
			$model->uploadFile = UploadedFile::getInstance($model, 'uploadFile');
			
			if($model->loadFile()) 
			{
				//return $this->redirect('upload');
				return;
			}
		}
		
		return $this->render('upload', ['model' => $model]);
	}
	
	public function actionAddToNewOude()
	{
		if (Yii::$app->request->isAjax) 
		{
			$data = $_POST['data'];
			//$data = \Yii::$app->request->post('data');	
		}
		$this->addToTinhTrangSinhVien($data);
		//addToSinhVien($data);
		//addToHoSoSinhVien($data);
		
		//addToHocKiTotNghiep($data);
		//addToSinhVienHocKi($data);
		//addToKetQua($data);
		
		return [
			'success' => 'success',
		];
	}
}
