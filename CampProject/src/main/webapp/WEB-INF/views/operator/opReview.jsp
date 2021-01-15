<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        section {
            overflow: hidden;
        }

        sectino>div:first-child {
            width: 25%;
            border: 1px solid black;
        }

        section>div:last-child {
            width: 75%;
            margin: 0 auto;
        }

        [type=submit],
        [type=reset] {
            margin: 20px;
            margin-top: 50px;
            margin-bottom: 50px;
            width: 100px;
            height: 40px;
            border: none;
            border-radius: 3px;
        }

        [type=submit] {
            background-color: rgb(250, 220, 0);
        }

        textarea {
            width: 100%;
            height: 200px;
            resize: none;
        }

        form {
            display: block;
            margin: 0 auto;
            width: 80%;
        }

        table {
            height: 40px;
            width: 100%;
            margin-top: 50px;
        }

        table th {
            width: 15%;
        }

        table td {
            height: 100%;
        }

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
		 <div>
            <h2>공지사항 작성</h2>
            <hr>
            <div><a href="" style="text-decoration: none;">목록으로</a></div>
            <hr>
            <form action="" method="get">
                <table border=1>
                    <tr>
                        <th>제목</th>
                        <td style="width: 40%"><input type="text" name="campNoticeTitle" style="height: 100%; width: 95%;"> </td>
                        <th>작성일</th>
                        <td style="width:20%"><span></span></td>
                    </tr>
                </table>
                <h3>내용작성</h3>
                <textarea name="campNoticeContent"></textarea>
                <div style="height: 100px;text-align: center;"><input type="submit" value="등록완료"><input type="reset" value="취소"></div>
            </form>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>