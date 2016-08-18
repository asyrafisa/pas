<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String urlVar = request.getParameter("name");
    String sql = "SELECT * FROM pms_patient_biodata WHERE patient_name LIKE '%"+urlVar+"%' ";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    //out.print(data);
%>
<%@include file="header.jsp"%>
<table>
    <tr>
        <th>Name</th>
        <th>IC</th>
    </tr>
<%
    if (data.size() > 0) {
        for (int i = 0; i < data.size(); i++) {
%>
    <tr>
        <td><%=data.get(i).get(2) %></td>
        <td><%=data.get(i).get(4) %></td>
    </tr>
<% } } %>
</table>