<?php

namespace frontend\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use frontend\models\Student;
use frontend\models\GraduationSemester;
use yii\web\Response;

class OudeController extends Controller
{
	public $layout = 'demo1';
    public function actionIndex()
    {
		$allGraduationSemester = GraduationSemester::find()->select(['chi_tiet_hk'])->indexBy('ma_hk')->column(); // lấy tất cả học kì hiện có trong database
		
		$allStudentInSemester = [];
		
		if(\Yii::$app->request->isPost){
		
			$selectedSemester = \Yii::$app->request->post('semesterlist', ''); // người dùng chọn học kì hiện tại
			
			$currentSemester = GraduationSemester::findOne($selectedSemester); // tìm trong database tương ứng với học kì mà người dùng chọn
			
			$mssv = \Yii::$app->request->post('mssv', ''); // lấy được mã số sinh viên
			
			$username = \Yii::$app->request->post('username', ''); // lấy được họ tên
			
			$allStudentInSemester = $currentSemester->getStudents() // lấy tất cả sinh viên thuộc học kì hiện tại bằng mã số sinh viên
								->where(['like', 'mssv', $mssv])
								->all(); 
								
			//$allStudentInSemester = $currentSemester->getStudents() // lấy tất cả sinh viên thuộc học kì hiện tại
			//					->where(['or', ['like', 'CONCAT(ho, " ", ten)', $username], ['like', 'CONCAT(ho_kd, " ", ten_kd)' , $username]])
			//					->all(); 
			
			
			//$students = Student::find()->where(['mssv' => $mssv])->all();

			
		}
		return $this->render('index', [
			'allStudentInSemester' => $allStudentInSemester,
			'allGraduationSemester' => $allGraduationSemester
		]);
    }
	
	public function actionCheck($mssv, $semester)
	{
		if(\Yii::$app->request->isAjax){
			
			\Yii::$app->response->format = Response::FORMAT_JSON;
			
			$student = Student::findOne($mssv); // sinh viên
			
			$studentStatus = $student->studentStatus; //tình trạng sinh viên
			
			
			
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