<?php

namespace backend\models;

use yii\db\ActiveRecord;

class Upload extends ActiveRecord
{
	
	public static function tableName()
    {
		return '{{tb_upload}}';
    }
	
}
