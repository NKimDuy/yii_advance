
var range = null;
function addslashes(str) { // có nhiệm vụ hiểu dấu nháy đơn trong chuỗi
	return (str + '').replace(/[\\"']/g, '\\$&').replace(/\u0000/g, '\\0');
}

function checkAll() { // chọn hoặc bỏ chọn tất cả các checkbox
	if($("#chkAll").is(':checked')) {
		$("#upload table input:checkbox:not(#chkAll)").prop("checked","checked");
	}
	else {
		$("#upload table input:checkbox:not(#chkAll)").prop("checked",false);
	}
}

function showDataFromExcel(htmlstr, rangeSR, rangeER) {
	
	$('#upload')[0].innerHTML += htmlstr;
	$("#upload > table").addClass("table table-hover");
	$("#upload table tr:first-child").prepend("<td><input id='chkAll' type='checkbox'  onclick='checkAll()' /></td>"); // thêm checkbox để check tất cả các dòng
	$("#upload table tr").not("tr:first-child").prepend("<td><input type='checkbox' /></td>"); // thêm checkbox để biểt dòng nào được chọn để thêm
	$("#upload table tr:first-child").css("font-weight","bold");
	
	var input_index = parseInt(rangeSR) + 1;
	$("#upload table input:checkbox").each(function(index, item) {
		if (index != 0) {
			$(item).attr("id",input_index++);
		}
		
	});		
	
	var rowsGetByExcel = 0;
	for(var R = parseInt(rangeSR); R <= parseInt(rangeER); ++R) {
		rowsGetByExcel += 1;
	}
	alert(rowsGetByExcel - 1); // hiện các dòng có trong excel
}

function getDataFromExcel(e) {
	
	var reader = new FileReader();
	reader.readAsArrayBuffer(e.target.files[0]);
	reader.onload = function(ev) {
		ev.preventDefault();
		var data = new Uint8Array(reader.result);
		var wb = XLSX.read(data,{type:'array'}); // tạo ra workbook từ dataReader vừa load file lên
		// lấy giá trị các ô trong excel
		var sheetName = wb.Sheets["Sheet1"]; // lấy sheet có tên là Sheet1
		range = XLSX.utils.decode_range(sheetName['!ref']); // !ref có ý nghĩa là chỉ chọn vùng nào có tồn tại dữ liệu
		var htmlstr = XLSX.write(wb,{sheet:"Sheet1", type:'string', bookType:'html'});  // dữ liêu từ excel đã được lấy lên, sẵn sàng để hiển thị lên
		
		showDataFromExcel(htmlstr, range.s.r, range.e.r);
		
	}
	
}


$(document).ready(() =>{
	
	
	$('#input-excel').change(function(e){ // khi file excel đã được lấy lên, sau đó sẽ được xử lý
		getDataFromExcel(e);
		//showDataFromExcel(data);
		
		
	});
	
	$("#btnAdd").click((ev) => {
		//ev.preventDefault();
		$("#upload table input:checked:not(#chkAll)").each(function(index, item) {
			
			var R = $(item).attr("id"); // lấy dòng tương ứng với ID của checkbox
							
			var value_temp = [];
			try {
				for(var C = range.s.c; C <= range.e.c; ++C) {
					var cell_address = {c:C, r:parseInt(R)};
					var cell_ref = XLSX.utils.encode_cell(cell_address);
					
					var desired_cell = sheetName[cell_ref];
					if (desired_cell === undefined)
						desired_cell = "";
					value_temp.push(addslashes(desired_cell.v));
				}
			}
			catch(e) {
				console.log(e.message);
			}
			//  '<?php echo Yii::app()->createUrl("oude/addToTinhTrangSinhVien"); ?>'
			//  'index.php?r=oude/add-to-tinh-trang-sinh-vien'
			//   '/oude/add-to-new-oude'
			$.post({ 
				url: 'index.php?r=oude/add',//'<?php echo Url::to(["oude/add-to-tinh-trang-sinh-vien"]); ?>', // ????????????????????????????????????
				data: {
					"data": value_temp
				},
				dataType: "json",
				error: function() {
					addRowSuccessfully = false;
				},
				success: function(data) {
					alert('abc');
				}
			});
			//alert(value_temp[3]);
		});
	});
	
});