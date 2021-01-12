<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script>
    $(function() {
        $(".menu li>a").hover(function() {
            $(this).parent().css('background-color', '#d0b0b1');
        }, function() {
            $(this).parent().css('background-color', '#cccccc');
        });
    });
</script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <jsp:include page="sideMenu.jsp"/>        
        <!--화면 우측-->
        <div class="admin-content">
            <div class="div2"></div>
            <div class="real-content">
                <div class="members">
                    <p class="title">매출관련정보</p>
                   
                    <!-- table class="table table-hover">
                        <tr class="contentsLine">
                            <th class="short">번호</th>
                            <th class="short">이름</th>
                            <th class="long">전화번호</th>
                            <th class="middle">ID</th>
                            <th class="short">PW</th>
                            <th class="long">EMAIL</th>
                            <th class="long">등록날짜</th>
                        </tr>
						<tr>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                       	</tr>
                    </table>
                    <div id= "pageNavi"></div-->
                </div>
            </div>
            <div class="div2"></div>
        </div>

    </div> 
</body>
</html>