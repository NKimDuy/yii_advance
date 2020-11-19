<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;
use backend\models\Upload;
use yii\helpers\Url;

?>

<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($model, 'uploadFile')->fileInput(['id' => 'input-excel']) ?>

    <!--<button>Submit</button>-->
	<?= Html::submitButton('Submit', ['class' => 'btn btn-primary btn-lg btn-block']) ?>

<?php ActiveForm::end() ?>

<div id="upload" ></div>