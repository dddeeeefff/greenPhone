<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../_inc/inc_mypage.jsp"%>
<link rel="stylesheet" href="./src/css/buy_list.css">
<%
request.setCharacterEncoding("utf-8");
SellInfo sellInfo = (SellInfo)request.getAttribute("sellInfo");
ArrayList<SellDetail> sellDetailList = (ArrayList<SellDetail>)request.getAttribute("sellDetailList");
DecimalFormat formatter = new DecimalFormat("###,###");
String status = sellInfo.getSi_payment();
switch (status) {
	case "a":
		status = "카드 결제";
		break;
	case "b":
		status = "휴대폰 결제";
		break;
	case "c":
		status = "무통장 입금";
		break;
	case "d":
		status = "포인트 결제(전액)";
}
%>

<style>
.guide {
	font-size: 1.8em;
	margin-bottom: 50px;
}

.buy_tit {
	border-bottom: 2px solid #0e9482;
	display: flex;
	justify-content: space-between;
	padding-bottom: 10px;
}

.buy_tit p {
	font-weight: 600;
	font-size: 1.2em;
}

.buy_tit p:last-child {
	
}

.buy_info {
	border-top: 2px solid #0e9482;
	display: flex;
	justify-content: space-between;
	padding: 10px 0 40px 0;
	font-size: 1.1em;
}

.buy {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px;
	gap: 10px;
	font-size: 1.1em
}

.buy div:first-child {
	width: 10%;
}

.buy div img {
	width: 100%;
}

.buy div:nth-child(2) {
	width: 40%;
}

.buy div:nth-child(3) {
	width: 40%;
}

.buy div:nth-child(4) {
	width: 10%;
}

.price_cancel {
	text-decoration: line-through;
	font-size: .9em
}

.review {
	background: #999;
	color: #fff;
	padding: 13px 0;
	text-align: center;
	border-radius: 10px;
}

.buy:nth-child(even) {
	background: #eee;
}

.list_btn {
	margin: 0 43%;
}

.list_btn p {
	cursor: pointer;
	font-size: 1.4em;
	letter-spacing: -0.3pt;
	color: #fff;
	padding: 17px 30px;
	background: #0e9482;
	display: inline-block;
}
</style>
<article class="main">

	<h3 class="guide">주문 상세 정보</h3>
	<div class="buy_tit">
		<p><%=sellInfo.getSi_id() %>
		</p>
		<p>구매 완료</p>
	</div>

	<%
	if (sellDetailList.size() > 0) {
	for (int i = 0; i < sellDetailList.size(); i++) {
		SellDetail sellDetail = sellDetailList.get(i);
%>


	<div class="buy">
		<div class="img">
			<img src="/greenPhone/buy/pdt_img/<%=sellDetail.getSd_img() %>"
				alt="">
		</div>
		<div class="pd">
			<%=sellDetail.getSd_mname() %>
			<br>
			<%=sellDetail.getSd_oname() %>
		</div>
		<div class="pd_con">
			<p>
				<%
				if (sellDetail.getSd_dc() > 0) {
					int dc = sellDetail.getSd_price() * (100 - sellDetail.getSd_dc()) / 100;			
				
				%>
				<%=formatter.format(dc) %> 원
				<span class="price_cancel"><%=formatter.format(sellDetail.getSd_price()) %>	원</span>
				<%
				} else {
				%>
				<%=formatter.format(sellDetail.getSd_price()) %>	원
				<% } %>
				<br> 주문 수량 : <%=sellDetail.getSd_cnt() %> 개 <br> 구매 확정일 : <%=sellDetail.getSd_cdate() %>
			</p>
			<p></p>
			<p></p>
		</div>
		<div class="review">리뷰 작성</div>
	</div>
	<%
	}
}
%>
	<div class="buy_info">
		<div class="left">
			<p>송장번호 : <%=sellInfo.getSi_invoice() %></p>
			<p>결제 방법 : <%=status %></p>
		</div>
		<div class="right">
			<p>포인트 사용 : <%=formatter.format(sellInfo.getSi_upoint()) %> P</p>
			<p>결제 금액 : <%=formatter.format(sellInfo.getSi_pay()) %> 원</p>
		</div>
	</div>

	<button class="list_btn" type="button" onclick="location.href='buy_list'">
		<p>목록으로</p>
	</button>
</article>
</section>
</body>
</html>