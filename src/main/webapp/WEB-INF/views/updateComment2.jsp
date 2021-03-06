<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/common/head.jsp" />
	<title>Q&A 게시판 - 댓글 수정┃SEMO</title>
</head>
<body>
	<%
		BbsCommentVo2 vo=(BbsCommentVo2)request.getAttribute("find");

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		//로그인 안한 경우
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login'");
			script.println("</script>");

		}

		int commentID = 0;
		if (vo.getCommentID() != 0) {
			commentID = vo.getCommentID();
		}
		if (commentID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 댓글 입니다.')");
			script.println("location.href = 'bbs'");
			script.println("</script>");
		}
		if (!userID.equals(vo.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs'");
			script.println("</script>");
		}
	%>
	<!-- Navigation-->
 	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
                <div class="container px-5">
                    <a class="navbar-brand fw-bold fs-4" href="main" ><img src="image/favicon.png" style="width: 25px;" /> SEMO</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

	 	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">영양제 소개</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="infoENS">현대인 필수 영양제</a></li>
									<li><a class="dropdown-item" href="infoCNS">증상별 영양제 추천</a></li>
									<li><a class="dropdown-item" href="infoNGNS">같이 섭취하면 좋지 않은 영양제</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link me-lg-3 active" href="bbs2">Q&A 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="bbs">후기 게시판</a></li>
							<li class="nav-item"><a class="nav-link me-lg-3" href="newsVideo">NEWS & VIDEO</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이 페이지</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                   	<li><a class="dropdown-item" href="myPage">회원 정보 수정</a></li>
								</ul>
							</li>
						</ul>
	<%
  		if(userID == null){
 	%>
		<ul class="navbar-nav ms-sm-5">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle btn btn-primary fw-bold" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">접속하기</a>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					<li class="active"><a class="dropdown-item" href="login">로그인</a></li>
					<!-- active : 선택이 됨을 알려줌 -->
					<li><a class="dropdown-item" href="join">회원가입</a></li>
				</ul></li>
		</ul>
	<%
		} else {
	%>
		<ul class="navbar-nav ms-sm-5">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle btn btn-primary" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="logoutAction">로그아웃</a></li>
				</ul></li>
		</ul>
	<%
		}
	%>
		</div>
		</div>
	</nav>
	<!-- /Navigation-->

	<!-- 댓글 수정 -->
	<div class="container">
		<h1 class="card-title text-center my-5 fw-bold fs-3">Q&A 게시판</h1>
		<hr class="mt-2 mb-4">
		<div class="row">
			<form method="post" action="updateComment2">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="card-title" colspan="2">댓글수정 </th>
						</tr>
					</thead>
					<tbody>
						<input type="hidden" class="a" placeholder="게시글ID" name="commentID" value="<%=vo.getCommentID()%>">
						<tr>
							<td class= "table-primary" style="width: 20%;"> 내용 </td>
							<td class= "table-secondary"> <textarea class="form-control" placeholder="글 내용" name="commentContent" maxlength="2048" style="height: 350px;" ><%=vo.getCommentText() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary float-end" >글수정</button>
			</form>
		</div>
	</div>
	<!-- /댓글 수정-->
	<footer> <jsp:include page="/WEB-INF/views/common/footer.jsp" /> </footer>
</body>
</html>