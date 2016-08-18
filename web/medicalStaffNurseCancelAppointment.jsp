<%-- 
    Document   : deleteRoster
    Created on : May 4, 2016, 12:04:25 PM
    Author     : Asyraf
--%>

<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String e27 = request.getParameter("e27");
    String e32 = request.getParameter("e32");
    String e48 = request.getParameter("e48");
    
    if(e27.equals(e27) && e32.equals(e32) && e48.equals(e48))
    {
        RMIConnector rmic = new RMIConnector();
        String sqlUpdate = "UPDATE pms_appointment "
                + "SET status='inactive' "
                + "WHERE pmi_no='"+e27+"' AND hfc_cd='"+e48+"' AND appointment_date='"+e32+"'";

        boolean isUpdate = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlUpdate);
        
//        out.print(sqlUpdate);
//        out.print(isUpdate);
        
        if(isUpdate)
        {
            response.sendRedirect("medicalStaffNurse.jsp");
        }
    }
    else
    {
        response.sendRedirect("data not exist");
    }
%>
