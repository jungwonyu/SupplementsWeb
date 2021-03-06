<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.vo.*"%>
<%@ page import="com.biz.*"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/common/head.jsp" />
	<title>Q&A 게시판 - 글 수정┃SEMO</title>
</head>
<body>
	<%
		BbsVo2 bbsVo=(BbsVo2)request.getAttribute("find2");
		//로그인한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
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

		int bbsID = 0;
		if (bbsVo.getBbsID() != 0) {
			bbsID = bbsVo.getBbsID();
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'bbs2'");
			script.println("</script>");
		}
		if (!userID.equals(bbsVo.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs2'");
			script.println("</script>");
		}
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
		<div class="container px-5">
			<a class="navbar-brand fw-bold fs-4" href="main"><img src="image/favicon.png" style="width: 25px;"/>
				SEMO</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
						   data-bs-toggle="dropdown" aria-expanded="false">영양제 소개</a>
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
						<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
						   data-bs-toggle="dropdown" aria-expanded="false">마이 페이지</a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="myPage">회원 정보 수정</a></li>
						</ul>
					</li>
				</ul>
				<ul class="navbar-nav ms-sm-5">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle btn btn-primary" id="navbarDropdown" href="#" role="button"
						   data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="logoutAction">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- /Navigation-->
	<!-- 글 수정 -->
	<div class="container">
		<h1 class="card-title text-center my-5 fw-bold fs-3">Q&A 게시판</h1>
		<hr class="mt-2 mb-4">
		<div class="row">
			<form method="post" action="update2">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="card-title" colspan="2">글 수정</th>
						</tr>
					</thead>
					<tbody>
						<input type="hidden" class="form-control" placeholder="글 번호" name="bbsID" maxlength="10" value="<%= bbsVo.getBbsID() %>" readonly>
						<tr>
							<td class="table-primary">제목</td>
							<td class="table-secondary">
							<input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbsVo.getBbsTitle() %>" ></td>
						</tr>
						<tr>
							<td class="table-primary">첨부파일</td>
							<td class="table-secondary">
							<input type="text" class="form-control" placeholder="첨부파일" name="bbsTitle" maxlength="50" value="<%= bbsVo.getBbsTitle() %>" ></td>
						</tr>
						<tr>
							<td class="table-primary">내용</td>
							<td class="table-secondary">
							<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" ><%= bbsVo.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary float-end">글수정</button>
			</form>
		</div>
	</div>
	<!-- /글 수정 -->
	<footer> <jsp:include page="/WEB-INF/views/common/footer.jsp" /> </footer>
</body>
</html>