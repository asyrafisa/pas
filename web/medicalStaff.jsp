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

    String username = (String)session.getAttribute("username");
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String)session.getAttribute("USER_NAME");
    String title = (String)session.getAttribute("OCCUPATION_CODE");
        
//    out.print(username);
      
    String sql = "SELECT lm.Master_Ref_code, ld.`Master_Ref_code`, ld.Detail_Ref_code, pmsh.*, ld.Description "
            + "FROM lookup_master lm, lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Ref_code` = ld.`Master_Ref_code` AND ld.`Master_Ref_code` = '0002' AND ld.`Detail_Ref_code` = pmsh.state_code "
            + "ORDER BY ld.`Description` ASC, pmsh.holiday_date ASC, pmsh.status DESC";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
     
    String sqlDisplayClinic =  "SELECT d.*, sub.description AS subdiscipline_name "
            + "FROM lookup_detail sub, "
            + "(SELECT c.*, al.description AS discipline_name "
            + "FROM lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name "
            + "FROM lookup_detail hfc,"
            + "(SELECT t.*,ld.description AS state_name "
            + "FROM lookup_detail ld, "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time,  status "
            + "FROM pms_clinic_day)t "
            + "WHERE t.state_code=ld.`Detail_Ref_code` AND ld.`Master_Ref_code` = '0002')b "
            + "WHERE hfc.Master_Ref_Code='0081' AND hfc.Detail_Ref_code = b.hfc_cd)c "
            + "WHERE al.`Master_Ref_code`='0072' AND al.`Detail_Ref_code` = c.discipline_cd)d "
            + "WHERE sub.`Master_Ref_code` = '0071' AND sub.`Detail_Ref_code` = d.subdiscipline_cd "
            + "ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);
    
    String sqlDisplayRoster =  "SELECT ad.USER_NAME, ad.USER_ID, dr.hfc_cd, DATE(dr.start_date) AS start_date, DATE(dr.end_date) AS end_date, TIME(dr.start_time) AS start_time, TIME(dr.end_time) AS end_time, dr.roster_category, dr.status "
            + "FROM adm_user ad, pms_duty_roster dr "
            + "WHERE ad.USER_ID = dr.user_id";
    ArrayList<ArrayList<String>> dataClinicRoster = Conn.getData(sqlDisplayRoster);
    
    String sqlStaffLeave = "SELECT user_id, date(start_leave_date), date(end_leave_date), leave_reason, status "
            + "FROM pms_staff_leave WHERE user_id = '"+username+"' AND (status = 'process' OR status = 'approve' OR status = 'not approve') "
            + "ORDER BY status DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);
    //boolean statGetData=false;
    //out.print(data);
    
    //    out.print(username);
//    for (int i = 0; i < dataClinicDay.size(); i++)
//    {
//        out.print(dataClinicDay.get(i).get(11));
//    }
     
    String e1 = null; 
    String e2 = null;
    String e3 = null;
    String e4 = null;
    String e5 = null;
    String e6 = null;
    String stateCode = null;
    String e7 = null;
    String HFCCode = null;
    String e8 = null;
    String disciplineCode = null;
    String e9 = null;
    String subdisciplineCode = null;
    String e10 = null;
    String e11 = null;
    String e12 = null;
    String e13 = null;
    String e14 = null;
    String userID = null;
    String e15 = null;
    String e16 = null;
    String e17 = null;
    String e18 = null;
    String e19 = null;
    String e20 = null;
    String e21 = null;
    String e22 = null;
    String e23 = null;
    String e24 = null;
    String e25 = null;
    String e26 = null;
//    String getHFC = null;

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
    e12 = request.getParameter("e12");
    e13 = request.getParameter("e13");
    e14 = request.getParameter("e14");
    e15 = request.getParameter("e15");
    e16 = request.getParameter("e16");
    e17 = request.getParameter("e17");
    e18 = request.getParameter("e18");
    e19 = request.getParameter("e19");
    e20 = request.getParameter("e20");
    e21 = request.getParameter("e21");
    e22 = request.getParameter("e22");
    e23 = request.getParameter("e23");
    e24 = request.getParameter("e24");
    e25 = request.getParameter("e25");
    e26 = request.getParameter("e26");

%>
<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 col_image">
            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" id="UTeMImage">
        </div>
    </div> 
    <div class="row" id="rowSignInUp">
        <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-6" id="left_column">
            <h3><em>E-Health Appointment</em></h3>
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
                <h3 class="headerTitle">View Holiday</h3>
                
                <div class="dropdown"  style="padding-bottom: 2%">
                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">View By
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" >
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="medicalStaff.jsp">National And State</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">State</a></li>
                    </ul>
                  </div>
                
                
                <div class="table-responsive">
                 <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>State</center></th>
                            <th><center>Date</center></th>
                            <th><center>Description</center></th>
                            <th><center>Type</center></th>
                            <th><center>Status</center></th>
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
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                        <td><center><%=data.get(i).get(8)%></center></td>
                                        <td><center><%=date%></center></td>
                                        <td><center><%=data.get(i).get(5)%></center></td>
                                        <td><center><%=data.get(i).get(6)%></center></td>
                                        <td><center><%=data.get(i).get(7)%></center></td>
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
            </div>
            <div id="clinicday" class="tab-pane fade">
                <h3 class="headerTitle">View Clinic Day</h3>
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center>No</center></th>
                            <th><center>State</center></th>
                            <th><center>Health Facility Name </center></th>
                            <th><center>Discipline</center></th>
                            <th><center>Subdiscipline</center></th>
                            <th><center>Clinic Day</center></th>
                            <th><center>Start Time</center></th>
                            <th><center>End Time</center></th>
                            <th><center>Status</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataClinicDay.size() > 0) 
                            {
                                for (int i = 0; i < dataClinicDay.size(); i++) 
                                {%>
                                    <tr>
                                        <td><center>
                                            <%
                                                out.print(i+1);
                                            %>
                                        </center></td>
                                        <td><center><%=dataClinicDay.get(i).get(8)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(9)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(10)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(11)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(2)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(5)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(6)%></center></td>
                                        <td><center><%=dataClinicDay.get(i).get(7)%></center></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="roster" class="tab-pane fade">
                    <h3 class="headerTitle">View Roster</h3>
                    <div class="table-responsive">
                     <table class="table table-bordered table-hover">
                    <thead>
                        
                        <tr> 
                            <th><center> No</center> </th>
                            <th><center> Staff Name</center></th>
                            <th><center> Start Date </center></th>
                            <th><center> End Date</center></th>
                            <th><center> Start Time</center></th>
                            <th><center> End Time</center></th>
                            <th><center> Roster Category</center></th>
                            <th><center> Status</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataClinicRoster.size() > 0) 
                            {
                                for (int i = 0; i < dataClinicRoster.size(); i++) 
                                {Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String startDateFromDB = dataClinicRoster.get(i).get(3);
                                    String endDateFromDB = dataClinicRoster.get(i).get(4);
                                    Date startDateDB = formatter.parse(startDateFromDB);
                                    Date endDateDB = formatter.parse(endDateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String dateStart = DATE_FORMAT.format(startDateDB);
                                    String dateEnd = DATE_FORMAT.format(endDateDB);                              
                                    
//                                 %>
                                    <tr>
                                        <td><center> 
                                            <%
                                               out.print(i+1);
                                            %>
                                         </center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(0)%></center></td>
                                        <td><center> <%=dateStart%></center></td>
                                        <td><center> <%=dateEnd%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(5)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(6)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(7)%></center></td>
                                        <td><center> <%=dataClinicRoster.get(i).get(8)%></center></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                    </table>
                    </div>
            </div>
          <div id="leave" class="tab-pane fade">
                <h3 class="headerTitle">Apply Leave</h3>
                
                <form class="form-horizontal" role="form" method="post" action="addLeave.jsp"> 
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                        <div class="col-sm-10"> 
                            
                           
                            <input  class="form-control" value="<%=hfc%>" type="text" readonly>
                         
                            
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="staffID">Staff Name </label>
                        <div class="col-sm-10"> 
                            
                            <%if(e23 == null)
                            {%>
                                <input  class="form-control" value="<%=name%>" name="staffID" type="text" readonly>
                            <%}
                            else
                            {%>
                                <input class="form-control" value="<%=e23%>" name="staffID" type="text" readonly>
                            <%}%>
                        </div>
                    </div>  
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="startLeave">Start Leave </label>
                        <input type="hidden" name="startLeaveBefore" value="<%=e24%>">
                        <div class="col-sm-10">
                           <%if(e24 == null)
                            {%>
                                <input  class="form-control" name="start_leave" value="" type="date" required>
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="start_leave" value="<%=e24%>" type="date" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label col-sm-2" for="endLeave">End Leave </label>
                        <div class="col-sm-10">
                           <%if(e25 == null)
                            {%>
                                <input  class="form-control" name="end_leave" value="" type="date" required>
                            <%}
                            else
                            {%>
                               <input  class="form-control" name="end_leave" value="<%=e25%>" type="date" required>
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-md-2" for="description">Leave Reason</label>  
                        <div class="col-sm-10">
                            <%if(e26 == null)
                            {%>
                                 <textarea class="form-control" name="leave_reason"  rows="5" id="description" required></textarea>
                            <%}
                            else
                            {%>
                                <textarea class="form-control"  name="leave_reason" rows="5" id="description" required><%=e26%></textarea>
                            <%}%>    
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Apply</button>
                            <!--<button type="submit" class="btn btn-success" formaction="updateLeave.jsp">Update</button>-->
                            <button type="reset" class="btn btn-success">Cancel</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><center>No</center></th>
                            <th><center>Start date</center></th>
                            <th><center>End date</center></th>
                            <th><center>Reason</center></th>
                            <th><center>Total Day</center></th>
                            <th><center>Status</center></th>
                            <!--<th><center>Action</center></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (dataStaffLeave.size() > 0) 
                            {
                                for (int i = 0; i < dataStaffLeave.size(); i++) 
                                {
                                    Date today = new Date();
                                    String expectedPattern = "yyyy-MM-dd";
                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                    String startLeaveDateFromDB = dataStaffLeave.get(i).get(1);
                                    Date startLeaveDate = formatter.parse(startLeaveDateFromDB);
                                    String endLeaveDateFromDB = dataStaffLeave.get(i).get(2);
                                    Date endLeaveDate = formatter.parse(endLeaveDateFromDB);
                                    
                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                    String startLeave = DATE_FORMAT.format(startLeaveDate);
                                    String endLeave = DATE_FORMAT.format(endLeaveDate);
                                    
                                    String staffIDFromDB = dataStaffLeave.get(i).get(0);
                                    
//                                    RMIConnector rmic = new RMIConnector();
                                    String sqlTotalDay = "SELECT DATEDIFF('"+endLeaveDateFromDB+"', '"+startLeaveDateFromDB+"') AS TotalDay "
                                            + "FROM pms_staff_leave "
                                            + "WHERE user_id = '"+staffIDFromDB+"'";
                                    ArrayList<ArrayList<String>> dataTotalDay = Conn.getData(sqlTotalDay);
//                                    boolean isSelect = rmic.setQuerySQL("10.73.32.200", 1099, sqlTotalDay);
//                                    out.print(sqlTotalDay);
//                                    out.print(isSelect);
                                    int plusOneDay = 1;
                                    int dayFromDBCalculation = Integer.parseInt(dataTotalDay.get(0).get(0));
                                    int totalDay = dayFromDBCalculation + plusOneDay;

                                    %>
                                    <tr>
                                        <td><center>
                                            <%
                                               out.print(i+1);
                                                    
                                                %>
                                        </center></td>
                                        <td><center><%=startLeave%></center></td>
                                        <td><center><%=endLeave%></center></td>
                                        <td><center><%=dataStaffLeave.get(i).get(3)%></center></td>
                                        <td><center><%=totalDay%></center></td>
                                        <td><center><%=dataStaffLeave.get(i).get(4)%></center></td>
                                        <td><center>
                                            <a href="medicalStaff.jsp?e24=<%=dataStaffLeave.get(i).get(1)%>&e25=<%=dataStaffLeave.get(i).get(2)%>&e26=<%=dataStaffLeave.get(i).get(3)%>"> 
                                                <button class="btn btn-xs btn-primary">Edit</button></a>
                                        </center></td>
                                    </tr>
                                <%
                                }
                            }%>
                    </tbody>
                </table>
                </div>
            </div>
            <div id="appointment" class="tab-pane fade">
                    <h3 class="headerTitle">Maintain Appointment</h3>
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
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#holiday">View Holiday</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#clinicday">View Clinic Day</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#roster">View Roster</a></li>
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#leave">Apply Leave</a></li>  
                    <li id="tab"><a data-toggle="tab" class="editTab" href="#appointment">Maintain Appointment</a></li> 
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
