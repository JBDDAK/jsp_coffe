<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var valueCk = true
	function chake(inputBox, errorMsg) {
		if ((inputBox.value === "" || inputBox.value <= 0) && valueCk == true) {
			inputBox.focus();
			alert(errorMsg);
			valueCk = fasle;
			return;
		} else {
			return;
		}
	}
	function submit_form() {
		chake(document.input_form.saleno,"비번호를 입력해주세요")
		chake(document.input_form.pcode,"상품코드를 입력해주세요")
		chake(document.input_form.date,"판매날짜를 선택해주세요")
		chake(document.input_form.scode,"매장코드를 입력해주세요")
		chake(document.input_form.amount,"판매수량를 입력해주세요")
		if(valueCk){
			alert("정상적으로 처리되었습니다.")
			document.input_form.submit();
		}	
	}

	function reset_form() {
		document.input_form.reset();
	}
</script>
<form action="action/insert_sales_action.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td><input type="number" name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="date"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록하기" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>