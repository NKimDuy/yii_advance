<?php

namespace frontend\models;

use yii\db\ActiveRecord;

class SinhVien extends ActiveRecord
{
	const SCENARIO_FIND = 'find';
	
	public static function tableName()
    {
		return '{{sinh_vien}}';
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
			['mssv', 'required', 'on' => self::SCENARIO_FIND],
		];
	}
}
