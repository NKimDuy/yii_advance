<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\ActiveField;
use frontend\models\Student;
use frontend\models\GraduationSemester;
use yii\captcha\Captcha;
use yii\jui;
use frontend\assets\AppAsset;

AppAsset::register($this);

$student = new Student(); // tạo lớp lấy các trường tương ứng để tạo các input nhập liệu
$graSemester = new GraduationSemester();
?>

<html>
<body>
		<div id="dialog" style = "display:none;"></div>
		<div class="container-fluid">
			<div id = "find-table" class ="row justify-content-center">
				<div class = "col-sm-6 find_mssv">
					<div style = 'font-size:18px; background-color:#007bff' class = "full-screen font-weight-bold text-dark text-center"><span class="align-middle">TRA CỨU THÔNG TIN TÌNH TRẠNG XÉT TỐT NGHIỆP</span></div>
					<div class="row justify-content-center"><span style = "color: red; font-size: 15px; margin-bottom:5px;" class="badge badge-warning">Vui lòng chọn tra cứu bằng mã số hoặc họ tên sinh viên</span></div>
					
					<?php $form = ActiveForm::begin([
						'id' => 'login-form',
					]) ?>
					
						<div class="form-group">
							<label class="badge badge-info" for="" style="font-size:15px;">Mã số sinh viên</label>
							<div class="input-group">
								<?= $form->field($student, 'mssv')->textInput(['class' => 'form-control', 'id' => 'mssv', 'name' => 'mssv'])->label(false); ?>
							</div>
						</div>
						
						<div class="form-group">
							<label class="badge badge-info" for="" style="font-size:15px;">Họ và tên</label>
							<div class="input-group">
								<?= $form->field($student, 'username')->textInput(['class' => 'form-control', 'id' => 'username', 'name' => 'username'])->label(false); ?>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">Đợt tốt nghiệp :</label>
							
							<?= $form->field($student, 'semester')->dropdownList([$allGraduationSemester],
															['prompt'=>'Vui lòng chọn học kì tốt nghiệp', 'name' => 'semesterlist'])->label(false); ?>
						</div>
						
						<?= Html::checkbox('agree', false, ['id' => "seeHistory", 'label' => 'Tìm kiếm không cần chọn đợt']); ?>
						
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
						
						 <?= $form->field($student, 'captcha')
							->widget(Captcha::className(), ['captchaAction' => ['/site/captcha']]) ?>
						
						<?= Html::submitButton('Submit', ['class' => 'btn btn-primary btn-lg btn-block']) ?>
					
					<?php ActiveForm::end() ?>
					
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
						foreach($allStudentInSemester as $oneStudent)
						{
					?>
					<tr>
						<td class='align-middle'><?php echo $oneStudent['mssv']; ?></td>
						<td class='align-middle'><?php echo $oneStudent['ho']; ?></td>
						<td class='align-middle'><?php echo $oneStudent['ten']; ?></td>
						
						
						<td><a class="btn btn-outline-primary" id = "detail" href="javascript:chiTietSV('<?php echo $oneStudent['mssv']; ?>');">Xem chi tiết</a></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			<!---------------------------------------------------------------------------------------------->
		<div>
	
</body>
</html>

