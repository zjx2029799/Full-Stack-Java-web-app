<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html >
<html>
<head>
<link href="${pageContext.request.contextPath }/AD/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/AD/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/AD/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/AD/css/adminia.css" rel="stylesheet" /> 
    <link href="${pageContext.request.contextPath }/AD/css/adminia-responsive.css" rel="stylesheet" /> 
    <link href="${pageContext.request.contextPath }/AD/css/pages/plans.css" rel="stylesheet" /> 
    
    <link href="${pageContext.request.contextPath }/AD/https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/AD/css/default.css">
    <link href="${pageContext.request.contextPath }/AD/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传文件</title>
</head>

<script type="text/javascript">

function load(){
	$.ajax({
		url:"${pageContext.request.contextPath }/sub/findTypes",
		data:"",
		type:"post",
		dataType:"json",
		async:true,
		success:function(data){
			var sub = $('#typename');
			for(var i=0;i<data.sublist.length;i++){
				sub.append("<option value='"+data.sublist[i].typename+"'>"+data.sublist[i].typename+"</option>");
			}
		}
	})
}

</script>


<body onload="load()">

	<%
    	Date date = new Date();
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String today = df.format(date);
    %>
	
<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			
			
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">
					
					<li class="divider-vertical"></li>
					
					<li class="dropdown">
						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${user.username }  <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/user/updateUser?id=${user.id}"><i class="icon-user"></i>修改个人用户信息 </a>
							</li>
							
							<!-- <li>
								<a href="./change_password.html"><i class="icon-lock"></i>我的下载</a>
							</li> -->
							
							<li class="divider"></li>
							
							<li>
								<a href="${pageContext.request.contextPath}/user/logout"><i class="icon-off"></i>退出登录</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div> <!-- /nav-collapse -->
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->




<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<div class="span3">
				
				<div class="account-container">
				
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath }/AD/img/headshot.png" alt="" class="thumbnail" />
					</div> <!-- /account-avatar -->
				
					<div class="account-details">
					
						<span class="account-name">${user.username}</span>
						
						<span class="account-role">${user.power }</span>
						
						<span class="account-actions">
							${user.email}
						</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<!-- 在表单中写上传模块，通过jar包实现上传，并且将上传文件的路径保存到数据库中 -->				
				    
				    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>资料库管理</span> <span class="label label-important">3</span></a>
					      <ul>
					        <li><a href="${pageContext.request.contextPath }/jsp/jsp2/upload.jsp">资料上传</a></li>
					        <li><a href="${pageContext.request.contextPath }/com/showFiles">资料库修改</a></li>
					        <li><a href="${pageContext.request.contextPath }/jsp/jsp2/addSub.jsp">增加科目分类</a></li>
					      </ul>
					    </li>
				  
				    
				    <li>
						<a href="${pageContext.request.contextPath }/user/showUser">
							<i class="icon-lock"></i>
							修改/删除用户
						</a>
					</li>
					
					
					<li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>公告管理</span> <span class="label label-important">2</span></a>
					      <ul>
					        <li><a href="${pageContext.request.contextPath }/jsp/jsp2/addBulletin.jsp">添加公告</a></li>
					        <li><a href="${pageContext.request.contextPath }/bul/showBuls">更改或删除公告</a></li>
					      </ul>
					    </li>
					
					
					<li>
						<a href="${pageContext.request.contextPath }/chat/showChats">
							<i class="icon-th-list"></i>
							留言板互动管理		
						</a>
					</li>
					
					<p:doPower value="用户:添加"><li>
						<a href="${pageContext.request.contextPath }/jsp/jsp2/addUser.jsp">
							<i class="icon-user"></i>
							添加用户							
						</a>
					</li></p:doPower>
					
					<li>
						<a href="${pageContext.request.contextPath }/jsp/jsp2/index.jsp">
							<i class="icon-lock"></i>
							主页	
						</a>
					</li>
					
				</ul>	
				
				<hr />
				
				<div class="sidebar-extra">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
				</div> <!-- .sidebar-extra -->
				
				<br />
		
			</div> <!-- /span3 -->
			
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					User Account					
				</h1>
				
				
				<div class="row">
					
					<div class="span9">
				
						<div class="widget">
							
							<div class="widget-header">
								<h3 id="h3msg"></h3>
							</div> <!-- /widget-header -->
									
							<div class="widget-content">
								
								
								
								<div class="tabbable">
						
						<br />
						
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/com/file" enctype="multipart/form-data" method="post">
									<fieldset>
										
										<div class="control-group">											
											<label class="control-label" for="username">上传用户：</label>
											<div class="controls" style="height: 41px; ">
												<input type="text" name="username" id="username" value="${user.username}" readonly="readonly" style="height: 28px; ">
									
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" for="password1">资料科目</label>
											<div class="controls">
												<select id="typename" name="typename">
						
												</select>
												
											</div> 			
										</div> 
										
										<div class="control-group">											
											<label class="control-label" for="password1">上传时间</label>
											<div class="controls">
												<input type="text" name="cdate" id="cdate" value=<%=today%> readonly="readonly" style="height: 30px; ">	
											</div> 			
										</div> 
										
											
										<div class="control-group" style="width: 1522px; height: 240px">											
											<label class="control-label" for="power">上传文件1：</label>
											<div class="controls" style="width: 842px; height: 126px">
												 <input id="file-0a" name="file" class="file" type="file" multiple data-min-file-count="1" style="height: 52px; ">
									                <br>
									                
									                
										<!-- 	<div class="form-actions" style="width: 535px; ">
												<button type="submit" class="btn btn-primary">Save</button>
												<button class="btn">Cancel</button>
											</div> -->
										
																<!-- /form-actions -->
															</div> <!-- /controls -->				
										</div> <!-- /control-group -->			
											<br />
										
									</fieldset>
								</form>
								</div>
								
								
							</div>
						  
						  
						</div>
								
								
								
								
								
								
								
								
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
				
				
				
				
				
				
				
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2016 Go Ideate.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/AD/js/jquery-1.7.2.min.js"></script>


<script src="${pageContext.request.contextPath }/AD/js/bootstrap.js"></script>


<script src="${pageContext.request.contextPath }/AD/http://libs.useso.com/js/jquery/2.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/AD/js/fileinput.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/AD/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/AD/https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
	    $("#file-0").fileinput({
	        'allowedFileExtensions' : ['jpg', 'png','gif'],
	    });
	   
		</script>

  </body>
</html>