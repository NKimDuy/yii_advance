<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;
use backend\models\Upload;

$model = new Upload();
?>

<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($model, 'file_name')->fileInput(['id' => 'input-excel']) ?>

    <button>Submit</button>

<?php ActiveForm::end() ?>

<div id="upload" ></div>