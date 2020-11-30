<?php

namespace frontend\models;

use yii\db\ActiveRecord;

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
}
