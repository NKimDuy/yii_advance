<?php

namespace frontend\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use frontend\models\Student;

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
}
