<?php
namespace app\models;
namespace backend\models;

use yii\base\Model;
use yii\db\ActiveRecord;

class SinhVien extends ActiveRecord
{
	public static function tableName()
	{
		return '{{tb_sinh_vien}}';
	}
	
}
