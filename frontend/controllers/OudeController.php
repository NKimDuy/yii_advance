<?php

namespace frontend\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use frontend\models\Student;
use yii\web\Response;

class OudeController extends Controller
{
	public $layout = 'demo1';
    public function actionIndex()
    {
		
		$mssv = \Yii::$app->request->post('mssv', '');
		
		$students = Student::find()->where(['mssv' => $mssv])->all();
		
        //$nhieuSinhVien = SinhVien::find()->all();

        return $this->render('index', [
            'students' => $students
        ]);
    }
	
	public function actionCheck($mssv)
	{
		if(\Yii::$app->request->isAjax){
			\Yii::$app->response->format = Response::FORMAT_JSON;
			$student = Student::findOne($mssv);
			$studentStatus = $student->studentStatus;
			return $studentStatus;
		}
		
		//$mssv = \Yii::$app->request->post('mssv', '');
		/*
		$student = Student::findOne($mssv);
		$studentStatus = $student->studentStatus;
		return json_encode($studentStatus);
		*/
	}
	
	 public function actions()
    {
        return [
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
            ],
        ];
	}
}