<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="resource/css/index_style.css">
<script src="resource/js/index.js"></script>
<body>
</head>

<body>
    <div class="container">
        <div class="item1"><a href="member/login.jsp">로그인</a></div>&emsp;
        <div class="item2"><a href="">회원가입</a></div>
    </div>

    <div class="logo">
        <div class><img src="">로고</div>
        <div class>팀소개</div>
        <div class>갤러리</div>
        <div class>게스트예약</div>
        <div class>커뮤니티</div>
    </div>
    <hr>
    <div class="slide">
        <div>
            <img src="resource/img/img1.jpg" alt="">
            <img src="resource/img/img2.jpg" alt="">
            <img src="resource/img/img3.png" alt="">
            <img src="resource/img/img1.jpg" alt="">
        </div>
    </div>

    <section>
        <div class="sec_cal">
            <div class="cal_nav">
                <a href="javascript:;" class="nav-btn go-prev">prev</a>
                <div class="year-month"></div>
                <a href="javascript:;" class="nav-btn go-next">next</a>
            </div>
            <div class="cal_wrap">
                <div class="days">
                    <div class="day">MON</div>
                    <div class="day">TUE</div>
                    <div class="day">WED</div>
                    <div class="day">THU</div>
                    <div class="day">FRI</div>
                    <div class="day">SAT</div>
                    <div class="day">SUN</div>
                </div>
                <div class="dates"></div>
            </div>
        </div>
    </section>
    <aside>
        <div class="list">공지사항</div>
        <div class="list1">공지사항1</div>
    </aside>
</body>
</html>