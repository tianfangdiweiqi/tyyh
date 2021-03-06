<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>列表模板</title>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript" src="statics/employment_department/laydate/laydate.js"></script>
    <script type="text/javascript">
        $(function(){
            /*点击删除*/
            $(".deleteBotton").click(function(){
                $(".mbStyle").css("display","block");
                $(".deleteStyle").css("display","block");
            });
            /*确定删除*/
            $(".bottomStyle1").click(function(){
                $(".mbStyle").css("display","none");
                $(".deleteStyle").css("display","none");
                alert('你点击了确定')
            });
            /*删除取消*/
            $(".bottomStyle2").click(function(){
                $(".mbStyle").css("display","none");
                $(".deleteStyle").css("display","none");
                alert('你点击了取消')
            });
        });

        /*表格全选*/
        $(function(){
            $("#all").click(function(){
                var checked=$(this).is(":checked");
                $(".selectTable tr td").children().attr("checked",checked);
            });
            //判断是否全选
            function ifAllChecked(){
                var checkedBoxs=$(".selectTable tr td").children();
                var sum=checkedBoxs.size();
                var k=0;
                checkedBoxs.each(function(index,dom){
                    if($(dom).is(":checked")) k++;
                });
                if(k==sum){
                    $("#all").attr("checked",true);
                }else{
                    $("#all").attr("checked",false);
                }
            }
            ifAllChecked();//页面加载完后运行
            $("#queryy").click(function(){
	  
	      showinfo(1);
	      }); 
	      showinfo(1);
	   
        });
        /*表格全选结束*/
        
	     	 function show(data){
	     	 
	         var visits=data.visits; 
	         var index=data.index;
	         var count = data.count;
	        showxinxi(visits);
	        showpage(index,count);
	    }
	     function showxinxi(visits){
	      $("#list").empty();
	 	 
	 $("#list").append(" <tr bgcolor='#5f9ea0'><th >编号</th><th>姓名</th><th>班级</th> <th>最新回访日期</th> <th>管理</th> </tr>");

	 for(var i=0;i<visits.length;i++){
	     var ss=visits[i].visit_createtime==null?"无":visits[i].visit_createtime;
	     $("#list").append("<tr><td >"+(i+1)+"</td><td>"+visits[i].studentname+"</td><td>"+visits[i].gradename+"</td><td>"+ss+"</td> <td><a href='employment_department/huifangxinxi.html?id="+visits[i].visit_studentId+"' class='edit' >查看</a><a href='employment_department/addhuifang?id="+visits[i].visit_studentId+"' class='edit' >添加</a></td></tr>");
	 }
	 } 
        function showinfo(index){
	     var query=$("#query").serialize()+"&index="+index;
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/huifanglist?",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		data:query,
		success: show
	});
	     
	    
	   
	     } 
	     
	     
	      function showpage(index,count){
	 $("#page").empty();
	 if(count != 0){
	 $("#page").append("<span><a href='javascript:onclick=showinfo(1)'>首页</a></span>");
	 if(index!=1){$("#page").append("<span><a href='javascript:onclick=showinfo("+(index-1)+")'>上一页</a></span>");}
	 for(var i=1;i<=count;i++){
	 $("#page").append("<span><a href='javascript:onclick=showinfo("+i+")'>"+i+"</a></span>");
	 }
	  if(index!=count){$("#page").append("<span><a href='javascript:onclick=showinfo("+(index+1)+")'>下一页</a></span>");}
	   $("#page").append("<span><a href='javascript:onclick=showinfo("+count+")'>末页</a></span>");
	   $("#page").append("<span>当前第"+index+"页，共"+count+"页</span>");}
	   else  $("#page").append("<span>当前第"+index+"页，共"+count+"页</span>");
	 }
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <div class="serach">
        <form  id="query">
            <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
                <tr>
                    <td>学员姓名:</td> <td><input type="search"  class="searchStyle" style="width:160px;" name="studentname" onkeyup="return showinfo(1)"/></td>
                    <td class="tdWidth">班级:</td>
                  <td>
                   <select class="selectStyle"style="width: 120px" name="gradename" onchange="showinfo(1)">
                   <option value="">请选择</option>
                  <c:if test="${grades != null }">
                  <c:forEach items="${grades }" var="grade">
                   <option>${grade.gradename }</option>
                  </c:forEach>
                  </c:if>
                  </select>
                  </td>
                    <td><input type="button"  value="搜索" class="searchBotton" id="queryy" /></td>


                </tr>


            </table>
        </div>

        <h1 class="tabTitle">回访记录</h1>
        <div class="divTable" >
            <table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="list">
                <tr bgcolor="#5f9ea0">
                   

                    <th>序号</th>
                    <th>姓名</th>
                    <th>班级</th>
                    <th>联系电话</th>
                   
                    <th>回访日期</th>
                    
                    <th>操作</th>

                </tr>

            </table>
            </form>
            <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
            <div class="btposition2">
                <div><input type="button" class="BackBotton" value="返回" /></div>
            </div>
        </div>

    </div>
</div>
<div class="mbStyle">&nbsp;</div>
<!--<div class="deleteStyle">
    <h3>操作提示</h3>
    <h2>确定要删除吗？</h2>
    <div class="btn">
        <div class="bottomStyle1">确定</div>
        <div class="bottomStyle2">取消</div>
    </div>
</div>-->
</body>
</html>
