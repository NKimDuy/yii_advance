<?php
namespace app\models;
namespace backend\models;

use yii\base\Model;
use yii\db\ActiveRecord;

class StudentRecord extends ActiveRecord
{
	public static function tableName()
	{
		return '{{tb_ho_so_sv}}';
	}
	
}
