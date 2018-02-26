<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/uniform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-media.css" />
<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='${pageContext.request.contextPath}/http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

function namef(){
var str = "";
	var name = document.getElementById("username").value;
	var span = document.getElementById("nameSpan");
	//var str = "";
	  $.ajax({
		url:"${pageContext.request.contextPath}/user/FindUserServlet",
		data:{"name":name},           //"pwd="+pwd
		type:"post",
		dataType:"text",
		async:false,
		success:function(data){
			str = data;
			str = str.replace(/^\s*|\s*$/g, '');	
		}
	});     
	
			if(name==null||name==""){
				span.innerHTML="用户名不可以为空";
			}else{
				if(str=="yes"){
					span.innerHTML="用户已被注册";
				}else{
					span.innerHTML="";
				}
			}			
}

function emailf(){
		var email = document.getElementById("email").value;
		var emailSpan = document.getElementById("emailSpan");
		var text=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		if(text.test(email)){
			emailSpan.innerHTML="";
		}else{
			emailSpan.innerHTML="邮箱格式不正确";
		}
	}
function passf() {
		 var password1 = document.getElementById("password").value;
		 var password2 = document.getElementById("password1").value;
		 var pass1Span = document.getElementById("passSpan");
		 var pass2Span = document.getElementById("pass1Span");
		 
		 if(password1==null||password1==""){
			 	pass1Span.innerHTML="密码不能为空";
		 }else{
			 pass1Span.innerHTML="";
			 if(password1.length<6){
				 	pass1Span.innerHTML="密码不能小于6位";
			 }else{
				 pass1Span.innerHTML="";
			 }
		 }
		 if(password2!=null&&password2!=""){
			 if(password1!=password2){
				 	pass2Span.innerHTML="两次密码不一致";
			 }else{
				 pass2Span.innerHTML="";
			 }
		 }
	}

function ajax(name) {
		var xmlHttp;
		//判断浏览器的版本
		if(window.activeXObject){
			xmlHttp = new activeXObject("MicrosoftXMLHttp");
		}else{
			xmlHttp = new XMLHttpRequest();
		}
		//回调函数
		xmlHttp.onreadystatechange = function () {
			//xml文件状态
			if(xmlHttp.readyState==4){
			//服务器响应状态
				if(xmlHttp.status==200){
						str = xmlHttp.responseText;
						str = str.replace(/^\s*|\s*$/g, '');
				}
			}
		};
		//发送请求到后台（发送的方式，url，是否是异步）
		//xmlHttp.open("GET", "${pageContext.request.contextPath }/user/FindUserServlet?name="+name, true);
		//xmlHttp.send(null);
		xmlHttp.open("POST", "${pageContext.request.contextPath}/user/FindUserServlet", false);
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset:utf-8");
		xmlHttp.send("name="+name);
	}	
	
</script>

<body>

<!--close-Header-part--> 

<!--top-Header-menu-->




<!--sidebar-menu-->


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Form elements</a> <a href="#" class="current">Validation</a> </div>
    <h1>新用户注册</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>注册表</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/addNUser" novalidate="novalidate">
              <div class="control-group">
                <label class="control-label">用户名</label>
                <div class="controls">
                  <input type="text" name="username" id="username" onblur="namef()" style="width: 483px; ">
                  <p id="nameSpan" style="color:red"></p>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">邮箱</label>
                <div class="controls">
                  <input type="text" name="email" id="email" onblur="emailf()" style="width: 483px; ">
                  <p id="emailSpan" style="color:red"></p>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">密码</label>
                <div class="controls">
                  <input type="text" name="password" id="password" onblur="passf()" style="width: 483px; ">
                  <p id="passSpan" style="color:red"></p>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">确认密码</label>
                <div class="controls">
                  <input type="text" name="password1" id="password1" onblur="passf()" style="width: 483px; ">
                  <p id="pass1Span" style="color:red"></p>
                </div>
              </div>
              <div class="form-actions">
              	<span class="pull-middle"><input type="reset" value="撤销" class="btn btn-success"></span>
                <span class="pull-middle"><input type="submit" value="确认" class="btn btn-success"></span>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>

<!--end-Footer-part-->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath}/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.form_validation.js"></script>
</body>
</body>
</html>