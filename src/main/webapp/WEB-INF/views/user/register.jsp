<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Registration Page</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="setfiles/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="setfiles/ower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="setfiles/bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="setfiles/dist/css/AdminLTE.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="setfiles/plugins/iCheck/square/blue.css">
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
		
	<%@ include file="../common/header.jsp" %>
</head>
<body class="hold-transition register-page">
	<div class="register-box">
	  <div class="register-logo">
	    <a href="${path}/main/index"><b>Ant</b>People</a>
	  </div>
	
	  <div class="register-box-body">
	    <p class="login-box-msg">Register a new membership</p>
	
		<!-- 연결할 경로 -->
	    <form action="registercheck" method="post">
	      <div class="form-group has-feedback">
	        <input type="text" id="userName" class="form-control" placeholder="Your name">
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      
	      <div class="form-group has-feedback">
	        <select name ="role">
	          <c:set var="roleList" value="${requestScope.roleList}"/>
			  <c:forEach var="rName" items="${roleList}">
			    <option value="${rName.role_id}">${rName.role}</option>
			  </c:forEach>
	        </select>
	      </div>
	      
	      <div class="form-group has-feedback">
	        <select name ="store">
	          <c:set var="storeList" value="${requestScope.storeList}"/>
			  <c:forEach var="sName" items="${storeList}">
			    <option value="${sName.store_id}">${sName.store}</option>
			  </c:forEach>
	        </select>
	      </div>
	      
	      <div class="form-group has-feedback">
	        <input type="email" id="email" class="form-control" placeholder="Email">
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      
	      
	      <div class="form-group has-feedback">
	        <input type="password" id="password" class="form-control" placeholder="Password">
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      </div>
	      
	      <div class="form-group has-feedback">
	        <input type="password" id="password2" class="form-control" placeholder="Retype password">
	        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
	      </div>
	      
	      <div class="row">
	        <div class="col-xs-8">
	          <div class="checkbox icheck">
	            <label>
	              <input type="checkbox"> I agree to the <a href="#">terms</a>
	            </label>
	          </div>
	        </div>
	        <!-- /.col -->
	        <div class="col-xs-4">
	          <button id="register" type="button" class="btn btn-primary btn-block btn-flat">Register</button>
	        </div>
	        <!-- /.col -->
	      </div>
	    </form>
	
	    <a href="${path}/user/login" class="text-center">I already have a membership</a>
	  </div>
	  <!-- /.form-box -->
	</div>
	<!-- /.register-box -->
	
	<!-- jQuery 3 -->
	<script src="setfiles/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="setfiles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="setfiles/plugins/iCheck/icheck.min.js"></script>
	<script>
	  $(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' /* optional */
	    });
	    
	    $('#register').click(function(){
	    	//버튼클릭시
	    	// 1. 빈칸 존재여부 확인			--> 없을 시 해당 칸을 찾아 span으로 문구표시
	    	// 2. 비밀번호 일치여부 확인		--> 불일치 시 두번째 칸 아래 span으로 문구표시
	    	// 3. ajax로 이메일 존재여부 확인	--> 이메일 존재 시 이메일 칸 아래 span으로 문구표시
	    	// 4. 전부 충족 시 					--> 자동으로 폼 내용 전송
	    	
	    	var passwd1 = $("#password").val();
	    	var passwd2 = $("#password2").val();
	    	if(passwd1 != passwd2) {
	    		alert("불일치")
	    		$("#password2").parent().append('<span style="font-color:red;">비밀번호가 일치하지 않습니다.</span>');
	    	} else {
	    		$("#password2").parent().append('<span style="font-color:green;">비밀번호가 일치합니다.</span>');
	    		alert("일치")
	    	}
	    	
	    	var checkExist = { email : $("#email").val() };
	    	console.log(checkExist);
	    	if(typeof checkExist.email == "undefined" || checkExist.email == null || checkExist.email == ""){
	    		alert('이메일을 입력해주세요.');
	    	} else {
	    		$.ajax({
		    		url : 'registercheck',
		    		method : 'post',
		    		data : JSON.stringify(checkExist),
		    		contentType: 'application/json',
					//dataType : ,
					error : function(response) {
						alert("통신실패, response: " + response);
					},
					success : function(response) {
						alert("통신성공, response: " + response);
						//성공 시 이메일 존재여부 판별.
						//존재 --> 이메일이 존재한다는 알림 띄움.
						//없음 --> 회원가입 폼 자동으로 전송.
					}
		    	});
	    	}
	    	
	    });
	  });
	</script>
</body>
</html>
