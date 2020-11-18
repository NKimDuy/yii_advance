/*
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
*/

$(document).ready(() =>{
	
	var rowsGetByExcel = 0; // các dòng hiện có trong excel
	var flagTitle = false; // cờ dùng để kiểm tra các cột của excel có đúng định dạng hay không
	var checkTitle = ["stt", "ma_dvlk", "ten_dvlk", "mssv", "ho", "ten", "ngay_sinh", "noi_sinh", "gioi_tinh", "dan_toc"
					, "quoc_tich", "nganh_dt", "giay_ks", "bang_cap", "hinh", "phieu_dkxcb", "ct_dt", "hinh_thuc_dt", "diem"
					, "xep_loai", "dk_tn", "ho_temp", "ten_temp", "temp", "hk", "chi_tiet_hk"];
	
	var title = []; // lưu thông tin tiêu đề các cột
	var record = ""; // lưu thông tin các record
	var wb = null; // lưu giữ thông tin workbook nào đang được tương tác
	var sheetName = null; // lấy worksheet tương ứng với workbook
	var range = null; // lấy tất cả các ô có giá trị trong sheet
	$('#input-excel').change(function(e){ // khi file excel đã được lấy lên, sau đó sẽ được xử lý
		var reader = new FileReader();
		reader.readAsArrayBuffer(e.target.files[0]);
		reader.onload = function(e) {
			var data = new Uint8Array(reader.result);
			wb = XLSX.read(data,{type:'array'}); // tạo ra workbook từ dataReader vừa load file lên
			// lấy giá trị các ô trong excel
			sheetName = wb.Sheets["Sheet1"]; // lấy sheet có tên là Sheet1
			range = XLSX.utils.decode_range(sheetName['!ref']); // !ref có ý nghĩa là chỉ chọn vùng nào có tồn tại dữ liệu
			var htmlstr = XLSX.write(wb,{sheet:"Sheet1", type:'string', bookType:'html'});
			
			var R = 0; // chỉ mục của dòng đầu tiên để lấy các tiêu đề cột
			for(var C = range.s.c; C <= range.e.c; ++C) {
				var cell_address = {c:C, r:R}; // lấy chỉ mục của ô
				var cell_ref = XLSX.utils.encode_cell(cell_address); // phân giải ô 
				var desired_cell = sheetName[cell_ref]; // lấy giá trị của ô
				title.push(desired_cell.v); // thêm các tiêu đề cột vào mảng title
			}
			
			for(var R = range.s.r; R <= range.e.r; ++R) {
				rowsGetByExcel += 1;
			}
			alert(rowsGetByExcel - 1); // hiện các dòng có trong excel
			
			/*
			if (title.length != checkTitle.length) { // kiểm tra mảng chứa cột tiêu đề có khớp với yêu cầu hay không
				$("#notification").text("file excel nhập vào không hợp lệ");
			}
			else {
				for (var i = 0 ; i < title.length ; i++) {
					if (title[i] != checkTitle[i]) {
						$("#notification").text("file excel nhập vào không hợp lệ");
						flagTitle = false; 
						break;
						// nếu bất kì cột nào không khớp, cờ vẫn sẽ duy trì false , và thoát ra ngoài
						// ngay lập tức
					}
					else {
						$("#notification").text("");
						flagTitle = true;
					}
				}
			}
			*/
			
			//if (flagTitle) { // nếu file excel hợp lệ
				$('#upload')[0].innerHTML += htmlstr;
				$("#upload > table").addClass("table table-hover");
				$("#upload table tr:first-child").prepend("<td><input id='chkAll' type='checkbox'  onclick='checkAll()' /></td>");
				$("#upload table tr").not("tr:first-child").prepend("<td><input type='checkbox' /></td>");
				$("#upload table tr:first-child").css("font-weight","bold");
				//$("#upload table tr").prepend("<td><input type='checkbox' /></td>");
			//}

			// gán ID đến các checkbox tương ứng, bắt đầu là 1
			var input_index = range.s.r + 1;
			$("#upload table input:checkbox").each(function(index, item) {
				if (index != 0) {
					$(item).attr("id",input_index++);
				}
				
			});				
		}
		
	});
	
	
});