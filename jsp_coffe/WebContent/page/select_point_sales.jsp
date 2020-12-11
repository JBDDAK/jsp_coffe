<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>
<table border="1">
  <tr>
    <th>매장코드</th>
    <th>매장명</th>
    <th>매장별 판매액</th>
  </tr>

<%
	
	DecimalFormat formatter2 = new DecimalFormat("###,###");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
		if (conn != null) {
			System.out.println("Database Connected!");
		}
		else {
			System.out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "select shop.scode, shop.sname, sum(product.cost * salelist.amount) from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST "+
				"WHERE salelist.pcode = product.pcode "+
				"AND shop.scode = salelist.scode "+
				"GROUP BY shop.scode, shop.sname "+
				"order by shop.scode";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) + "</td>");
				out.print("<td>"+ rs.getString(2) + "</td>");
				out.print("<td>"+ formatter2.format(rs.getInt(3)) + "</td>");
				out.print("</tr>");
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>