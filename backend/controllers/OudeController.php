<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use yii\web\UploadedFile;

use backend\models\UploadForm;

use backend\models\StudentStatus;
use backend\models\Student;
use backend\models\Result;
use backend\models\StudentRecord;
use backend\models\SemesterStudent;
use backend\models\GraduationSemester;


use backend\utilities\Graduation;


/**
 * Site controller
 */
class OudeController extends Controller
{
	public $layout = 'demo1';
	
	public function actionIndex()
	{
		return $this->render('index', [
            'nhieuSinhVien' => 'dy'
        ]);
	}
	
	public function actionUpload()
	{
		$model = new UploadForm();
		   
		if (Yii::$app->request->isPost)
		{
			$model->uploadFile = UploadedFile::getInstance($model, 'uploadFile');
			
			if($model->loadFile()) 
			{
				//return $this->redirect('upload');
				return;
			}
		}
		
		return $this->render('upload', ['model' => $model]);
	}
	
	public function actionAdd()
	{
		if (Yii::$app->request->isAjax) 
		{
			//$data = $_POST['data'];
			$data = \Yii::$app->request->post('data');
		}
		
		$student = new Student();
		Graduation::addToStudent($student, $data); // thêm vào bảng sinh viên  done
		
		$studentStatus = new StudentStatus(); // thêm vào bảng tình trạng sinh viên  done
		Graduation::addToStudentStatus($studentStatus, $data);
		
		$studentRecord = new StudentRecord(); // thêm vào bảng hồ sơ sinh viên
		Graduation::addToStudentRecord($studentRecord, $data);
		
		$result = new Result(); // thêm vào bảng kết quả
		Graduation::addToResult($result, $data);
		
		//$graduationSemester = new GraduationSemester(); // thêm vào bảng học kì
		//Graduation::addToGraduationSemester($graduationSemester, $data);
		
		$semesterStudent = new SemesterStudent(); // thêm vào bảng sinh viên_học kì
		Graduation::addToSemesterStudent($semesterStudent, $data);
		
		
		
		
		
		
		
		
		
		return [
			'success' => 'success',
		];
	}
}
