<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use yii\web\UploadedFile;

use backend\models\UploadForm;
use backend\models\StudentStatus;
use backend\models\SinhVien;
use backend\models\HocKiTotNghiep;
use backend\models\HoSoSinhVien;
use backend\models\KetQua;
use backend\models\SinhVienHocKi;

use backend\utilities\Graduation;


/**
 * Site controller
 */
class OudeController extends Controller
{
	public $layout = 'demo1';
	
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
	
	public function actionAdd()
	{
		if (Yii::$app->request->isAjax) 
		{
			$data = $_POST['data'];
			//$data = \Yii::$app->request->post('data');	
		}
		$student = new StudentStatus();
		Graduation::addToStudentStatus($student, $data);
		
		return [
			'success' => 'success',
		];
	}
}
