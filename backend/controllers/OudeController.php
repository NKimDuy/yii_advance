<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use backend\models\UploadForm;
use backend\models\TinhTrangSinhVien;
use yii\web\UploadedFile;

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
				return;
			}
		}
		
		return $this->render('upload', ['model' => $model]);
	}
	
	public function addToTinhTrangSinhVien()
	{
		sinhVien = new TinhTrangSinhVien();
		
	}
}
