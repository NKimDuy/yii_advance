<?php

namespace frontend\models;

use yii\db\ActiveRecord;
use frontend\models\Student;

class GraduationSemester extends ActiveRecord
{
	
	public static function tableName()
    {
		return '{{tb_hk_tot_nghiep}}';
    }
	
	public function getStudents() 
	{
		return $this->hasMany(Student::className(), ['mssv' => 'mssv'])
				->viaTable('tb_sv_hk', ['ma_hk' => 'ma_hk']);
	}
}
