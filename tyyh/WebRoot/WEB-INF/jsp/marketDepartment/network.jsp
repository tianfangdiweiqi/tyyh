<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">
$(function() {
		getNoticeCountBytime();
		function getNoticeCountBytime(){
 		setInterval(function(){cot();},5000);
 	}
	function cot(){
		 	$.ajax({
				url:"getData/getlogincont",
				type:"POST",
				datatype:"text",
				success:function(data){
					if(data == "out"){
					alert("您的账号在其他主机登陆!");
						window.location.href="login/Logout";
					}
				}
			});
	}
	
	var ipaddress=$("#ipaddress").val();
	var times=$("#times").val();
	var OrLogin=$("#OrLogin").val();
	
	if(OrLogin=="Login"){
		
		if(ipaddress=="" && times=="" && a==1){
			alert("您好！欢迎您首次登录！")
		}else{
			alert("   上次登录时间："+times)
		}
	}
	});
	$(function() {
		$(".line").click();
	});
</script>
</head>
<body>
<div class="head">
  <div class="logo"><img src="statics/common/images/logo.png" /></div>
  <ul class="hav">
    <li class="line" onclick="NewPage('statics/market_department/networkWelcome.jsp')">我的桌面</li>

      
  </ul>
  <div class="login" id="admin">
       <span >网络部-${loginUser.position.position_name}-${loginUser.emp_name }</span>
      <div class="person">
           <span  onclick="NewPage('Employee/ShowEmployee/'+${loginUser.emp_id})">个人中心</span>
           <span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span>
           <span onclick="openPage('login/Logout')">退出</span>
      </div>
  </div>
</div>

<div class="content">
   <div class="left">
       <ul>
           
           <li ><img src="statics/common/images/tb2.png"  />
             <span>信息量</span>
                  <dl class="sonUl">
                    <dt>管理信息量</dt>
                     <dd class="ddDiv" onclick="NewPage('Network/networkAdd')">新增咨询量</dd>
                     <dd class="ddDiv" onclick="NewPage('Network/networkQuery')">查询信息量</dd>
                    <!--  <dd class="ddDiv" onclick="NewPage('Network/networkHand')">查询提交量</dd> -->
                  </dl>
           </li>
       </ul>


   </div>
   <div class="right">
   <input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
    <input type="hidden" name="上次登录ip" id="ipaddress" value="${lastLoginInfo.account_login_ipaddress }">
   		<input type="hidden" name="上次登录时间" id="times" value="${lastLoginInfo.account_login_times }">
   
      <iframe  id="frmright" name="frmright" src="statics/market_department/networkWelcome.jsp" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>
</div>
</body>
</html>
