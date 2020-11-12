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
	
	<table class="table table-striped" id = "result1" >
		<thead>
			<tr>
				<th>MÃ SỐ SINH VIÊN</th>
				<th>HỌ</th>
				<th>TÊN</th>
			</tr>
		</thead>
		<tbody>
			<?php
				foreach($nhieuSinhVien as $sinhVien)
				{
			?>
			<tr>
				<td class='align-middle'><?php echo $sinhVien['mssv']; ?></td>
				<td class='align-middle'><?php echo $sinhVien['ho']; ?></td>
				<td class='align-middle'><?php echo $sinhVien['ten']; ?></td>
				
				<td><a class="btn btn-outline-primary" id = "detail" href="#">Xem chi tiết</a></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	
</body>
</html>

