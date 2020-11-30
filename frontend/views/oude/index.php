<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use frontend\models\Student;
use yii\captcha\Captcha;

$student = new Student();
?>

<html>
<body>
	
	
	<!--
		<?php //$form = ActiveForm::begin(); ?>

    <?= //$form->field($model, 'mssv') ?>

    <div class="form-group">
        <?= //Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div>
	
	<?= //Alert::widget() ?>
	-->
	
		<div class="container-fluid">
			<div id = "find-table" class ="row justify-content-center">
				<div class = "col-sm-6 find_mssv">
					<div style = 'font-size:18px; background-color:#007bff' class = "full-screen font-weight-bold text-dark text-center"><span class="align-middle">TRA CỨU THÔNG TIN TÌNH TRẠNG XÉT TỐT NGHIỆP</span></div>
					<div class="row justify-content-center"><span style = "color: red; font-size: 15px; margin-bottom:5px;" class="badge badge-warning">Vui lòng chọn tra cứu bằng mã số hoặc họ tên sinh viên</span></div>
					
					<?= Html::beginForm() ?>
					
						<div class="form-group">
							<label class="badge badge-info" for="" style="font-size:15px;">Mã số sinh viên</label>
							<div class="input-group">
								<?= Html::input('text', 'mssv','', ['class' => 'form-control', 'id' => 'mssv']) ?>
							</div>
						</div>
						
						<div class="form-group">
							<label class="badge badge-info" for="" style="font-size:15px;">Họ và tên</label>
							<div class="input-group">
								<?= Html::input('text', 'username','', ['class' => 'form-control', 'id' => 'username']) ?>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">Đợt tốt nghiệp :</label>
						</div>
						
						<?= Html::checkbox('agree', false, ['id' => "seeHistory", 'label' => 'Tìm kiếm không cần chọn đợt']) ?>
						
						<div>
						Nếu không tìm thấy thông tin tình trạng xét tốt nghiệp của sinh viên. Xin vui lòng liên hệ:
						</div>
						<div>
							<b>
								Trung tâm Đào tạo từ xa - Trường Đại học Mở Thành phố Hồ Chí Minh
							</b>
							<br>
								Phòng 004 - 97 Võ Văn Tần, Phường 6, Quận 3, Thành phố Hồ Chí Minh
							<br>
								Điện thoại: 18006119 (bấm phím 1)
							
						</div>
						
						<label style="font-size:15px;" class="badge badge-info"> Mã xác nhận: </label>
						<?php
							echo Captcha::widget([
								'name' => 'captcha',
							]);
						?>
						
						<?= Html::submitButton('Submit', ['class' => 'btn btn-primary btn-lg btn-block']) ?>
					
					<?= Html::endForm() ?>
					
				</div>
			</div>

			<!---------------------------------------------------------------------------------------------->
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
						foreach($students as $student)
						{
					?>
					<tr>
						<td class='align-middle'><?php echo $student['mssv']; ?></td>
						<td class='align-middle'><?php echo $student['ho']; ?></td>
						<td class='align-middle'><?php echo $student['ten']; ?></td>
						
						<td><a class="btn btn-outline-primary" id = "detail" href="#">Xem chi tiết</a></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			<!---------------------------------------------------------------------------------------------->
		<div>
	
</body>
</html>

