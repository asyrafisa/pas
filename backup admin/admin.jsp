<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String sql = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code "
            + "ORDER BY ld.`Description` ASC, pmsh.holiday_date ASC, pmsh.status DESC";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    
    String sqlDisplayClinic =  "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmscd.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_clinic_day pmscd "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0081' AND ld.`Detail_Ref_code` = pmscd.hfc_cd "
            + "ORDER BY ld.`Description` ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);
    //boolean statGetData=false;
    //out.print(data);
    
    String e1 = null; 
    String stateName = null;
    String e2 = null;
    String e3 = null;
    String e4 = null;
    String e5 = null;
    String e6 = null;
    String HFCCode = null;
    String e7 = null;
    String e8 = null;
    String e9 = null;
    String e10 = null;
    String e11 = null;

    e1 = request.getParameter("e1");
    e2 = request.getParameter("e2");
    e3 = request.getParameter("e3");
    e4 = request.getParameter("e4");
    e5 = request.getParameter("e5");   
    e6 = request.getParameter("e6"); 
    e7 = request.getParameter("e7"); 
    e8 = request.getParameter("e8"); 
    e9 = request.getParameter("e9"); 
    e10 = request.getParameter("e10"); 
    e11 = request.getParameter("e11"); 

%>
<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <% String username = (String)session.getAttribute("username"); %>
    
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 col_image">
            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image">
        </div>
    </div> 
    <div class="row" id="rowSignInUp">
        <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-6" id="left_column">
            <h3><i>e-Appointment</i></h3>
        </div>
        <div class="col-md-2 col-md-offset-3 col-sm-6 col-xs-6" id="right_column_signinup">
            <ul id="menu">
                <li style="margin-right: 4%; color: white;">Hello <%=username%></li> 
            <!--<button class="btn btn-info buttonAuthenticate"> </button>-->
            <li><button class="btn btn-info buttonAuthenticate" onclick="window.location.href='index.jsp'">Log out</button></li>
            </ul>
        </div>
            <div class="col-md-3"></div>
    </div>  
    <div class="row">
        <div class="col-md-8 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
            <div class="tab-content">
            <div id="home" class="tab-pane active">
                <h3 class="headerTitle">Welcome to E-Health Appointment System</h3>
                <p style="text-align: justify"><strong>Web Bases Patient Appointment Management System  is used to manage patient record the appointment data patient,
                            doctor choose by  patient, appointment date, treatment package by using web based. Laptop and  mobile or any electronic system
                            that contain web-browser software also can open  the e-health of website, so that it is take convenience to user for book  appointment.
                            User can use internet by web browser go to the website for booking  appointment with sign in user first. User can choose the doctor
                            which user may  want to meet and the system will let user to choose the available booking time  and date. After the user has choose 
                            the time and date, the information of data  will record into database and it may wont lost. This system save a lot time of 
                            the appointment process and it is secure.
                </strong></p>
                <h3 class="headerTitle">Objective</h3>
                <p><strong>1)	To provide a fast, reliable and convenient way in keeping track of patients make appointments.</strong></p>
                <p><strong>2)	To reduce time-taken for staffs and dentists to check on their patients book appointments and treatments to perform on a particular patient. </strong></p>
                <p><strong>3)	To record of type of treatment that given to the patients all the appointments.</strong></p>
                <p><strong>4)	To provide the backup and recovery mechanism when the system is down on all database. By using this system, it allow user to make a copy of data. It can help user to protecting the files that make up on database from crash.</strong></p>
                <h3 class="headerTitle">Our Location</h3>

                <div class="google_map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1
                        e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746" width="700" height="450" frameborder="0"></iframe></div>
                View <a href="https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888" class="large_map">Utem Clinic</a> in a larger map        
            </div>
            <div id="holiday" class="tab-pane fade">
                <h3 class="headerTitle">Maintain Holiday</h3>
                <form class="form-horizontal" role="form" method="post" action="addHoliday.jsp">
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">State </label>
                        <div class="col-sm-10"> 
                             <input type="hidden" name="stateBefore" value="<%=e1%>">
                            <select class="form-control" id="state" name="state_code" required>
                                <option></option>
                           <%   String sql2 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0002';";
                                ArrayList<ArrayList<String>> dataState = Conn.getData(sql2);
                                
                                if(e1 == null)
                                {
                                    if(dataState.size()>0)
                                    {
                                        for(int i = 0; i < dataState.size(); i++)
                                        {%>
                                            <option value="<%=dataState.get(i).get(0)%>"><%=dataState.get(i).get(1)%></option>
                                        <%}
                                    }
                               }
                                else
                                {    
                                    for(int i = 0; i < dataState.size(); i++)
                                    {
                                        if(e1.equals(dataState.get(i).get(0)))
                                        {%> 
                                            <option value="<%=e1%>" selected><%=dataState.get(i).get(1)%></option>
                                       <%}
                                        else
                                        {%>
                                            <option value="<%=dataState.get(i).get(0)%>"><%=dataState.get(i).get(1)%></option>
                                       <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="startdate">Date</label>  
                        <input type="hidden" name="dateBefore" value="<%=e2%>">
                        <div class="col-sm-10">   
                            <%if(e2 == null)
                            {%>
                                <input  name="holiday_date" type="text" class="form-control" id="startdate" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="" required>
                            <%}
                            else
                            {%>
                                <input name="holiday_date" value="<%= e2 %>" type="text" class="form-control" id="startdate" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Select date" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-2" for="description">Description</label>  
                        <div class="col-sm-10">
                            <%if(e3 == null)
                            {%>
                                 <textarea name="holiday_desc" class="form-control" rows="5" id="description" required></textarea>
                            <%}
                            else
                            {%>
                                <textarea name="holiday_desc" class="form-control" rows="5" id="description" required><%=e3%></textarea>
                            <%}%>

                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="type">Type </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="type" name="holiday_type" required>
                                    <%if (e4 == null) 
                                {%>
                                    <option></option>
                                    <option value="national">national</option>
                                    <option value="state">state</option>
                                <%} 
                                else 
                                {
                                    if (e4.equals("national")) 
                                    {%> 
                                        <option value="national" selected>national</option>
                                        <option value="state">state</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="national">national</option>
                                        <option value="state" selected>state</option><%
                                    }%>
                              <%}%> 
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="status">Status </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="status" name="status" required>
                                
                                <%if (e5 == null) 
                                {%>
                                    <option></option>
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                <%} 
                                else 
                                {
                                    if (e5.equals("active")) 
                                    {%> 
                                        <option value="active" selected>active</option>
                                        <option value="inactive">inactive</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="active" >active</option>
                                        <option value="inactive" selected>inactive</option><%
                                    }%>
                              <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-success" formaction="updateHoliday.jsp">Update</button>
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                </form>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>State</th>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (data.size() > 0) 
                            {
                                for (int i = 0; i < data.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String dateFromDB = data.get(i).get(4);
                                    Date dateDB = formatter.parse(dateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String date = DATE_FORMAT.format(dateDB);
                                    
                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                    String newDate = df.format(dateDB);
                                    //out.print(newDate);
                                    
                                    %>
                                    <tr>
                                        <td><%=data.get(i).get(8)%></td>
                                        <td><%=date%></td>
                                        <td><%=data.get(i).get(5)%></td>
                                        <td><%=data.get(i).get(6)%></td>
                                        <td><%=data.get(i).get(7)%></td>
                                        <td>
                                            <a href="admin.jsp?e1=<%=data.get(i).get(3)%>&e2=<%=data.get(i).get(4)%>&e3=<%=data.get(i).get(5)%>&e4=<%=data.get(i).get(6)%>&e5=<%=data.get(i).get(7)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href='deleteHoliday.jsp?e1=<%=data.get(i).get(3)%>&e2=<%=data.get(i).get(4)%>'">Delete</button>
                                         </td>
                                    </tr>
                                <%



                                    if(dateDB.before(today))
                                    {      
                                                RMIConnector rmic = new RMIConnector();
                                                String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                boolean isInsert = rmic.setQuerySQL("10.73.32.200", 1099, sqlInsert);
                                    }
                                }
                            }%>
                    </tbody>
                </table>
            </div>
            <div id="clinicday" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Clinic Day</h3>
                    <form class="form-horizontal" role="form" method="post" action="addClinicDay.jsp">    
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">State </label>
                        <div class="col-sm-10"> 
                             <!--<input type="hidden" name="stateBefore" value="<%=e1%>">-->
                            <select class="form-control" id="state_Code" name="state_code" required>
                                <option></option>
                           <%   String sql3 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0002'";
                                ArrayList<ArrayList<String>> dataStateClinic = Conn.getData(sql3);
                                
                                if(e1 == null)
                                {
                                    if(dataStateClinic.size()>0)
                                    {
                                        for(int i = 0; i < dataStateClinic.size(); i++)
                                        {%>
                                            <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                                        <%}
                                    }
                                }
                                else
                                {    
                                    String sqlStateName = "SELECT Description FROM lookup_detail WHERE Master_Ref_code = '0002' AND Detail_Ref_code ='"+e1+"'";
                                    ArrayList<ArrayList<String>> dataStateName = Conn.getData(sqlStateName);  

                                    stateName = dataStateName.get(0).get(0);

                                    for(int i = 0; i < dataStateClinic.size(); i++)
                                    {
                                        if(stateName.equals(dataStateClinic.get(i).get(1)))
                                        {%> 
                                            <option value="<%=e1%>" selected><%=dataStateClinic.get(i).get(1)%></option>
                                       <%}
                                        else
                                        {  %>
                                            <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                                       <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                        <div class="col-sm-10"> 
                        <input type="hidden" name="hfcBefore" value="<%=e6%>">
                            <select class="form-control" id="hfc_code" name="hfc_code" required>
                            <option></option>
                            <%  String sql4 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0081'";
                                ArrayList<ArrayList<String>> dataHFCClinic = Conn.getData(sql4);

                                if (e6 == null) 
                                {
                                    if (dataHFCClinic.size() > 0) 
                                    {
                                        for (int i = 0; i < dataHFCClinic.size(); i++) 
                                        {%>
                                                <option value="<%=dataHFCClinic.get(i).get(0)%>"><%=dataHFCClinic.get(i).get(0)%> / <%=dataHFCClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                } 
                                else 
                                {
                                    String sqlHFCCode = "SELECT Detail_Ref_code FROM lookup_detail WHERE Master_Ref_code = '0081' AND  Description ='"+e6+"'";
                                    ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(sqlHFCCode);  

                                    HFCCode = dataHFCCode.get(0).get(0);

                                    for (int i = 0; i < dataHFCClinic.size(); i++) 
                                    {
                                        if (HFCCode.equals(dataHFCClinic.get(i).get(0))) 
                                        {%> 
                                            <option value="<%=HFCCode%>" selected><%=HFCCode%> / <%=dataHFCClinic.get(i).get(1)%></option>
                                      <%} 
                                        else 
                                        {%>
                                            <option value="<%=dataHFCClinic.get(i).get(0)%>"><%=dataHFCClinic.get(i).get(0)%> / <%=dataHFCClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="discipline">Discipline </label>
                        <div class="col-sm-10"> 
                        <input type="hidden" name="disciplineBefore" value="<%=e7%>">
                            <select class="form-control" id="discipline" name="discipline" required>
                            <option></option>
                            <%  String sql5 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0072';";
                                ArrayList<ArrayList<String>> dataDicClinic = Conn.getData(sql5);

                                if (e7 == null) 
                                {
                                    if (dataDicClinic.size() > 0) 
                                    {
                                        for (int i = 0; i < dataDicClinic.size(); i++) 
                                        {%>
                                                <option value="<%=dataDicClinic.get(i).get(1)%>"><%=dataDicClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                } 
                                else 
                                {
                                    for (int i = 0; i < dataDicClinic.size(); i++) 
                                    {
                                        if (e7.equals(dataDicClinic.get(i).get(1))) 
                                        {%> 
                                            <option value="<%=dataDicClinic.get(i).get(1)%>" selected><%=dataDicClinic.get(i).get(1)%></option>
                                      <%} 
                                        else 
                                        {%>
                                            <option value="<%=dataDicClinic.get(i).get(1)%>"><%=dataDicClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="subdiscipline">Subdiscipline </label>
                        <div class="col-sm-10"> 
                        <input type="hidden" name="subdisciplineBefore" value="<%=e8%>">
                            <select class="form-control" id="subdiscipline" name="subdiscipline" required>
                            <option></option>
                            <%  String sql6 = "SELECT Detail_Ref_code, Description FROM lookup_detail WHERE Master_Ref_code = '0071';";
                                ArrayList<ArrayList<String>> dataSubClinic = Conn.getData(sql6);

                                if (e8 == null) 
                                {
                                   
                                    if (dataSubClinic.size() > 0) 
                                    {
                                        for (int i = 0; i < dataSubClinic.size(); i++) 
                                        {%>
                                            <option value="<%=dataSubClinic.get(i).get(1)%>"><%=dataSubClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                } 
                                else 
                                {
                                    for (int i = 0; i < dataSubClinic.size(); i++) 
                                    {
                                        if (e8.equals(dataSubClinic.get(i).get(1))) 
                                        { %> 
                                            <option value="<%=dataSubClinic.get(i).get(1)%>" selected><%=dataSubClinic.get(i).get(1)%></option>
                                      <%} 
                                        else 
                                        { %>
                                            <option value="<%=dataSubClinic.get(i).get(1)%>"><%=dataSubClinic.get(i).get(1)%></option>
                                      <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div><%        
                        String sqlTest = "SELECT * FROM pms_holiday WHERE state_code = '05' AND status = 'active' AND holiday_type = 'state' OR holiday_type = 'national'";
                                    ArrayList<ArrayList<String>> dataHolidayTest = Conn.getData(sqlTest); 

                                        for (int i = 0; i < dataHolidayTest.size(); i++) 
                                        {
                                            String holidayStateCode = dataHolidayTest.get(i).get(0);
                                            
                                            Date today = new Date();
                                            String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                            String dateFromDB = dataHolidayTest.get(i).get(1);
                                            Date dateDB = formatter.parse(dateFromDB);

                                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                            String date = DATE_FORMAT.format(dateDB);

                                            SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                            String newDate = df.format(dateDB);
                                            
//                                            out.print("(");
//                                            out.print(date);
//                                            out.print(" ~ ");
////                                            out.print(dateDB);
////                                          out.print(" ~~ ");
//                                            out.print(newDate);
//                                            out.print(")");
//                                            out.print(" ****** ");
                                        }
                    
                    %>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="state">Clinic Day </label>
                        <div class="col-sm-10"> 
                        <input type="hidden" name="dayBefore" value="<%=e9%>">
                            <select class="form-control" id="day" name="day" onchange="" required>
                                <option></option>
                                <% 
//                                    String getStateCode = document.getElementById("state_Code").value;
                                    
                                    String sqlCheckHoliday = "SELECT * FROM pms_holiday WHERE state_code = '09' AND holiday_type = 'state' OR holiday_type = 'national'";
                                    ArrayList<ArrayList<String>> dataCheckHoliday = Conn.getData(sqlCheckHoliday); 
 
                                    if(e9 == null)
                                    {%>
                                    
                                    <option value="Monday">Monday</option>
                                    <option value="Tuesday">Tuesday</option>
                                    <option value="Wednesday">Wednesday</option>
                                    <option value="Thursday">Thursday</option>
                                    <option value="Friday">Friday</option>
                                    <option value="Saturday">Saturday</option>
                                    <option value="Sunday">Sunday</option>
                                    <%}
                                else 
                                {
                                    if(e9.equals("Monday"))
                                    {%>
                                        <option value="<%=e9%>" selected><%=e9%></option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option> 
                                    <%}
                                    else if(e9.equals("Tuesday"))
                                    {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="<%=e9%>" selected><%=e9%></option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option> 
                                    <%}
                                    else if(e9.equals("Wednesday"))
                                    {%>
                                        <option value="Monday">Monday</option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="<%=e9%>" selected><%=e9%></option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option>
                                    <%}
                                    else if(e9.equals("Thursday"))
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday" >Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="<%=e9%>" selected><%=e9%></option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option>
                                <%} 
                                else if(e9.equals("Friday"))
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday" >Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="<%=e9%>" selected><%=e9%></option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="Sunday">Sunday</option>
                                <%} 
                                else if(e9.equals("Saturday"))
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday" >Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="<%=e9%>" selected><%=e9%></option>     
                                        <option value="Sunday">Sunday</option>
                                <%} 
                                else
                                {%>
                                        <option value="Monday" >Monday</option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>     
                                        <option value="<%=e9%>" selected><%=e9%></option>
                                <%}} %>
                               
                            </select>
<!--                            <script>
                                function changeddl($this)
                                {
                                    var day = document.getElementById("state_Code").value;
                                    alert(day);
                                }
                            </script>-->
                        </div>
                    </div>                  
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="starttime">Start Time</label>  
                        <div class="col-sm-10">   
                            <%if(e10 == null)
                            {%>
                                <input  name="starttime" type="datetime-local" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}
                            else
                            {%>
                                <input name="starttime" value="<%= e10 %>" type="time" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}%>
                        </div>
                    </div>   
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="endtime">End Time</label>  
                        <div class="col-sm-10">   
                            <%if(e11 == null)
                            {%>   
                            <!--onfocus="(this.type='time')" onblur="(this.type='time')" placeholder=""--> 
                                <input  name="endtime" type="datetime-local" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}
                            else
                            {%>
                                <input name="endtime" value="<%= e11 %>" type="time" class="form-control" id="startdate" onfocus="(this.type='time')" onblur="(this.type='time')" placeholder="" required>
                            <%}%>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="status">Status </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="status" name="status" required>
                                
                                <%if (e5 == null) 
                                {%>
                                    <option></option>
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                <%} 
                                else 
                                {
                                    if (e5.equals("active")) 
                                    {%> 
                                        <option value="active" selected>active</option>
                                        <option value="inactive">inactive</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="active" >active</option>
                                        <option value="inactive" selected>inactive</option><%
                                    }%>
                              <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-success" formaction="updateClinicDay.jsp">Update</button>
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                    </form>
                        
                         <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th>State</th>
                            <th>Health Facility Name </th>
                            <th>Discipline</th>
                            <th>Subdiscipline</th>
                            <th>Clinic Day</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataClinicDay.size() > 0) 
                            {
                                for (int i = 0; i < dataClinicDay.size(); i++) 
                                {
                                    
                                    
//                                    DateTime dt = DateTime.Parse(data.get(i).get(4));
//
//                                    dt.ToString("HH:mm"); // 07:00 // 24 hour clock // hour is always 2 digits
//                                    dt.ToString("hh:mm tt"); // 07:00 AM // 12 hour clock // hour is always 2 digits
//                                    dt.ToString("H:mm"); // 7:00 // 24 hour clock
//                                    dt.ToString("h:mm tt"); // 7:00 AM // 12 hour clock
                                    
                                    
                                    
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    
                                    String dateFromDBStart = dataClinicDay.get(i).get(7);
                                    Date dateDBStart = formatter.parse(dateFromDBStart);
                                    String dateFromDBEnd = dataClinicDay.get(i).get(8);
                                    Date dateDBEnd = formatter.parse(dateFromDBEnd);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String dateStart = DATE_FORMAT.format(dateDBStart);
                                    String dateEnd = DATE_FORMAT.format(dateDBEnd);
                                    
                                    
                                    SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
                                    String StartTime = sdfTime.format(dateDBStart);
                                    String EndTime = sdfTime.format(dateDBEnd);
                                    
                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                    String newDate = df.format(dateDBStart);
//                                    out.print(newDate);
                                    
                                    %>
                                    <tr>
                                        <td><%=dataClinicDay.get(i).get(9)%></td>
                                        <td><%=dataClinicDay.get(i).get(11)%></td>
                                        <td><%=dataClinicDay.get(i).get(4)%></td>
                                        <td><%=dataClinicDay.get(i).get(5)%></td>
                                        <td><%=dataClinicDay.get(i).get(6)%></td>
                                        <td><%=StartTime%></td>
                                        <td><%=EndTime%></td>
                                        <td><%=dataClinicDay.get(i).get(10)%></td>
                                        <td>
                                            <a href="admin.jsp?e1=<%=dataClinicDay.get(i).get(9)%>&e5=<%=dataClinicDay.get(i).get(10)%>&e6=<%=dataClinicDay.get(i).get(11)%>&e7=<%=dataClinicDay.get(i).get(4)%>&e8=<%=dataClinicDay.get(i).get(5)%>&e9=<%=dataClinicDay.get(i).get(6)%>&e10=<%=StartTime%>&e11=<%=EndTime%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                                <button class="btn btn-xs btn-primary" onClick="location.href='deleteClinicDay.jsp?e6=<%=dataClinicDay.get(i).get(3)%>&e7=<%=dataClinicDay.get(i).get(4)%>&e8=<%=dataClinicDay.get(i).get(5)%>&e9=<%=dataClinicDay.get(i).get(6)%>'">Delete</button>
                                         </td>
                                    </tr>
                                <%



                                    if(dateDBStart.before(today))
                                    {      
                                                RMIConnector rmic = new RMIConnector();
                                                String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                boolean isInsert = rmic.setQuerySQL("10.73.32.200", 1099, sqlInsert);
                                    }
                                }
                            }%>
                    </tbody>
                </table>
                        
<!--                    <p id="content">Dynamic page content</p>
                    <p id="pagination-here"></p>
                    <script>
                        $('#pagination-here').bootpag({
                            total: 5
                        }).on("page", function(event, num){
                            $("#content").html("Page " + num); // or some ajax content loading...

                            // ... after content load -> change total to 10
                            $(this).bootpag({total: 10, maxVisible: 5});

                        });
                    </script>-->
                    
                    
            </div>
            <div id="roster" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Roster</h3>
                    <form class="form-horizontal" role="form" method="post" action="addRoster.jsp">    
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Staff ID / Name / Title </label>
                        <div class="col-sm-10"> 
                             <!--<input type="hidden" name="stateBefore" value="<%=e1%>">-->
                            <select class="form-control" id="staffID" name="staffID" required>
                                <option></option>
                           <%   String sql7 = "SELECT USER_ID, USER_NAME, OCCUPATION_CODE FROM adm_user WHERE OCCUPATION_CODE = 'DOCTOR' OR OCCUPATION_CODE = 'NURSE'";
                                ArrayList<ArrayList<String>> dataUserRoster = Conn.getData(sql7);
                                
                                if(e1 == null)
                                {
                                    if(dataUserRoster.size()>0)
                                    {
                                        for(int i = 0; i < dataUserRoster.size(); i++)
                                        {%>
                                            <option value="<%=dataUserRoster.get(i).get(0)%>"><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                                        <%}
                                    }
                                }
                                else
                                {    
                                    for(int i = 0; i < dataUserRoster.size(); i++)
                                    {
                                        if(e1.equals(dataUserRoster.get(i).get(1)))
                                        {%> 
                                            <option value="<%=e1%>" selected><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                                       <%}
                                        else
                                        {%>
                                            <option value="<%=dataUserRoster.get(i).get(0)%>"><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                                       <%}
                                    }
                                }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Health Facility Name </label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffID" name="staffID" required>
                                <option></option>
                             <% 
                                String sql8 = "SELECT * FROM pms_holiday";
                                ArrayList<ArrayList<String>> dataHoliday = Conn.getData(sql8);
                                
                                String sql9 = "SELECT * FROM pms_clinic_day";
                                ArrayList<ArrayList<String>> dataClinic = Conn.getData(sql9);
                                
                                String sql10 = "SELECT DISTINCT HEALTH_FACILITY_CODE, USER_ID FROM adm_user";
                                ArrayList<ArrayList<String>> dataUserHFCRoster = Conn.getData(sql10); 
                           
                                if(e6 == null)
                                {
                                    if(dataClinic.size()>0)
                                    {
                                        for(int i = 0; i < dataClinic.size(); i++)
                                        {%>
                                            <option value="<%=dataClinic.get(i).get(0)%>"><%=dataClinic.get(i).get(0)%></option>
                                        <%}
                                    }
                                }
                                else
                                {    
                                    for(int i = 0; i < dataClinic.size(); i++)
                                    {
                                        if(e6.equals(dataClinic.get(i).get(0)))
                                        {%> 
                                            <option value="<%=e6%>"><%=dataClinic.get(i).get(0)%></option>
                                       <%}
                                        else
                                        {%>
                                            <option value="<%=dataClinic.get(i).get(0)%>"><%=dataClinic.get(i).get(0)%></option>
                                       <%}
                                    }
                                }%> 
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Roster Category </label>
                        <div class="col-sm-10">
                            <select class="form-control" id="roster_category" name="roster_category" required>
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="startDate">Start Date </label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="start_date" value="" type="date" id="startDate">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="endDate">End Date </label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="end_date" value="" type="date" id="endDate">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="startTime">Start Time </label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="start_time" value="" type="time" id="startTime">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="endTime">End Time </label>
                        <div class="col-sm-10">
                            <input  class="form-control" name="end_time" value="" type="time" id="endTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="status">Status </label>
                        <div class="col-sm-10">  
                            <select class="form-control" id="status" name="status" required>
                                
                                <%if (e5 == null) 
                                {%>
                                    <option></option>
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                <%} 
                                else 
                                {
                                    if (e5.equals("active")) 
                                    {%> 
                                        <option value="active" selected>active</option>
                                        <option value="inactive">inactive</option><%
                                    } 
                                    else 
                                    {%> 
                                        <option value="active" >active</option>
                                        <option value="inactive" selected>inactive</option><%
                                    }%>
                              <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="submit" class="btn btn-success" formaction="updateHoliday.jsp">Update</button>
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                    </form>
            </div>
            <div id="leave" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Leave</h3>
            </div>
            <div id="about" class="tab-pane fade">
                    <h3 class="headerTitle">About Us</h3>
            </div>
            <div id="contact" class="tab-pane fade">
                    <h3 class="headerTitle">Contact Us</h3>
            </div>
            <div id="location" class="tab-pane fade">
                    <h3 class="headerTitle">Our Location</h3>
            </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12 bodyContent">
            <script>
                $(function() { 
                  $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                    //save the latest tab; use cookies if you like 'em better:
                    localStorage.setItem('lastTab', $(this).attr('href'));
                   });
                  //go to the latest tab, if it exists:
                  var lastTab = localStorage.getItem('lastTab');
                  if (lastTab) {
                     $('a[href=' + lastTab + ']').tab('show');
                  }
                  else
                  {
                    // Set the first tab if cookie do not exist
                    $('a[data-toggle="tab"]:first').tab('show');
                  }
                });
            </script>
            <script>
                function login()
                {
                    alert("You need to Sign In first , Press OK and Sign In..");
                }
            </script>
            <h3 class="headerTitle">Categories</h3>
            <!--<ul class="headerUL">-->
                
            <ul class="nav navbar-brand"  style="margin-bottom: 110%;" >
                    <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#holiday">Maintain Holiday</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#clinicday">Maintain Clinic Day</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#roster">Maintain Roster</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#leave">Maintain Leave</a></li>  
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#about">About Us</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#contact">Contact Us</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#location">Our Location</a></li>
           </ul> 
        </div>
   </div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 footer " >
            Copyright &copy; 2016 FTMK
    </div>
</div>
</div>
</body>
</html>
