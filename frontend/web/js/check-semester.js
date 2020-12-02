/*
function chiTietSV(mssv)
{
	$.post({
		url: "/oude/check", // đường link đến file xử lý 
		dataType: "json", // dữ liệu nhận về dạng json
		data: { // dữ liệu được gửi đến file xử lý
			'mssv': mssv
		},
		success: function (result){ // sự kiện xảy ra khi ajax thành công
			//$("#dialog").attr("title", "Thông tin sinh viên " + result.ho + " " + result.ten + " (" + result.mssv + ")");
			var table = "<table class='table table-hover table-striped' id = 'result1'>";
		
			table += "<tr>";
			table += "<th class = 'align-middle'>MÃ ĐƠN VỊ LIÊN KẾT</th>";
			table += "<td class = 'align-middle'>" + result.mssv + "</td>";
			table += "</tr>";
			
			table += "<tr>";
			table += "<th class = 'align-middle'>TÊN ĐƠN VỊ LIÊN KẾT</th>";
			table += "<td class = 'align-middle'>" + result.giay_ks + "</td>";
			table += "</tr>";
		
			table += "<tr>";
			table += "<th class = 'align-middle'>DÂN TỘC</th>";
			table += "<td class = 'align-middle'>" + result.bang_cap + "</td>";
			table += "</tr>";
			
			table += "<tr>";
			table += "<th class = 'align-middle'>QUỐC TỊCH</th>";
			table += "<td class = 'align-middle'>" + result.hinh + "</td>";
			table += "</tr>";
			
			table += "<tr>";
			table += "<th class = 'align-middle'>NGÀNH ĐÀO TẠO</th>";
			table += "<td class = 'align-middle'>" + result.phieu_dkxcb + "</td>";
			table += "</tr>";
			
			table += "<tr>";
			table += "<th class = 'align-middle'>GIẤY KHAI SINH</th>";
			table += "<td class = 'align-middle'>" + result.ct_dt + "</td>";
			table += "</tr>";
			
			
			
			
			table += "</table>";
			
			$("#dialog").html(table); // add bảng vào dialog
			
			$( "#dialog" ).dialog({ // tạo dialog
				width: 'auto',
				maxWidth: 1000,
				fluid: true,
				my: "center",
				at: "center",
				of: window,
				modal: true, // không cho phép thao tác các vị trí khác khi dialog xuất hiện
				buttons: {
					OK: function() { // hủy thông tin hiển thị của sinh viên cũ
						$( this ).dialog( "destroy" );
					}
				},
				close: function() { // hủy thông tin hiển thị của sinh viên cũ
					$( this ).dialog( "destroy" );
				}
			});
		}
	});
}
*/

function chiTietSV(mssv)
{
	$(document).ready(function() {
		
	
		$.ajax({
			url: '/oude/check',
			dataType: "json", // dữ liệu nhận về dạng json
			data: { // dữ liệu được gửi đến file xử lý
				'mssv': mssv
			},
			success: function (result){
				var table = "<table class='table table-hover table-striped' id = 'result1'>";
				table += "<tr>";
				table += "<th class = 'align-middle'>MÃ ĐƠN VỊ LIÊN KẾT</th>";
				table += "<td class = 'align-middle'>" + result.mssv + "</td>";
				table += "</tr>";
				
				table += "<tr>";
				table += "<th class = 'align-middle'>TÊN ĐƠN VỊ LIÊN KẾT</th>";
				table += "<td class = 'align-middle'>" + result.giay_ks + "</td>";
				table += "</tr>";
			
				table += "<tr>";
				table += "<th class = 'align-middle'>DÂN TỘC</th>";
				table += "<td class = 'align-middle'>" + result.bang_cap + "</td>";
				table += "</tr>";
				
				table += "<tr>";
				table += "<th class = 'align-middle'>QUỐC TỊCH</th>";
				table += "<td class = 'align-middle'>" + result.hinh + "</td>";
				table += "</tr>";
				
				table += "<tr>";
				table += "<th class = 'align-middle'>NGÀNH ĐÀO TẠO</th>";
				table += "<td class = 'align-middle'>" + result.phieu_dkxcb + "</td>";
				table += "</tr>";
				
				table += "<tr>";
				table += "<th class = 'align-middle'>GIẤY KHAI SINH</th>";
				table += "<td class = 'align-middle'>" + result.ct_dt + "</td>";
				table += "</tr>";
				table += "</table>";
				
				$("#dialog").html(table); // add bảng vào dialog
				
				$( "#dialog" ).dialog({ // tạo dialog
					width: 'auto',
					maxWidth: 1000,
					fluid: true,
					my: "center",
					at: "center",
					of: window,
					modal: true, // không cho phép thao tác các vị trí khác khi dialog xuất hiện
					buttons: {
						OK: function() { // hủy thông tin hiển thị của sinh viên cũ
							$( this ).dialog( "destroy" );
						}
					},
					close: function() { // hủy thông tin hiển thị của sinh viên cũ
						$( this ).dialog( "destroy" );
					}
				});
			}
		});
	});
}