<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use frontend\models\SinhVien;

$model = new SinhVien();
?>

<html>
<body>

	
	
	
	<?= Html::beginForm(['order/update', 'id' => 'duy'], 'post') ?>
	
	<?= Html::input('text', 'username', 'duy', ['class' => 'teo']) ?>
	<?= Html::submitButton('Submit', ['class' => 'submit']) ?>
	
	<?= Html::endForm() ?>

	
</body>
</html>

