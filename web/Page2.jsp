<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String sql = "SELECT * FROM pms_patient_biodata ";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    //out.print(data);
%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
<body>
<div class="row">
    <div class="col-md-12" id="header">
        <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" style="height: 10%; width: 15%; float:left;">
    </div>
</div>
<!--<div class="row">
    <div class="col-md-12" style="background-color: yellowgreen">
        hai
    </div>
</div>
    <div class="row">
        <div class="col-md-4 col-md-offset-2" style="background-color: red">
            hai
        </div>
        <div class="col-md-4 col-md-offset-2" style="background-color: yellow">
            huhu
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-md-offset-3" style="background-color: blueviolet">.col-md-3 .col-md-offset-3</div>
        <div class="col-md-3 col-md-offset-3" style="background-color: pink">.col-md-3 .col-md-offset-3</div>
    </div>-->
<div class="row" style="background-color: yellowgreen">
    <div class="col-sm-12">
        <table width="100%" class="column">
            <tr>
                <td class="col_header_left">
                    <h3 style="color: white;">Patient Appointment System</h3>
                </td>
                <td class="col_header_right">
                    <button class="btn btn-info">Sign In</button> &nbsp;
                    <button class="btn btn-info">Sign Up</button>
                </td>
            </tr>
        </table>
    </div>
</div>

   <div class="row">
            <div class="col-sm-2 col-sm-offset-5">
                <input type="text" class="form-control" placeholder="ID" />
            </div>
    </div>  
    
<!--<div class="row">
    <div class="col-sm-8 col-sm-offset-2">  
        <div class="row">
            <div class="col-sm-12">
               <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>IC</th>
                        </tr>
                    </thead>
                    <tbody>
                            <%
                            if (data.size() > 0) 
                            {
                                for (int i = 0; i < data.size(); i++) 
                                {%>
                                    <tr>
                                        <td><%=data.get(i).get(2)%></td>
                                        <td><%=data.get(i).get(4)%></td>
                                    </tr>
                              <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>  -->
<div class="row">
    <div class="col-md-12 footer ">
        Copyright &copy; 2016 FTMK
    </div>
</div>
</body>
</html>