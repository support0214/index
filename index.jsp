<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<h1>AJAX 개요</h1>
	<p>
		(Asynchronous JavaScript And XML) <br>
		서버로부터 데이터를 가져와서 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법<br>
		
		* 동기식 / 비동기식<br>
		> 동기식(a, form, submit)
		<ul>
			<li>요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업 가능</li>
			<li>서버에 요청한 결과까지의 시간이 지연되면 무작정 기다려야됨(흰페이지로 보여짐)</li>
			<li>전체 페이지를 응답해주기 때문에 기본적으로 페이지가 깜박거림</li>
		</ul>
		> 비동기식(ajax)
		<ul>
			<li>현재 페이지를 그대로 유지하면서 중간중간 추가적으로 필요한 요청을 보내 줄 수 있음</li>
			<li>요청을 보냈다고 해서 다른 페이지로 넘어가지 않음(현재 페이지 그대로 유지)</li>
			<li>요청을 보내놓고 그에 해당하는 응답(데이터)가 들어올때까지 현재페이지에서 다른작업을 할 수 있음</li>
			<li>페이지가 깜박거리지 않음</li>
		</ul>
		ex) 실시간 검색어 로딩, 검색어 자동완성 기능, 아이디 중복체크, 찜선택/찜해제, 추천, 댓글, 무한스크롤 등등..<p/>
		
		* 비동기식의 단점<br>
		- 현재 페이지에 지속적으로 리소스가 쌓임 => 페이지가 느려질 수 있음<br>
		- 에러 발생 시 디버깅 어려움<br>
		- 요청 처리후에 돌아온 응답데이터를 가지고 현재페이지에 새로운 요소를 만들어서 출력해야 됨<br>
		 => dom요소를 새롭게 만들어내는 구문을 잘 익혀둬야함<br>
		 
		* 비동기식의 장점<br>
		- 코드가 간결하고 사용하기 쉽다<br>
	</p>
	
	<pre>
	* jQuery방식으로 AJAX통신
	
	$.ajax({
		속성명:속성값,
		속성명:속성값,
		속성명:속성값,
		...
	});
	
	<form method="get" action="member.jsp">
		아이디 : <input name="id">
	</form>
	
	* 주요속성
	- url : 요청할 url(필수속성)
	- type|method : 요청전송방식(get/post)
	- data : 요청시 전달할 값 {키 : 값}
	- success : ajax통신이 성공했을 때 실행할 함수 정의
	- error : ajax통신이 실패했을 때 실행할 함수 정의
	- complete : ajax통신의 성공과 실패에 상관없이 무조건 실행할 함수 정의
	
	* 부수적인 속성
	- async : 서버와의 비동기 처리 방식 설정 여부(기본값 true:비동기)
	- contentType : request의 데이터 인코딩 방식 정의(보내는 측의 데이터 인코딩)
	- dataType : 서버에서 response로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
				xml - 트리 형태의 데이터 구조
				json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
				script - javascript 및 일반 String 형태 데이터
				html - html 태그 자체를 return 하는 방식
				text - String 데이터
	- accept : 파라미터의 타입을 설정 (사용자 특화 된 파라미터 타입 설정 가능)
	- beforesend : ajax 요청을 하기 전 실행되는 이벤트 callback 함수 (데이터 가공 및 header 관련 설정)
	- cache : 요청 및 결과값을 scope에서 갖고 있지 않도록 하는 것 (기본값 true)
	- contents : JQuery에서 response의 데이터를 파싱하는 방식 정의
	- context : ajax 메소드 내 모든 영역에서 파싱 방식 정의
	- crossDomain : 타 도메인 호출 가능 여부 설정(기본값 false)
	- dataFilter : response를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
	- global : 기본 이벤트 사용 여부(ajaxstart, ajaxstop) (버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업)
	- password : 서버에 접속 권한(비밀번호)이 필요한 경우
	- processData : 서버로 보내는 값에 대한 형태 설정 여부(기본 데이터를 원하는 경우 false설정)
	- timeout : 서버 요청 시 응답 대기 시간(milisecond)
	</pre>
	
	<h1>jQuery 방식을 이용한 AJAX 테스트</h1>
	
	<h3>1. 버튼 클릭시 get방식으로 서버에 요청 및 응답</h3>
	
	입력 : <input id="input1">&nbsp;<button id="btn1">전송</button>
	<br>
	
	응답 : <span id="output1">현재응답없음</span>
	
	<script>
	$(function() {
		$("#btn1").click(function() {
			// 기존 동기식 방식
			// location.href = "jqAjax1.do?input=" + $("#input1").val();
			
			$.ajax({
				url : "jqAjax1.do", // Servlet 파일
				data : {input:$("#input1").val()},
				type : "get",
				success : function(result) {
					console.log(result);
					$("#output1").text(result);
				},
				error : function() {
					console.log("ajax통신실패");
				},
				complete : function() {
					console.log("ajax통신여부와 상관없이 출력");
				}	
			});
		})
	})
	
	</script>
<!-- 
	<form name="regFrm" method="get" action="idCheck.me">
		<p>아이디 : <input name="id" required>
				  <input type="button" value="ID중복확인" onclick="idCheck();">
		</p>
	<input type="submit" value="회원가입" disabled>
	</form>
	
	<script>
		function idCheck() {
			const $idInput = $("form input[name=id]");
			$.ajax ({
				url : "idCheck.me",
				data : {checkId : $idInput.val()},
				success : function(result) {

					if(result == 'idN') {
						alert("이미 사용중이거나 탈퇴한 아이디입니다");
						$idInput.val("");
						$idInput.focus();
					} else {
						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
							$("form :submit").removeAttr("disabled");
							$idInput.attr("readonly", true);
						} else {
							$idInput.focus();
						}
					}
				},
				error : function() {
					console.log("아이디 중복체크용 ajax통신 실패");
				}
			});
		}
	</script>
-->

		<p>아이디 : <input name="id" id="id" required>
				  <input type="button" value="ID중복확인" onclick="idCheck();">
		</p>
		<label id="result"></label>
		
	
	<script>
		function idCheck() {
			$.ajax ({
				url : "idCheck.me",
				data : {checkId : $("#id").val()},
				type : "get",
				success : function(result) {
					if(result == 'idN') {
						$("#result").text("이미 사용중이거나 탈퇴한 아이디입니다").css("color", "red");
					} else {
						$("#result").text("멋진 아이디네요").css("color", "green");
					}
				},
				error : function() {
					console.log("아이디 중복체크용 ajax통신 실패");
			}
			});
		}
	</script>
	
	<h3>2. 버튼 클릭시 post방식으로 서버에 여러개의 데이터 전송 및 응답</h3>
	이름 : <input id="input2_1"><p/>
	나이 : <input id="input2_2"><p/>
	<button onclick="test();">전송</button><p/>
	응답 : <label id="output2" />
	
	<!-- ver1
	<script>
		function test() {
			$.ajax({
				url : "jqAjax2.do",
				data : {name : $("#input2_1").val(),
						age : $("#input2_2").val()
						},
				type : "post",
				success : function(name, age) {
					// 응답받는 데이터는 첫번째 변수에만 저장됨, 뒤에 변수들은 소용없음
					console.log(name);
					console.log(age);
				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
	 -->
	 
	 <!-- ver2 배열이나 객체로 받기 -->
	 <ul id="output2"></ul>
	 
	 <script>
	 	function test() {
	 		$.ajax({
	 			url : "jqAjax2.do",
	 			data : {name : $("#input2_1").val(),
					age : $("#input2_2").val()
					},
			type : "post",
			success : function(result) {
				/* console.log(result);
				console.log(result[0]);
				console.log(result[1]);
				
				const value = "<li>" + result[0] + "</li>"
							+ "<li>" + result[1] + "</li>";
				$("#output2").html(value);
			}, */
			console.log(result);
			error : function() {
				console.log("ajax 통신 실패");
			}
	 		});
	 	}
	 </script>
	
	<h3>3. 서버에 데이터 전송 후, 조회된 bean객체를 응답데이터로 받을 때</h3>
	
	검색하고자 하는 회원ID : <input id="id2">
	<button onclick="test3();">조회</button>
	
	<div id="output3"></div>
	
	<script>
		function test3() {
			$.ajax({
				url:"jqAjax3.me",
				data:{id:$("#id2").val()},
				success:function(result){
					console.log(result);
					
					const value = "======== 검색 결과 ========<br>"
								+ "ID : " + result.id + "<br>"
								+ "NAME : " + result.name + "<br>"
								+ "GENDER : " + result.gender + "<br>"
								+ "EMAIL : " + result.email + "<br>";
					$("#output3").html(value);
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
	
	<h3>4.응답데이터로 조회된 여러 bean객체에 담겨있는 ArrayList 받기</h3>
	
	<button onclick="test4();">회원 전체 조회</button>
	
	<table id="output4" border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			
			</tr>
		</tbody>
	</table>
	<script>
		function test4() {
			$.ajax({
				url: "jqAjax4",
				success:function(result){
					let value = "";
					for(let i=0; i<result.length; i++) {
						value += "<tr>"
								+ "<td>" + result[i].id + "</td>"
								+ "<td>" + result[i].name + "</td>"
								+ "<td>" + result[i].gender + "</td>"
								+ "<td>" + result[i].email + "</td>"
								+ "</tr>";
					}
					$("#output4 tbody").html(value);
				},
				error:function() {
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
</body>
</html>