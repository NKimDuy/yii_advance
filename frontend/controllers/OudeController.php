<?php

namespace frontend\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use frontend\models\SinhVien;

class OudeController extends Controller
{
    public function actionIndex()
    {
		$mssv = Yii::$app->request->post('username', '');
		
		$nhieuSinhVien = SinhVien::find()->where('mssv' => $mssv)->all();
		
        //$nhieuSinhVien = SinhVien::find()->all();

        return $this->render('index', [
            'nhieuSinhVien' => $nhieuSinhVien,
        ]);
    }
}
