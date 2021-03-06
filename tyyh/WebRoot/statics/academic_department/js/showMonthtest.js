/*查询月考成绩*/
function showMonthtest() {
	var studentClassId = $("#selectGrade").val();
	var createTime = $("#createTime").val();
	$.ajax({
		type : "post",// 请求类型
		url : "getMonthByClassIdAndCreateTime?studentClassId=" + studentClassId
				+ "&&createTime=" + createTime,// 请求的url
		// data:{pid:studentClassId},//请求参数
		dataType : "json",// ajax接口（请求url）返回的数据类型
		success : function(data) {// data：返回数据（json对象）
			$("#showMonthtest").html("");
			var firstTr = "<tr><th>学号</th><th>姓名</th><th>笔试</th><th>机试</th>";
			var table = "";
			for ( var i = 0; i < data.length; i++) {
				table += "<tr><td style=\"width: 200px;\">"
						+ data[i].stu_number
						+ "</td><td style=\"width: 200px;\">"
						+ data[i].stu_name
						+ "</td><td style=\"width: 200px;\">" + data[i].written
						+ "</td><td style=\"width: 200px;\">" + data[i].scjd
						+ "</td></tr>";
			}
			$("#showMonthtest").html(firstTr + table);
		},
		error : function(data) {// 当访问时候，404，500 等非200的错误状态码
			alert("加载月考成绩失败");
		}
	});
}

$(function() {
	showMonthtest();
});