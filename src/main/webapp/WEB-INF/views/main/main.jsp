<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Main Page</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <%@ include file="../common/_header_css_sum.jspf" %>
  <style>
  .carouselWrapper {
  	position:relative;
    z-index:0;
  }
  .carouselWrapper:after {
  	background-position: center; 
    top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.4!important;
    filter:alpha(opacity=50);
    z-index:-2;
    content:"";
    width:100%;
    height:100%;
  }
  .carouselNo1:after {
    background-image : url('setfiles/img/office.jpg');
  }
  .carouselNo2:after {
    background-image : url('setfiles/img/dayplanner.jpg');
  }
  .carouselNo3:after {
    background-image : url('setfiles/img/paper.jpg');
  }
  .carouselDisplaySentences {
    position:relative;
    top:55%;
    left:50%;
    transform: translate(-50%, -50%);
    text-shadow:0 0 3px black, 3px 3px 5px black;
  }
  .carouselDisplaySentences > span.carouselDisplayTitle {
    font-size: 8vmin;
  }    
  .carouselDisplaySentences > span.carouselDisplayDescription {
    font-size: 3vmin;
  }
  .carouselBtn {
    text-shadow:0 0 3px black, 3px 3px 5px black;
  }
  .carouselDots > li {
  	box-shadow:0 0 1px black, 3px 3px 5px black;
  }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <!-- _top.jspf -->
  <%@ include file="../common/_top.jspf" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../common/_nav.jspf" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        HOME
        <small>메인페이지</small>
      </h1>
      <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol> -->
    </section>

    <!-- Main content -->
    <section class="content">
      <c:set var = "todayStaffList" value ="${requestScope.todayStaffList}"/>
      <c:set var = "todayStaffCount" value = "${fn:length(todayStaffList)}"/>
      
      <c:if test="${user.email == null }">
        <!-- Carousel -->
        <div class="row">
          <div class="col-md-12">
            <div class="box box-solid">
              <!-- /.box-header -->
              <div class="box-body">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators carouselDots">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                  </ol>
                  <div class="carousel-inner">
					<!-- 
                    <div class="item active carouselWrapper" style="background-image : url('setfiles/img/office.jpg');">
                     -->
                    <div class="item active carouselWrapper carouselNo1">
                      <div class="carousel-caption carouselDisplaySentences">
                      	<span class="carouselDisplayTitle">간편한 업무 일정 신청</span>
                      	<br>
                      	<span class="carouselDisplayDescription">업무일정을 더욱 간편하게 신청할 수 있습니다.</span>
                      </div>
                    </div>
                    <!--
                    <div class="item" style="background-image : url('setfiles/img/dayplanner.jpg')">
                    -->
                    <div class="item carouselWrapper carouselNo2">
                      <div class="carousel-caption carouselDisplaySentences">
                        <span class="carouselDisplayTitle">중요한 업무 메모기능</span>
                      	<br>
                      	<span class="carouselDisplayDescription">업무를 목록으로 작성하고 전달할 수 있습니다.</span>
                      </div>
                    </div>
                    <!--
                    <div class="item" style="background-image : url('setfiles/img/paper.jpg')">
                    -->
                    <div class="item carouselWrapper carouselNo3">
                      <div class="carousel-caption carouselDisplaySentences">
                        <span class="carouselDisplayTitle">편리한 운영계획 관리</span>
                      	<br>
                      	<span class="carouselDisplayDescription">운영계획을 편리하게 작성하고 수정할 수 있습니다.</span>
                      </div>
                    </div>
                  </div>
                  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="fa fa-angle-left carouselBtn"></span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="fa fa-angle-right carouselBtn"></span>
                  </a>
                </div>
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
          </div>
        </div>
 		<!-- End of Carousel -->
 	  </c:if>     
      
      <!-- Small boxes (Stat box) -->
      <c:if test="${user.email != null }">

        <div class="row">

          <!-- 직원의 box -->
          <c:if test="${user.role.role == '직원'}">
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <c:set var="staffApply" value="${requestScope.staffApply}"/>
            <div class="small-box bg-aqua">
              <div class="inner">
                <h3>${staffApply}건</h3>
                <p>신청한 일정 수</p>
              </div>
              <div class="icon">
                <i class="fa  fa-calendar-plus-o"></i>
              </div>
              <a href="${path}/staff/requestwork" class="small-box-footer"> 근무 신청 페이지로 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <c:set var="staffRefuseApply" value="${requestScope.staffRefuseApply}"/>
            <div class="small-box bg-red">
              <div class="inner">
                <h3>${staffRefuseApply}건</h3>
                <p>승인 거부된 일정 수</p>
              </div>
              <div class="icon">
                <i class="fa fa-calendar-times-o"></i>
              </div>
              <a href="${path}/staff/requestwork" class="small-box-footer"> 근무 신청 페이지로 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </c:if>
        <!-- 직원의 box End -->
                
        <!-- 사장의 box -->
        <c:if test="${user.role.role == '사장'}">

        <c:set var="applyList" value="${requestScope.countApply}"/>
        <c:set var = "countApply" value = "${fn:length(applyList)}"/>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${countApply} 건</h3>
              <p>근무 일정 신청 수</p>
            </div>
            <div class="icon">
              <i class="fa fa-list-alt"></i>
            </div>
            <a href="${path}/owner/acceptpage" class="small-box-footer">근무 승인 페이지로 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        
        <div class="col-lg-3 col-xs-6">
        <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${notyetplan} 건</h3>
              <p>확정되지 않은 운영계획</p>
            </div>
            <div class="icon">
              <i class="fa fa-times-circle"></i>
            </div>
            <a href="${path}/owner/monthplanpage" class="small-box-footer">운영 계획 페이지로 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        </c:if>
        <!-- 사장의 box End -->

        <!-- 공통 box -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${todayStaffCount} 명</h3>
              <p>금일 근무자</p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
            <a href="${path}/main/staffinfo" class="small-box-footer">전체 직원 리스트 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${counttodo} 건</h3>
              <p>남은 할 일</p>
            </div>
            <div class="icon">
              <i class="fa fa-check-square-o"></i>
            </div>
            <a href="#" class="small-box-footer">&nbsp;	</a>
          </div>
        </div>
        <!-- ./col -->
      <!-- 공통 box End -->
      </div>
      </c:if>
      <!-- /.row -->
      
<!-- Main row -->
      <div class="row">
      
      	<!-- Left col (공지사항 부분) -->
        <section class="col-lg-6 connectedSortable">
        
         <div class="box">
            <div class="box-header">
              <h3 class="fa fa-bell"> 공지사항</h3>
			  <b class="pull-right" style="font-size:medium"><a href="${path}/main/noticepage">more..</a></b>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table">
              	<colgroup>
				  <col style="width: 15%">
				  <col style="width: 65%">
				  <col style="width: 20%">
				</colgroup>
                <tr>
                  <th style="text-align: center;">게시글 번호</th>
                  <th>제목</th>
                  <th style="text-align: center;">작성자</th>
                </tr>
                <c:set var="noticeList" value="${requestScope.noticeList}"/>
				<c:forEach var="notice" items="${noticeList}">
                <tr>
                  <td style="text-align: center;">${notice.notice_id}</td>
                  <td><a href="detailnotice?id=${notice.notice_id}">${notice.title}</a></td>
                  <c:if test="${notice.user.store.store == '둔산점'}">
                  	<td style="text-align: center;"><span class="badge bgDun">${notice.user.name}</span></td>
                  </c:if>
                  <c:if test="${notice.user.store.store == '월평점'}">
                  	<td style="text-align: center;"><span class="badge bgWal">${notice.user.name}</span></td>
                  </c:if>
                  <c:if test="${notice.user.store.store == '관저점'}">
                  	<td style="text-align: center;"><span class="badge bgGhwan">${notice.user.name}</span></td>
                  </c:if>
                  <c:if test="${notice.user.store.store == '갈마점'}">
                  	<td style="text-align: center;"><span class="badge bgGal">${notice.user.name}</span></td>
                  </c:if>
                  <c:if test="${notice.user.store.store == '탄방점'}">
                  	<td style="text-align: center;"><span class="badge bgTan">${notice.user.name}</span></td>
                  </c:if>
                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            
          </div>
          <!-- /.box -->
          
        </section>
        <!-- /.Left col -->
     
     	<!-- right col -->
     	<section class="col-lg-6 connectedSortable">
        
         <div class="box">
            <div class="box-header">
              <h3 class="fa fa-comments"> 자유게시판</h3>
              <b class="pull-right" style="font-size:medium"><a href="${path}/main/bbspage">more..</a></b>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table">
              	<colgroup>
				  <col style="width: 15%">
				  <col style="width: 65%">
				  <col style="width: 20%">
				</colgroup>
                <tr>
                  <th style="text-align: center;">게시글 번호</th>
                  <th>제목</th>
                  <th style="text-align: center;">작성자</th>
                </tr>
                <c:set var="boardList" value="${requestScope.bbsList}"/>
				<c:forEach var="board" items="${boardList}">
                <tr>
                  <td style="text-align: center;">${board.bbs_id}</td>
                  <td><a href="detailbbs?id=${board.bbs_id}">${board.title}</a></td>
                  <c:if test="${board.user.store.store == '둔산점'}">
                  	<td style="text-align: center;"><span class="badge bgDun">${board.user.name}</span></td>
                  </c:if>
                  <c:if test="${board.user.store.store == '월평점'}">
                  	<td style="text-align: center;"><span class="badge bgWal">${board.user.name}</span></td>
                  </c:if>
                  <c:if test="${board.user.store.store == '관저점'}">
                 	<td style="text-align: center;"><span class="badge bgGhwan">${board.user.name}</span></td>
                  </c:if>
                  <c:if test="${board.user.store.store == '갈마점'}">
                    <td style="text-align: center;"><span class="badge bgGal">${board.user.name}</span></td>
                  </c:if>
                  <c:if test="${board.user.store.store == '탄방점'}">
                  	<td style="text-align: center;"><span class="badge bgTan">${board.user.name}</span></td>
                  </c:if>
                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            
          </div>
          <!-- /.box -->
          
        </section>
        <!-- /.right col -->
      </div>
      <!-- /.row (main row) -->
      <c:if test="${user.email != null}">
      <!-- 2nd row -->
       <div class="row">
      	<!-- Left col -->
        <section class="col-lg-4 connectedSortable adjustHeight">
          
          <!-- USERS LIST -->

          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="fa fa-users"> 근무자 명단</h3>
              <div class="box-tools pull-right">
                <span class="label label-danger">${todayStaffCount} New Members</span>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <ul class="users-list clearfix">
               <c:if test="${todayStaffCount != 0}">
               	<c:forEach var="staff" items="${todayStaffList}">
                	<li>
                    <a class="users-list-name" href="#"></a>
                    <span class="users-list-name">${staff.user.name}</span>
                    <span class="users-list-date">${staff.title}</span>
                  </li>   
               	</c:forEach>
               </c:if>
               <c:if test="${todayStaffCount == 0}">
                 <div style="text-align:center;margin: 25px 0 25px 0;">
                   <span><b>오늘 출근하는 직원이 없습니다.</b></span>
                 </div>
               </c:if>
              </ul>
              <!-- /.users-list -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center staffListFooter">
              <a href="${path}/main/staffinfo" class="uppercase">View All Users</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <!--/.box -->
        
        </section>
        <!-- /.Left col -->
        
        <!-- middle col -->
        <section class="col-lg-4 connectedSortable adjustHeight">

          <!-- TO DO List -->
          <div class="box box-primary">
            <div class="box-header" style="border-bottom: 1px solid #f4f4f4;">
              <i class="ion ion-clipboard"></i>
              <h3 class="box-title"> 받은 할 일</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
              <ul class="todo-list" id="recievedToDoList">
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="clearfix no-border toDoBtnBox">
              <div id="receivedListPageBtn">
              </div>
            </div>
          </div>
          <!-- /.box -->

        </section>
        <!-- /.middle col -->
        
        
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-4 connectedSortable adjustHeight">
		    <!-- TO DO List -->
          <div class="box box-primary">
            <div class="box-header" style="border-bottom: 1px solid #f4f4f4;">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title"> 보낸 할 일</h3>

              <div class="box-tools pull-right">
                <button id="popupToDoBoard" type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> 새글 작성</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
              <ul class="todo-list" id="sendToDoList">
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="clearfix no-border toDoBtnBox">
              <div id="sendListPageBtn">
              </div>
            </div>
          </div>
          <!-- /.box -->

        </section>
        <!-- right col -->
        
      </div>
      <!-- /.row (2nd row) -->
	</c:if>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "../common/_bottom.jspf" %>

</div>
<!-- ./wrapper -->

<!-- Input Modal Form  -->
<div class="modal fade" id="writeToDoItem" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title">할 일 등록</h4>
      </div>
      <div class="modal-body" id="inputTableForm">
        <div class="input-group" style="width:100%">
          <div>
            <label>받을사람</label>
            <div id="memberList"></div>
            <div id="displaySelectedItem" class="toUserFrame"></div>
          </div>
          <br>
          <div>
            <label>내용</label>
            <input id="inputDescription"class="form-control" type="text">
          </div>
          <!-- /btn-group -->
        </div>
      </div>
      <div class="modal-footer">
        <!-- 이벤트 생성, 창닫기 -->
        <button id="makeToDoItem" class="btn btn-primary btn-flat pull-right" type="button" data-dismiss="modal">작성완료</button>
        <button class="btn btn-primary btn-flat pull-left" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">취소</span>
        </button>
      </div>
    </div>
  </div>
</div>

<%@ include file = "../common/_commonScriptList.jspf" %>

<script>
console.log('user')
console.log(${user})

console.log('store')
console.log('${user.store.store}')

// '//>>'로 표시된 부분 수정반영 필요.

// 1. To Do. ----------------------------------------------------------------
// 페이지 초기 수신 데이터 Dummy
/*
var dummyInitialData = {
  forReceievedList : [
    {
      id : '211',
      description : 'received - test1',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'true',
    },
    {
      id : '212',
      description : 'received - test2',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'true',
    },
    {
      id : '213',
      description : 'received - test3',
      fromUser : { user_id : 'testAdmin', userName : '김사원', role : '102'},
      state : 'false',
    },
    {
      id : '214',
      description : 'received - test4',
      fromUser : { user_id : 'testAdmin', userName : '이사원', role : '102'},
      state : 'false',
    },
    {
      id : '215',
      description : 'received - test5',
      fromUser : { user_id : 'testAdmin', userName : '박사원', role : '102'},
      state : 'true',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
  ],
  forSendList : [
    { id : '111', description : 'send - test1', checkperson : '0', },
    { id : '112', description : 'send - test2', checkperson : '2', },
    { id : '113', description : 'send - test3', checkperson : '3', },
    { id : '114', description : 'send - test4', checkperson : '0', },
    { id : '115', description : 'send - test5', checkperson : '5', },
    { id : '116', description : 'send - test6', checkperson : '1', },
    { id : '117', description : 'send - test7', checkperson : '1', },
    { id : '118', description : 'send - test8', checkperson : '1', },
    { id : '119', description : 'send - test9', checkperson : '1', },
    { id : '120', description : 'send - test10', checkperson : '1', },
    { id : '121', description : 'send - test11', checkperson : '1', },
    { id : '122', description : 'send - test12', checkperson : '1', },
    { id : '123', description : 'send - test13', checkperson : '1', },
    { id : '124', description : 'send - test14', checkperson : '1', },
    { id : '125', description : 'send - test15', checkperson : '1', },
    { id : '126', description : 'send - test16', checkperson : '1', },
    { id : '127', description : 'send - test17', checkperson : '1', },
    { id : '128', description : 'send - test18', checkperson : '1', },
    { id : '129', description : 'send - test19', checkperson : '1', },
    { id : '130', description : 'send - test20', checkperson : '1', },
    { id : '131', description : 'send - test21', checkperson : '1', },
    { id : '132', description : 'send - test22', checkperson : '1', },
    { id : '133', description : 'send - test23', checkperson : '1', },
    { id : '134', description : 'send - test24', checkperson : '1', },
    { id : '135', description : 'send - test25', checkperson : '1', },
    { id : '136', description : 'send - test26', checkperson : '1', },
    { id : '137', description : 'send - test27', checkperson : '1', },
    { id : '138', description : 'send - test28', checkperson : '1', },
    { id : '139', description : 'send - test29', checkperson : '1', },
    { id : '140', description : 'send - test30', checkperson : '1', },
    { id : '141', description : 'send - test31', checkperson : '1', },
  ]
}
*/
var fromServer = '${todoList}';
var initialData;
if(fromServer == "") {
	initialData = {
		forReceievedList : [],
		forSendList : [],
	}
} else {
	initialData = $.parseJSON(fromServer);	
}
//>> 데이터 수신.
//var initialData = {}; //DB가 없는 경우에는 빈 객체를 입력하여야 한다.
//var initialData = dummyInitialData

//받은목록과 보낸목록을 data로 저장할 위치.
var rListObj = {};
var receivedDataLoc = $('#recievedToDoList').data('receivedList',rListObj);
var sListObj = {};
var sendDataLoc = $('#sendToDoList').data('sendList',sListObj);

//한 페이지에 표시할 개수
var displayItemNum = 5;

//각 toDo 목록을 추가할 위치
var receivedListDiv = '#recievedToDoList';
var sendListDiv = '#sendToDoList';

//각 페이지 버튼을 추가할 위치
var recievedListPageBtnLoc = '#receivedListPageBtn';
var sendListPageBtnLoc = '#sendListPageBtn';

// 직위별 라벨스타일 지정
var roleColor = {
  '101' : 'label-danger' , '102' : 'label-primary' , 'sys' : 'label-info'
}

//높이조정 대상지정.
var target = '.adjustHeight';

//초기 화면표시.
$(function() {
  //초기화면 그리기
  // 1. 받은 데이터를 분배하여 저장.
  divideAndSaveCommResult(initialData);

  // 2. 받은 toDo 부분 그리기.
  //reWriteReceived(displayItemNum, 1, receivedListDiv) //목록
  reWriteProcess(displayItemNum, 1, receivedListDiv, receivedDataLoc, 'received');
  makePageButton(displayItemNum, 1, recievedListPageBtnLoc, receivedDataLoc); //버튼

  //reWriteSend(displayItemNum, 1, sendListDiv)
  reWriteProcess(displayItemNum, 1, sendListDiv, sendDataLoc, 'send');
  makePageButton(displayItemNum, 1, sendListPageBtnLoc, sendDataLoc);

  // 3. 화면 높이조정.
  adjustH(target);
})

function reWriteProcess(displayItemNum, thisPageNum, displayDivId, dataLoc, type) {
  //화면을 비움
  $(''+displayDivId+'').empty();

  //역순으로 표시
  var skeyArray = Object.keys(dataLoc);
  var displayItemEndNum = (skeyArray.length) - (thisPageNum-1) * displayItemNum;
  var displayItemStNum = displayItemEndNum - displayItemNum;
  //한페이지에 표시할 아이템수가 부족한 경우
  if(displayItemStNum < 0) { displayItemStNum = 0; }
  for(var i = displayItemStNum; i < displayItemEndNum; i++) {
    var targetForPageBtn = displayDivId;
    var thisObj = dataLoc[""+i+""];
    if(type == 'send') {
      addToSendToDoList(targetForPageBtn,thisObj);
    } else if(type == 'received') {
      addToReceivedToDoList(targetForPageBtn,thisObj);
    }
  }
}

//받은 정보를 각 data의 저장위치에 나누어 저장한다.
function divideAndSaveCommResult(communicateResult) {
  var rListObj = {};
  receivedDataLoc = $('#recievedToDoList').data('receivedList',rListObj);
  var sListObj = {};
  sendDataLoc = $('#sendToDoList').data('sendList',sListObj);

  //var receiveExistCheck = communicateResult.('forReceievedList');
  //var sendExistCheck = communicateResult.hasProperty('forSendList');

  if(communicateResult != {}) {
    //if(('forReceievedList' in communicateResult) == false) {
    if(communicateResult.forReceievedList.length == 0) {
      receivedDataLoc = [
        {
          dummy : 'true',
          description : '받은 내역이 없습니다.',
          fromUser : { user_id : 'systemDummy', userName : '시스템', role : 'sys'},
          state : 'true',
        }
      ]
    } else {
      receivedDataLoc = communicateResult.forReceievedList;
    }
    //if(('forSendList' in communicateResult) == false) {
    if(communicateResult.forSendList.length == 0) {
      sendDataLoc = [
        {
          dummy : 'true', description : '보낸 내역이 없습니다.', checkPerson : '0',
        }
      ]
    } else {
      sendDataLoc = communicateResult.forSendList;
    }
  }
}

//페이지 버튼 생성
function makePageButton(numOfDisplay, nowPage, displayTarget, dataListLoc) {
  //버튼을 표시할 위치
  var target = $(''+displayTarget+'');
  //버튼 위치 비우기
  target.empty();
  var dataList = dataListLoc;

  // 1,2,3 --> 1부터 시작, 6,7,8 --> 6부터, 11,12,13 --> 11부터
  var startNum;
  //var lastNum;
  if(Math.floor(nowPage % numOfDisplay) == 0) {
    startNum = Math.floor(nowPage/numOfDisplay) * numOfDisplay - displayItemNum;
  } else if(Math.floor(nowPage % numOfDisplay) < numOfDisplay) {
    startNum = Math.floor(nowPage/numOfDisplay) * numOfDisplay;
  }

  var lastNum = startNum + numOfDisplay;
  var numOfBtn = Math.floor((Object.keys(dataList).length) / numOfDisplay);
  var remain = (Object.keys(dataList).length) % numOfDisplay;

  //페이지를 구성하고 항목이 남는경우.
  if(remain == 0) { numOfBtn = numOfBtn; }
  else if(remain > 0) { numOfBtn = numOfBtn + 1; }

  //페이지의 갯수보다 생성될 버튼의 갯수가 많은경우
  if(lastNum > numOfBtn) { lastNum = numOfBtn; }
  var ulFrame = $('<ul />').addClass('pagination pagination-sm inline');
  var leftBtnFr = $('<li />')
  var leftBtn = $('<a />').addClass('pageBtn prevBtn').text('<');
  var rightBtnFr = $('<li />')
  var rightBtn = $('<a />').addClass('pageBtn nextBtn').text('>');

  leftBtnFr.append(leftBtn);
  rightBtnFr.append(rightBtn);

  //draw list
  for(var i=startNum; i<lastNum; i++) {
    var liFrame = $('<li />')
    var pageBtn = $('<a />').addClass('pageBtn numBtn').text(i+1);
    if(i+1 == nowPage) {
      pageBtn.addClass('nowPage')
      .css({'font-weight':'bold','background-color':'#ccc','opacity':'0.8'})
    }
    liFrame.append(pageBtn);
    ulFrame.append(liFrame);
  }
  ulFrame.prepend(leftBtnFr);
  ulFrame.append(rightBtnFr);
  target.append(ulFrame);
}

//객체하나로 보낸부분 할일 한줄 추가.
function addToSendToDoList(target,obj) {
  var desc = obj.description;
  var nCheckP = obj.checkPerson;

  var labelStyle;
  var checkIcon;
  var checkHandle;
  if(nCheckP == '0') {
    labelStyle = 'label-success';
    checkIcon = $('<i />').addClass('fa fa-check-square-o');
    checkHandle = $('<i />').addClass('fa fa-check');
  } else {
    labelStyle = 'label-default';
    checkIcon = $('<i />').addClass('fa fa-square-o');
    checkHandle = $('<i />').addClass('fa fa-circle-o-notch');
  }
  var frameLi = $('<li />');
  var handle = $('<span />').addClass('handle')//.css('width','8.5px');
  var checkPerson = $('<small />').addClass('label ' +labelStyle+'').text(" Remain : "+nCheckP+"명");
  var descText = $('<span />').addClass('text').text(desc);
  var delDiv = $('<div />').addClass('tools');
  var delIcon = $('<i />').addClass('fa fa-trash-o toolOnList sendListDel').data('thisItemObj', obj);

  handle.append(checkHandle);
  checkPerson.prepend(checkIcon);
  delDiv.append(delIcon);

  frameLi.append(handle);
  frameLi.append(checkPerson);
  frameLi.append(descText);
  frameLi.append(delDiv);
  $(''+target+'').prepend(frameLi);
}

//객체 하나로 수신부분 할일 한줄 추가.
function addToReceivedToDoList(target, obj) {
  var desc = obj.description;
  var fUseObj = obj.fromUser;
  var state = obj.state; // true - 확인, false - 미확인

  var userId =  fUseObj.user_id;
  var userName = fUseObj.userName;
  var userRole = fUseObj.role;

  var checkHandle;
  var toolIcon;
  if(state == 'true') {
    checkHandle = $('<i />').addClass('fa fa-check')
    toolIcon = $('<i />').addClass('fa fa-trash-o toolOnList receivedListDel').data('thisItemObj', obj);
  } else {
    checkHandle = $('<i />').addClass('fa fa-circle-o-notch');
    toolIcon = $('<i />').addClass('fa fa-check toolOnList receivedListCheck').data('thisItemObj', obj);
  }

  var labelStyle = roleColor[""+userRole+""];
  var frameLi = $('<li />');
  var handle = $('<span />').addClass('handle')
  var fromUser = $('<small />').addClass('label ' +labelStyle+'').text(userName);
  var descText = $('<span />').addClass('text').text(desc);
  var toolDiv = $('<div />').addClass('tools');
  handle.append(checkHandle);
  toolDiv.append(toolIcon);

  frameLi.append(handle);
  frameLi.append(fromUser);
  frameLi.append(descText);
  frameLi.append(toolDiv);
  $(''+target+'').prepend(frameLi);
}

//tool버튼 클릭 시, class를 읽어 통신.
$(document).on('click','.toolOnList',function(){
  var selected = $(this);
  var selectedData = $(this).data('thisItemObj');
  if(('dummy' in selectedData) == false) {
	  var target;
	  if(selected.hasClass('sendListDel')) {
	    target = 'sendListDel';
	  } else if(selected.hasClass('receivedListDel')) {
	    target = 'receivedListDel';
	  } else if(selected.hasClass('receivedListCheck')) {
	    target = 'receivedListCheck';
	  }
	  console.log('확인')
	  console.log(target);
	  console.log(selectedData);

	  //>> ajax통신 결과를 리턴한다.
	  var commResult = $.parseJSON(toolButtonOnList(target, selectedData));

	  //화면을 새로 그림.
	  wholeRewrite(commResult)
  }
})

//화면 재구성.
function wholeRewrite(commResult) {
  //1. 현재내용 확인 : 현재 표시되어 있는 pages
  var sNowPage = $('#sendListPageBtn').find('.nowPage').text();
  var rNowPage = $('#receivedListPageBtn').find('.nowPage').text();

  //2. 새로 구성
  // 1> 받은 데이터를 분배하여 저장.
  divideAndSaveCommResult(commResult);
  console.log('receivedDataLoc.length')
  console.log(Math.floor(receivedDataLoc.length / displayItemNum)+1)
  if((Math.floor(receivedDataLoc.length / displayItemNum)+1) <= rNowPage) {
    rNowPage = 1;
  }
  if((Math.floor(sendDataLoc.length / displayItemNum)+1) <= sNowPage) {
    sNowPage = 1;
  }
  // 2> 받은 toDo 부분 그리기.
  reWriteProcess(displayItemNum, rNowPage, receivedListDiv, receivedDataLoc, 'received');
  makePageButton(displayItemNum, rNowPage, recievedListPageBtnLoc, receivedDataLoc);
  reWriteProcess(displayItemNum, sNowPage, sendListDiv, sendDataLoc, 'send');
  makePageButton(displayItemNum, sNowPage, sendListPageBtnLoc, sendDataLoc);
}


// Modal ------------------------------------------------------------------------------------

//작성이후 받은 data 더미.
var dummyResult2 = {
  forReceievedList : [
    {
      id : '211',
      description : 'received - test1',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'true',
    },
    {
      id : '212',
      description : 'received - test2',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'true',
    },
    {
      id : '213',
      description : 'received - test3',
      fromUser : { user_id : 'testAdmin', userName : '김사원', role : '102'},
      state : 'false',
    },
    {
      id : '214',
      description : 'received - test4',
      fromUser : { user_id : 'testAdmin', userName : '이사원', role : '102'},
      state : 'false',
    },
    {
      id : '215',
      description : 'received - test5',
      fromUser : { user_id : 'testAdmin', userName : '박사원', role : '102'},
      state : 'true',
    },
    {
      id : '216',
      description : 'received - test6',
      fromUser : { user_id : 'testAdmin', userName : '김사장', role : '101'},
      state : 'false',
    },
  ],
  forSendList : [
    { id : '111', description : 'send - test1', checkperson : '0', },
    { id : '112', description : 'send - test2', checkperson : '2', },
    { id : '113', description : 'send - test3', checkperson : '3', },
    { id : '114', description : 'send - test4', checkperson : '0', },
    { id : '115', description : 'send - test5', checkperson : '5', },
    { id : '116', description : 'send - test6', checkperson : '1', },
    { id : '117', description : 'send - test7', checkperson : '1', },
    { id : '118', description : 'send - test8', checkperson : '1', },
    { id : '119', description : 'send - test9', checkperson : '1', },
    { id : '120', description : 'send - test10', checkperson : '1', },
    { id : '121', description : 'send - test11', checkperson : '1', },
    { id : '122', description : 'send - test12', checkperson : '1', },
    { id : '123', description : 'send - test13', checkperson : '1', },
    { id : '124', description : 'send - test14', checkperson : '1', },
    { id : '125', description : 'send - test15', checkperson : '1', },
    { id : '126', description : 'send - test16', checkperson : '1', },
    { id : '127', description : 'send - test17', checkperson : '1', },
    { id : '128', description : 'send - test18', checkperson : '1', },
    { id : '129', description : 'send - test19', checkperson : '1', },
    { id : '130', description : 'send - test20', checkperson : '1', },
    { id : '131', description : 'send - test21', checkperson : '1', },

  ]
}

// staffList 수신 dummy
var commRDummy = [
  { email : 'testAdmin@gmail.com', userName : '김사장', role : '101'},
  { email : 'testStaff1@gmail.com', userName : '김사원', role : '102'},
  { email : 'testStaff2@gmail.com', userName : '이사원', role : '102'},
  { email : 'testStaff3@gmail.com', userName : '박사원', role : '102'},
]

//modal창 직원목록
var gotPeopleList = [];

//모달 팝업
$('#popupToDoBoard').on('click',function() {
  $('#memberList').empty();
  $('#displaySelectedItem').empty();
  $('#inputDescription').val('');
  //목록 초기화.
  gotPeopleList = [];

  //>> ajax통신으로 직원목록을 받음.
  var staffData = $.parseJSON(modalStaffList());
  console.log('staffData');
  console.log(staffData);
  //var staffData = commRDummy;
  for(var i=0; i<staffData.length; i++) {
    gotPeopleList.push(staffData[i]);
  }

  var staffListSelectionFrame = $('<select />').addClass('peopleSelection').css({'min-height': '2rem'})
  var placeHolder = $('<option />').attr('selected','true').attr('disabled','true').text('대상을 선택하세요.');
  staffListSelectionFrame.append(placeHolder);
  
  for(var i=0; i<gotPeopleList.length; i++) {
    var personLabel = $('<option />').text(gotPeopleList[i].userName + '('+gotPeopleList[i].email+')');
    staffListSelectionFrame.append(personLabel);
  }
  $('#writeToDoItem').modal('show');
  $('#memberList').prepend(staffListSelectionFrame);
});

//보낼대상을 지정하고 화면에 추가.
$(document).on('change','.peopleSelection',function(){
  var item = $(".peopleSelection option:selected").val();
  var mailKey = (item.split('('))[1].replace(')','');
  var selectedObj;
  for(var i=0; i<gotPeopleList.length; i++) {
    if(gotPeopleList[i].email == mailKey) {
      selectedObj = $.extend({},gotPeopleList[i]);
      console.log('selectedObj')
      console.log(selectedObj)
    }
  }
  var targetInputBox = $('#displaySelectedItem');
  var selectedList = targetInputBox.find('.toWho');

  if(selectedList.length > 0) {
    var checkVal = 0;
    //리스트내에서 일치하는 value값 검색
    for(var i=0; i<selectedList.length; i++) {
      if(selectedList[i].value == item) {
        checkVal++;
      }
    }
    if(checkVal == 0) {
      addToUser(targetInputBox, item, selectedObj);
    }
  } else {
    addToUser(targetInputBox, item, selectedObj);
  }
})

//입력창에 선택한 정보 추가.
function addToUser (targetDiv, selectionValue, obj) {
  var newItemFrame = $('<div />').addClass('itemFrame');
  var newItem = $('<input />').attr('type','text').attr('disabled',true).addClass('toWho');
  newItem.data('thisUserObj',obj);
  var deleteIcon = $('<i />').addClass('fa fa-times itemDelSign');
  console.log('thisUserObj확인')
  console.log(newItem.data('thisUserObj'))
  newItem.val(selectionValue);
  newItemFrame.append(newItem);
  newItemFrame.append(deleteIcon);
  targetDiv.append(newItemFrame);
}

//작성버튼
$('#makeToDoItem').on('click',function(){
  var thisDesc = $('#inputDescription').val();
  var toWhoList =  $('#displaySelectedItem').find('.toWho');
  var toUserList = [];

  if(thisDesc == '') {
    alert('내용을 입력하세요');
  } else if(toWhoList.length == 0) {
    alert('보낼 대상을 선택하세요.')
  } else {
    for(var i=0; i<toWhoList.length; i++) {
      toUserList.push(toWhoList.eq(i).data('thisUserObj'))
    }
    //입력내용을 바탕으로 보낼 객체 생성.
    var sendObj = {
      description : thisDesc, // 내용
      toUsers : toUserList, // [ {email:, user:, role:},{},{} ]
    }
    console.log('전송')
    console.log(sendObj);
    //전송 후 결과 리턴 --> 결과는 양쪽리스트 전체를 받아오는 것.
    var commResult = $.parseJSON(sendToDoSubmit(sendObj));
    console.log('commResult')
    console.log(commResult)
    //var commResult = dummyResult2;

    //전체화면을 다시 표시한다.
    wholeRewrite(commResult);
  }
})

//선택한 대상목록의 개별 삭제버튼
$(document).on('click','.itemDelSign',function(){
  var selected = $(this).parent();
  selected.remove();
})
// ./ end of Modal창 ----------------------------------------------------------------


// 페이지 버튼.
$(document).on('click', '.pageBtn', function(){
  var btnNum = $(this).text();
  var btnLoc = $(this).parent().parent().parent().attr('id');
  var nBtn;

  //각 목록의 페이지 수를 구한다.
  if(btnLoc == 'sendListPageBtn') {
    var sendL = Object.keys(sendDataLoc).length;
    if(sendL % displayItemNum == 0) {
      nBtn = Math.floor(sendL / displayItemNum)
    } else {
      nBtn = Math.floor(sendL / displayItemNum) + 1;
    }
  } else if(btnLoc == 'receivedListPageBtn') {
    var reciL = Object.keys(receivedDataLoc).length;
    if(reciL % displayItemNum == 0) {
      nBtn = Math.floor(reciL / displayItemNum)
    } else {
      nBtn = Math.floor(reciL / displayItemNum) + 1;
    }
  }
  console.log('numOfBtn')
  console.log(nBtn)

  //현재 page -1 +1
  if($(this).hasClass('prevBtn')) {
    var nowPage = parseInt($(this).parent().parent().find('li a.nowPage').text());
    btnNum = nowPage - 1;
    if(btnNum <= 0) {
      btnNum = 1;
    }

  } else if($(this).hasClass('nextBtn')) {
    var nowPage = parseInt($(this).parent().parent().find('li a.nowPage').text());
    btnNum = nowPage + 1;
    if(btnNum > nBtn) {
      btnNum = nBtn;
    }
  }
  if(btnLoc == 'sendListPageBtn') {
    reWriteProcess(displayItemNum, btnNum, sendListDiv, sendDataLoc, 'send');
    makePageButton(displayItemNum, btnNum, sendListPageBtnLoc, sendDataLoc);
  } else if(btnLoc == 'receivedListPageBtn') {
    reWriteProcess(displayItemNum, btnNum, receivedListDiv, receivedDataLoc, 'received');
    makePageButton(displayItemNum, btnNum, recievedListPageBtnLoc, receivedDataLoc);
  }
})


//높이조정 메소드. ----------------------------------------------
function adjustH(target) {
  var targetBroList = $(target).siblings();
  console.log(targetBroList.length);
  var calHeight = 0;
  for(var i=0; i<targetBroList.length; i++) {
    var standardH = parseInt($(target).eq(i).css('height'));
    console.log('standardH')
    console.log(i+" "+standardH)
    if(standardH >= calHeight) {
      calHeight = standardH;
    }
  }
  $(target).css('min-height',calHeight);
  $(target).children().css('min-height',calHeight);
  console.log('calHeight')
  console.log(calHeight)
  console.log('adjustHeight')
  console.log($(target).css('height'));
}
// ./End of 높이조정 메소드. ----------------------------------------------


//>> ajax 통신관련 -------------------------------------------------------

// modal창 작동 시 직원목록을 받아와 리턴.
function modalStaffList() {
  $.ajax({
		url : 'popupToDoBoard',
		method : 'post',
    	// data : 서버로 보낼 데이터 - string or json(key/value)
		//data : sendObj,
  		// contentType : 서버로 보낼 데이터의 타입.
    //contentType: 'application/json',
    	// dataType : 서버로 부터 수신받을 데이터 타입.
		dataType : 'text',
    async : false,
		error : function(response) {
			alert("통신실패, response: " + response);
			console.log(response);
		},
		success : function(response) {
			//console.log(response);
			result = response;
		}
	});
  return result;
}

//작성 버튼 클릭 시 동작할 ajax통신. 전체 목록을 다시 수신받아 리턴한다.
function sendToDoSubmit(sendObj) {
  console.log('전송')
  console.log(sendObj);
  $.ajax({
		url : 'makeToDoItem',
		method : 'post',
    	// data : 서버로 보낼 데이터 - string or json(key/value)
		data : JSON.stringify(sendObj),
  		// contentType : 서버로 보낼 데이터의 타입.
    contentType: 'application/json',
    	// dataType : 서버로 부터 수신받을 데이터 타입.
		dataType : 'text',
    async : false,
		error : function(response) {
			alert("통신실패, response: " + response);
			console.log(response);
		},
		success : function(response) {
			//console.log(response);
			result = response;
			console.log('result')
			console.log(result)
		}
	});
  return result;
}

//각 toDo의 toolButton을 누른경우 통신발생, 전체 목록을 다시 수신받아 리턴한다.
function toolButtonOnList(target, selectedData) {
  var targetUrl;
  if(target == 'sendListDel') {
    targetUrl = 'senditemdelete';
  } else if(target == 'receivedListDel') {
    targetUrl = 'receiveditemdelete';
  } else if(target == 'receivedListCheck') {
    targetUrl = 'receiveditemcheck';
  }
  console.log(targetUrl);
  console.log(selectedData);
  $.ajax({
		url : targetUrl,
		method : 'post',
    	// data : 서버로 보낼 데이터 - string or json(key/value)
		data : JSON.stringify(selectedData),
  		// contentType : 서버로 보낼 데이터의 타입.
    contentType: 'application/json',
    	// dataType : 서버로 부터 수신받을 데이터 타입.
		dataType : 'text',
    async : false,
		error : function(response) {
			alert("통신실패, response: " + response);
			console.log(response);
		},
		success : function(response) {
			//console.log(response);
			result = response;
			console.log('result')
			console.log(result)
		}
	});
  return result;
}

</script>
</body>
</html>