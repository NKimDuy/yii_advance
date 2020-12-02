<?php

namespace frontend\models;

use yii\db\ActiveRecord;
use frontend\models\Student;

class StudentRecord extends ActiveRecord
{
	
	
	public static function tableName()
    {
		return '{{tb_ho_so_sv}}';
    }
	
	
	public function getStudent() 
	{
		return $this->hasOne(Student::className(), ['mssv' => 'mssv']);
	}
}
