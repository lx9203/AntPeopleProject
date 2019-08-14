<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>근무 신청</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <%@ include file= "../common/_header_css_sum.jspf" %>
  
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
        근무 신청
        <small>Calendar</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${path}/main/mainpage"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">근무 신청</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <div class="box box-solid">
            <div class="box-header with-border">
              <label style="margin-bottom: 0;">월별 근무일정표</label>
            </div>
            <div class="box-body">
              <!-- the events -->
              <div id="external-events">
              </div>
              <hr class="divArea">
              <button id="modifyAndFinish" type="button" class="btn btn-primary btn-flat pull-right modify" disabled>작성</button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->

        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->

      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "../common/_bottom.jspf" %>

</div>
<!-- ./wrapper -->

<%@ include file = "../common/_commonScriptList.jspf" %>

<%@ include file = "../common/_calendarScriptList.jspf" %>

<!-- Page specific script -->
<script>
//DayObj, TimeObj : 프로토타입 객체.
var startDay = new DayObj();
var endDay = new DayObj();
var startTime = new TimeObj();
var endTime = new TimeObj();
//var state = 0;

//로그인한 staff의 id
//var userId = 'testUser';
var userId = "${user.user_id}";

// 페이지 로드 시 받을 수신받을 데이터 형태. --> '연월' : 수정가능여부
var nowDate = new Date();

var gotList = ${monthIndex} //더미로 확인필요...
/*
var gotList = {
  '1907' : true, '1905' : false, '1906' : true,
  '1909' : false, '1900' : true , '1911' : false
}; //더미 목록, 월정보는 월 인덱스 값.
*/
var convertedList = gotList;

//>> requestWork0.0.3
// 월별 계획과 직원이 신청한 내용을 따로 저장.
$('#calendar').data('eventList',{});
var originalDataLoc = $('#calendar').data('eventList');
$('#calendar').data('selectedList',{});
var selectedDataLoc = $('#calendar').data('selectedList');

/*
// receivedDummy : 월별목록 선택시 수신받을 데이터 형태.
var receivedDummy = {
  '1907' : {
    testAdmin_19071501001907160623 : {
      id : 'testAdmin_19071501001907160623',
      title : '01:00~06:23',
      startDate : '190715',
      endDate :'190716',
      startTime : '0100',
      endTime : '0623',
      userId : 'testAdmin',
      fromUser : {'user_id' : 'testAdmin'},
      state : '0',
      manPower : '10',
      peopleCount : '0',
    },
    testAdmin_19071503001907160623 : {
      id : 'testAdmin_19071503001907160623',
      title : '01:00~06:23',
      startDate : '190715',
      endDate :'190716',
      startTime : '1300',
      endTime : '0623',
      userId : 'testAdmin',
      fromUser : {'user_id' : 'testAdmin'},
      state : '0',
      manPower : '10',
      peopleCount : '0',
    },
    testAdmin_19072101001907220623 : {
      id : 'testAdmin_19072101001907220623',
      title : '01:00~06:23',
      startDate : '190721',
      endDate :'190722',
      startTime : '0100',
      endTime : '0623',
      userId : 'testAdmin',
      fromUser : {'user_id' : 'testAdmin'},
      state : '3',
      manPower : '5',
      peopleCount : '5',
    },
    testAdmin_19070101001907020623 : {
      id : 'testAdmin_19070101001907020623',
      title : '01:00~06:23',
      startDate : '190701',
      endDate :'190702',
      startTime : '0100',
      endTime : '0623',
      userId : 'testAdmin',
      fromUser : {'user_id' : 'testAdmin'},
      state : '3',
      manPower : '7',
      peopleCount : '1',
    }
  },
  //>>>
  //user1 : [
  //  'testAdmin_19070101001907020623','testAdmin_19072101001907220623'
  //],
  //<<<
  user1 : {
    'testAdmin_19070101001907020623': { state : '2' },
    'testAdmin_19072101001907220623': { state : '3' },
  },
}

var receiveS = {
  testAdmin_19070101001907020623 : {
    id : 'testAdmin_19070101001907020623',
    title : '01:00~06:23',
    startDate : '190701',
    endDate :'190702',
    startTime : '0100',
    endTime : '0623',
    userId : 'testAdmin',
    fromUser : {'user_id' : 'testAdmin'},
    state : '0',
    manPower : '7',
    peopleCount : '3',
  }
}
*/

//1. 이벤트바 자동생성 : 리스트를 수신받아서 push
var monthlyMenu = [];
var targetDiv = '#external-events'
var barClass = 'external-event'
//var tempColor = '#26678d'
//페이지 로딩 시 목록을 수신받아 값이 있는경우 순차적으로 배열에 삽입.
if( Object.keys(convertedList).length > 0 ) {
  var afterConvert = convertForMonthlyMenuList(convertedList);
  $.each(afterConvert, function(key, value){
    monthlyMenu.push(key);
  });
  //배열 순서대로 정렬
  monthlyMenu.sort();
  console.log(monthlyMenu);
  //month 배열을 읽어 전부 추가.
  for(var i = 0; i<monthlyMenu.length; i++) {
    var index = monthlyMenu[i];
    var infObj = afterConvert[""+index+""];
    var tempColor = 'rgb(60, 141, 188)'
    if(infObj.mendable == false) {
      tempColor = 'rgb(120, 136, 168)'
    }
    drawMenuBar(monthlyMenu[i], infObj, targetDiv, barClass, tempColor);
  }
}

// 4자리를 객체로 변환.
function convertForMonthlyMenuList(mapObj) {
  // 객체의 key들을 array로 반환.
  var list = Object.keys(mapObj);
  console.log('list')
  console.log(list)
  var resultObj = {};
  for(var i=0; i<list.length; i++) {
    var yearPart = list[i].slice(0,2);
    var monthPart = parseInt(list[i].slice(2));
    var calYear = "20" + yearPart;
    var calMonth = monthPart + 1;
    //연월 인덱스 값을 표시될 현재연월 형태(inputbox에 사용)와 인덱스값(데이터 요청시 사용)이 들어있는 객체로 변환
    if(calMonth < 10) {
      calMonth = "0" + calMonth;
    }
    var title = calYear + "-" + calMonth;
    var result = {
      'title': title, 'monthIndex' : list[i], 'mendable' :  mapObj[""+list[i]+""]
    }
    resultObj[""+title+""] = result;
  }
  console.log("결과객체")
  console.log(resultObj);
  return resultObj;
}

// 목록생성 함수.
function drawMenuBar(title, convertedObj, targetDiv, bClass, color ) {
  //생성되는 이벤트 바 title.
  var val = title;
  //시간에 따른 색상변화
  //var monthBarColor = '#26678d'; //for test.
  //dropdown external eventbar 생성.
  var monthEventBar = $('<div />');
  monthEventBar.css({
    'background-color': color,
    'border-color': color,
    'color': '#fff',
    'width': '100%',
    'display': 'inline-block',
  }).addClass(''+bClass+'').html(val)
  //생성될 바에 data()로 시간정보 저장.
  monthEventBar.data(convertedObj);
  //DOM 엘리먼트를 화면에 삽입
  $(''+targetDiv+'').prepend(monthEventBar);
}

//>>accept.0.0.1에서 수정됨. : inputbox수정  --> 변수에 직접입력.
//month 배열에 정보가 있는경우, 캘린더 초기값 지정.
var initialMonth;
if(monthlyMenu.length>0){
  initialMonth = setCalendarToNextMonth(monthlyMenu);
} else {
  initialMonth = nowDate;
}

function setCalendarToNextMonth(menuList) {
  var lastVal = menuList[menuList.length-1];
  console.log('lastVal')
  console.log(lastVal)

  var year = parseInt(lastVal.slice(0,4));
  var month = parseInt(lastVal.slice(5));
  var newYear;
  var newMonth;
  if(month > 11) {
    newMonth = 0;
    newYear = year + 1;
  } else {
    newMonth = month;
    newYear = year;
  }
  var result = new Date(newYear, newMonth, 1);

  return result;
}
// ./ End of 1. 이벤트 바 등록

//2. external eventbar 선택기능 + 버튼 형상 전환 + 캘린더에 표시될 내용 수신.
$(document).on('click','.external-event',function() {
  //data() 초기화
  // 직원의 월별일정을 가져오기 전 저장되었던 data를 비운다.
  $('#calendar').removeData('eventList');
  $('#calendar').removeData('selectedList');
  // 동일위치에 빈 객체를 생성한다.
  $('#calendar').data('eventList',{});
  originalDataLoc = $('#calendar').data('eventList');
  $('#calendar').data('selectedList',{});
  selectedDataLoc = $('#calendar').data('selectedList');

  // 캘린더 초기화
  $('#calendar').fullCalendar('removeEvents');
  // 선택여부 표시 : 투명도 조정.
  $('.clickEvent_Opacity').not($(this)).removeClass('clickEvent_Opacity');
  // 선택된 것을 다시 누른것인지 판별.
  var checkSelect = $(this).hasClass('clickEvent_Opacity');
  // 변화시킬 버튼 선정.
  var targetBtn = $('#modifyAndFinish');
  targetBtn.removeClass('modifyFinish')
  targetBtn.addClass('modify').text('작성')
    .css({'background-color' : '#00a65a', 'border-color': '#00a65a;'});
  targetBtn.attr('disabled', true);

  // 선택되어 있는지 여부에 따라 실행.
  // 선택되어 있었던 경우 = true.
  if(checkSelect == true) {
    // 1. 셀렉트 취소. --> 원래대로 되돌리고, 버튼 비활성화.
    // 음영처리 제거.
    $(this).removeClass('clickEvent_Opacity');

    //캘린더의 화면을 목록의 마지막 다음달로 변경.
    $('#calendar').fullCalendar('gotoDate',initialMonth);

    // 월 인덱스가 저장되었던 변수를 초기화.
    selectedMonthIndex = "";

  } else if(checkSelect == false) {
    // 2. 셀렉트
    // 음영처리 : 선택한것을 시각적으로 보여줌.
    $(this).addClass('clickEvent_Opacity');
    // data로 저장된 monthIndex값을 읽어 화면 이동.
    var thisMonthIndex = $(this).data().monthIndex;
    console.log('thisMonthIndex');
    console.log(thisMonthIndex);
    var thisMonthObj = convertMonthIndexToMomentDateObj(thisMonthIndex);
    $('#calendar').fullCalendar('gotoDate',thisMonthObj);

    // 월 인덱스를 전역변수에 저장.
    selectedMonthIndex = thisMonthIndex;

    //calender rendering 작업, 화면을 해당월로 표기,
    //a. 승인여부 판단하여 승인된 경우 버튼 비활성화.
    targetBtn.attr('disabled', true);
    var switchInfo = $(this).data().mendable;
    if(switchInfo == false) {
      // false : 수정불가 == 신청불가.
      // 버튼 비활성화.
      targetBtn.attr('disabled', true);
    } else {
      // true : 수정가능 == 신청가능
      // 버튼 비활성화.
      targetBtn.attr('disabled', false);
    }
    //b. 월별이벤트 데이터를 받아온다. --> {key = 1901 : value = {해당월의 계획} }
    var targetMonth = $(this).data().monthIndex; // ex) 1901 = 19년 2월.
    var userInfo = {'user_id' : userId};

    //ajax로 데이터 수신. : 텍스트로 받아 parse.
    var receivedData = $.parseJSON(getMonthlyPlan(targetMonth));
    //var receivedData = receivedDummy; //테스트용. 수신받았다고 가정. --> 못받은 경우?

    //직원별 정보 임시저장.
    var individualList ={};
    //이벤트 목록부분과 셀렉트된 부분을 나누어 저장한다.
    for(var key in receivedData) {
      if(key == targetMonth) {
        originalDataLoc = receivedData[""+key+""];
      } else {
        individualList = receivedData[""+key+""];
      }
    }
	// 선택된 목록을 바탕으로, 월별계획에서 객체를 선택하여 저장.
    /*
	for(var i=0; i<individualList.length; i++) {
      var thisEvent = individualList[i];
      selectedDataLoc[""+thisEvent+""] = originalDataLoc[""+thisEvent+""];
    }
	*/
	
	//19.08.06 11:15
	for(var key in individualList) {
      var pesonalEState = individualList[""+key+""].state;
      console.log('pesonalEState')
      console.log(pesonalEState)
      //state변경.
      originalDataLoc[""+key+""].state = pesonalEState;
      //나누어 저장.
      selectedDataLoc[""+key+""] = originalDataLoc[""+key+""];
    }
    // end of 19.08.06 11:15
    
    console.log('individualList')
    console.log(individualList)

    //정보를 바탕으로 화면에 표시.
    renderingProcessWithList(originalDataLoc, selectedDataLoc)
  }
})

//a. 날짜 인덱스를 객체로 변환.
function convertMonthIndexToMomentDateObj(mIndex) {
  var yearPart = parseInt('20'+mIndex.slice(0,2));
  var monthPart = parseInt(mIndex.slice(2));
  return new Date(yearPart, monthPart);
}

//b. 월별 이벤트 데이터를 받아오는 함수.
function getMonthlyPlan(inputVal) {
  var targetMonthInfo = inputVal
  var result;
  console.log('targetMonthInfo')
  console.log(targetMonthInfo)
  $.ajax({
		url : 'monthlist',
		method : 'post',
		// data : 서버로 보낼 데이터 - string or json(key/value)
		data : targetMonthInfo,
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
			console.log(response);
			result = response;
		}
	});
  return result;
}
//./ End of 3. external eventbar 선택기능


//4. 작성/작성완료 #modifyAndFinish
$('#modifyAndFinish').click(function() {
  if($(this).hasClass('modify') == true) {
    //수정으로 표시되는 경우, --> 수정완료로 변경.
    $(this).removeClass('modify');
    $(this).addClass('finishModify').text('작성완료')
      .css({'background-color' : '#e47636', 'border-color': '#e47636'});

  } else if($(this).hasClass('finishModify') == true) {
    //수정완료로 표시되는 경우, --> 수정으로 변경
    $(this).removeClass('finishModify');
    $(this).addClass('modify').text('작성')
      .css({'background-color' : '#00a65a', 'border-color': '#00a65a'});
  }
});


//fullCalendar 로드, 초기화
$(function() {
  $('#calendar').fullCalendar({
    header    : {
      left  : 'prev,next today',
      center: 'title',
    },
//>>//Ajax로 가져올 event data
    defaultDate : initialMonth,
    //events : initialData,
    //월별 표시되는 달력의 길이조정.
    fixedWeekCount : false,
    //현재 월 외의 날짜 표시조정. --> 현재표시된 날짜 외 이벤트 발생x.
    showNonCurrentDates : false,

    //이벤트 선택
    eventClick: function (calEvent, jsEvent, view) {
      //state가 2인 경우, 작동하지 않음.
      var thisState = originalDataLoc[""+calEvent.id+""].state;
      //작성버튼이 눌러져 있을 때.
      if(($('#modifyAndFinish').hasClass('finishModify') == true)&&(parseInt(thisState) != 2)) {
        //mp와 pc가 일치하지 않는 경우 --> 일반작동
        //mp와 pc가 일치하는경우
        // --> 내 목록에 있으면 수정가능
        // --> 내 목록에 없으면 수정불가.
        //이벤트를 눌렀을 때, ajax통신 발생, 이벤트 셀렉트 표시
        var thisMp = originalDataLoc[""+calEvent.id+""].manPower;
        var thisPc = originalDataLoc[""+calEvent.id+""].peopleCount;

        var checkExist = find('.eventMarker');
        if(thisMp == thisPc) {
          if(selectedDataLoc[""+calEvent.id+""].id == calEvent.id) {
            //checkAndSelectRequest(calEvent.id)
            //19.08.06 11:15
            checkAndSelectRequest(thisState, calEvent.id)
          }
        } else {
          //checkAndSelectRequest(calEvent.id)
          //19.08.06 11:15
          checkAndSelectRequest(thisState, calEvent.id)
        }
      }
    },
  });
  //첫 화면 로드 시 화면을 다시 그려줌.
  renderingProcessWithList(originalDataLoc, selectedDataLoc)

});
console.log('originalDataLoc : 일정 신청 전')
console.log(originalDataLoc)

// ./ End of fullCalendar 초기화 -------------------------------------

function checkAndSelectRequest(state, eventId) {
  var comSign = false;
  if($('span:contains("'+eventId+'")').parent().parent().hasClass('selectedEvent')) {
	var apply = confirm("일정 신청을 취소하시겠습니까?")
	if(apply){
	    // 선택되어 있는 경우 --> 취소요청
	    comSign = false;
	    communicationProcess(comSign, eventId, state);
	}
  } else {
	  var apply = confirm("일정 신청하시겠습니까?")
		if(apply){
		    // 선택되어 있지 않은경우 --> 등록요청
		    comSign = true;
		    communicationProcess(comSign, eventId, state);
		}
  }
}

function communicationProcess(sign, id, state) {
  //user = userId :전역변수. 세선값.
  var packedTarget = id;
  //ajax 통신 후 성공한 값을 수신 받는다.
  var communicateResult = $.parseJSON(sendInfo(sign, packedTarget, state));
  //var communicateResult = receiveS; //더미 - 일정신청 시
  //var communicateResult = receiveD; //더미 - 신청취소 시
  if(communicateResult == 'fail') {
    alert('등록에 실패하였습니다. 다시 신청해주세요.');
  } else {
    //성공한 경우, 경우에 따라 리턴값 화면에 업데이트 방법 추가필요....
    if((sign == true) && (id == Object.keys(communicateResult)[0])){
      //등록과정 --> 등록한 내용 List로 저장.
      //origin에 저장(for manpower업데이트 후 이벤트 렌더링)
      // & select에 저장(렌더링 후 신청여부 다시 표시하기 위해).
      originalDataLoc[""+id+""] = communicateResult[""+id+""];
      selectedDataLoc[""+id+""] = communicateResult[""+id+""];
      console.log('originalDataLoc : 일정 신청 후')
      console.log(originalDataLoc)
      console.log(selectedDataLoc)

    } else if((sign == false) && (id == Object.keys(communicateResult)[0])) {
      //취소과정 --> 등록한 내용에서 삭제.
      //$('span:contains("'+id+'")').parent().parent().removeClass('selectedEvent');
      originalDataLoc[""+id+""] = communicateResult[""+id+""];
      delete selectedDataLoc[""+id+""];
      console.log('originalDataLoc : 신청 취소 후')
      console.log(originalDataLoc)
      console.log(selectedDataLoc)
    } else {
      alert('요청한 일정과 받은 일정이 일치하지 않습니다.');
    }
    //communicateResult를 저장된 data에 업데이트. 화면을 다시 그려주어야 한다.
    renderingProcessWithList(originalDataLoc, selectedDataLoc)
  }
}


function renderingProcessWithList(eList, sList) {
  //화면 비움.
  $('#calendar').fullCalendar('removeEvents');
  for(var key in eList) {
    //객체 Converting
    var convertdObj = convertToEventObj(eList[""+key+""]);
    //화면에 객체를 표시.
    $('#calendar').fullCalendar('renderEvent',convertdObj, true);
  }
  //화면의 manpower와 title을 다시 표시.
  remakeDisplayedEvents(eList);
  //신청된 목록을 다시 표시
  for(var key in sList) {
    $('span:contains("'+key+'")').parent().parent().addClass('selectedEvent');
  }
  //선택불가 항목 --> pc == mp but not selected events.
  var selectedListKeys = Object.keys(sList);
  var originalListKeys = Object.keys(eList);

  for(var key in eList) {
    var target = eList[""+key+""];
    //동일한 경우를 조사.
    if(target.manPower == target.peopleCount) {
      if($('span:contains("'+key+'")').parent().parent().hasClass('selectedEvent') == false) {
        //동일한 경우, 선택되지 않았으면 비활성화.
        $('span:contains("'+key+'")').parent().parent().addClass('excessMp');
      } else {
        //동일한 경우, 선택되어 있으면 활성화.
        $('span:contains("'+key+'")').parent().parent().removeClass('excessMp');
      }
    } else {
      //동일하지 않은경우, 활성화
      $('span:contains("'+key+'")').parent().parent().removeClass('excessMp');
    }
  }
}


function sendInfo(sign, eId, state) {
  var packaging = {
    schedule_id : eId, 
    state : state
  };
  //control url필요.
  var addPlan = "applyschedule" //일정 신청.
  var rmPlan = "refuseschedule" //신청 취소. 
  var alterString;
  var selectedUrl;
  
  if(sign) {
	    selectedUrl = addPlan;
	    alterString = "일정을 신청하였습니다.";
	  } else {
	    selectedUrl = rmPlan;
	    alterString = "일정을 취소하였습니다.";
	  }
  
  var result;
  $.ajax({
		url : selectedUrl,
		method : 'post',
		// data : 서버로 보낼 데이터
		data : packaging,
		// dataType : 서버로 부터 수신받을 데이터 타입.
		dataType : 'text',
		async : false,
		error : function(response) {
			alert("통신실패, response: " + response);
			result = 'fail';
		},
		success : function(response) {
			//alert(alterString);
			if(response == 'full') {
				alert("신청인원이 마감되었습니다.");
				document.location.href = 'requestwork';
			} else {
      	    	result = response;
			}
		}
	});
  return result;
}

function remakeDisplayedEvents(antPeopleObjList) {
  //if(Object.keys(antPeopleObjList).length > 0) {
  //console.log(antPeopleObjList)
  //console.log(Object.keys(antPeopleObjList))
  //console.log(Object.keys(antPeopleObjList).length > 0)
    for(var key in antPeopleObjList) {
      //목록으로부터 요구 인원수를 추출.\
      var pcValue = antPeopleObjList[""+key+""].peopleCount;
      var mpValue = antPeopleObjList[""+key+""].manPower;
      var newTitle = antPeopleObjList[""+key+""].title;
      var thisState = antPeopleObjList[""+key+""].state;
      //새로 생성한 tag가 있는경우 --> 값만 변경.

      //tag정보 생성.
      var mpSpan = $('<span />').addClass('eventMarker').css({'padding-left':3}).text(pcValue+'/'+mpValue+"명");
      var titleSpan = $('<span />').addClass('eventTitle').css({'margin-left':10}).text(newTitle);

      //존재하는 span을 모두 숨김.
      $('span:contains("'+key+'").fc-title').css({'display':'none'})
      $('span:contains("'+key+'")').prev('span.fc-time').css({'display':'none'})

      //생성한 span tag를 추가. - 추가된 span이 이미 있는지 확인 후, 있으면 값만 변경.
      var checkExist = $('span:contains("'+key+'")').parent().find('.eventMarker');

      if(checkExist.length <= 0) {
        $('span:contains("'+key+'")').parent().prepend(titleSpan);
        $('span:contains("'+key+'")').parent().prepend(mpSpan);
      } else if (checkExist.length > 0) {
        $('span:contains("'+key+'")').parent().find('.eventMarker').text(pcValue+'/'+mpValue+"명");
        $('span:contains("'+key+'")').parent().find('.eventTitle').text(newTitle);
      }
      if(thisState == 2) {
        $('span:contains("'+key+'")').parent().parent().css({'opacity' : '0.5'});
      } else if(thisState == 3) {
        $('span:contains("'+key+'")').parent().parent()
          .css({'text-decoration':'line-through', 'background-color' : 'grey', 'border-color' : 'grey'})
      }

    }
  //}
}
</script>
</body>
</html>
