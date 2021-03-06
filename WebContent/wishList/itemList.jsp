<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${ca.categoryname} - 물품 리스트</title>
<script type="text/javascript">
function win_open(page) {
	var op = "width=700, height=300, left=50, top=150";
	open(page,"",op);
}

function select(){
	var s = document.getElementById("purchase").value;
	return s;
}
var s = select();
</script>
</head>
<body>
<%--변수 설정 --%>
<c:set var="priceSum" value="0" />
<c:set var="buySum" value="0" />
<c:set var="count" value="0" />
<c:set var="buycount" value="0" />
<%--물품 정보 출력 --%>
<div class="wish_body">
<table class="wish_table" style="width:70%;">
<caption>
	<font size="5px">${ca.categoryname}</font> &nbsp;
	<a onclick="win_open('itemAddForm.do?categorynum=${ca.categorynum}')" class="button">물품 추가</a>
</caption>
<thead>
<tr><td  style="text-align:left;">
		<a href="categoryList.do?id=${sessionScope.login}" class="button">카테고리 목록</a>	
	</td>
	<td colspan="2" style="text-align:right;">
	<form action="itemList.do?categorynum=${ca.categorynum}" name="purchasef" method="post">
  		<label>구매:</label>
  		<select name="purchase" id="purchase">
   			 <option value="2">전체</option>
   			 <option value="1">완료</option>
   			 <option value="0">미완료</option>
  		</select>
  		<input type="submit" value="조회">
	</form></td></tr>
</thead>
<tr><th>물품명</th><th>가격</th><th>구매여부</th></tr>
<c:forEach var="i" items="${itemlist}">
<tr <c:if test="${i.purchase==1}">bgcolor=#AFDFE4</c:if>>
	<td><a href="itemInfo.do?itemnum=${i.itemnum}">${i.itemname}</a></td>
	<td>${i.price}</td>
	<td>${i.purchase==1?"O":"X"}</td>
</tr>
<%--물품 가격 합계 구하기 --%>
	<c:set var="priceSum" value="${priceSum+i.price}" />
<c:if test="${i.purchase==1}">
	<c:set var="buySum" value="${buySum+i.price}" />
</c:if>
<%--물품 개수 구하기 --%>
	<c:set var="count" value="${count+1}" />
<c:if test="${i.purchase==1}">
	<c:set var="buycount" value="${buycount+1}" />
</c:if>
</c:forEach>
	<tr>
		<th></th>
		<th>합계  : <c:out value="${buySum}" /> / <c:out value="${priceSum}" /></th>
		<th>총 개수 : <c:out value="${buycount}"/> / <c:out value="${count}"/></th>
	</tr>
</table>
</div>
</body>
</html>