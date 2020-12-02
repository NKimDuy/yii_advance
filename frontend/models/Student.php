<?php

namespace frontend\models;

use yii\db\ActiveRecord;
use frontend\models\Student;

class Student extends ActiveRecord
{
	public $captcha;
	const SCENARIO_FIND = 'find';
	
	public static function tableName()
    {
		return '{{tb_sinh_vien}}';
    }
	
	public function scenarios() 
	{
		$scenarios = parent::scenarios();
		$scenarios[self::SCENARIO_FIND] = ['mssv'];
		return $scenarios;
	}
	
	public function rules()
	{
		return [
			[['mssv', 'captcha'], 'required', 'on' => self::SCENARIO_FIND],
			['captcha', 'captcha'],
		];
	}
	
	public function getStudentStatus() 
	{
		return $this->hasOne(StudentStatus::className(), ['mssv' => 'mssv']);
	}
	
	public function getResult() 
	{
		return $this->hasOne(Result::className(), ['mssv' => 'mssv']);
	}
	
	public function getStudentRecord() 
	{
		return $this->hasOne(StudentRecord::className(), ['mssv' => 'mssv']);
	}
	
	public function getGraduationSemesters() 
	{
		return $this->hasMany(GraduationSemester::className(), ['ma_hk' => 'ma_hk'])
				->viaTable('tb_sv_hk', ['mssv' => 'mssv']);
	}
}
