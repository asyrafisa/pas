<%-- 
    Document   : addAppointment
    Created on : May 22, 2016, 3:29:29 AM
    Author     : user
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
        String dateAppointmentBefore = (String)session.getAttribute("dateAppBefore");
        String pmiNo = request.getParameter("pmiNo");
//        String pmiAppointmentBefore = request.getParameter("pmiAppointmentBefore");
        String patientName = request.getParameter("patientName");
        String idNo = request.getParameter("idNo");
        String appDate= request.getParameter("appDate");
//        String dateAppointmentBefore= request.getParameter("dateAppointmentBefore");
        String appTime = request.getParameter("appTime");
        String appDoc = request.getParameter("appDoc");
        String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
        String disApp = request.getParameter("disApp");
        String subDisApp = request.getParameter("subDisApp");
        String appType = request.getParameter("appType");
        String id = null;
        
        out.print(appDate);
        out.print(dateAppointmentBefore);
        String startDateTime = appDate +  " " + appTime;
        String startDateTimeBefore = dateAppointmentBefore +  " " + appTime;
        
        String newAppTime = appTime +":00";
        String appDateTime = appDate +  " " + appTime;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = df.parse(appDate);

        //Choosen date/day
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
        String chosenDayDate = sdf.format(d1);
//      out.print(chosenDayDate);
        

//      QUERY TO VALIDATE CLINIC DAY (hfc yg open - status > active - compare day) - message -> the clinic is off. Please choose other day
        String sqlGetHFCCode = "SELECT Detail_Ref_code "
                + "FROM lookup_detail "
                + "WHERE Master_Ref_code = '0081' AND Description = '"+hfc+"'";
        ArrayList<ArrayList<String>> dataGetHFCCode = Conn.getData(sqlGetHFCCode);
        
        String dataHFCCode;
        
        if(dataGetHFCCode.size() > 0)
        {
            dataHFCCode = dataGetHFCCode.get(0).get(0);
        }
        else
        {
            dataHFCCode = null;
        }
         

        String sqlGetClinicDay = "SELECT day_cd, discipline_cd, subdiscipline_cd, hfc_cd, state_code "
                + "FROM pms_clinic_day "
                + "WHERE hfc_cd = '"+dataHFCCode+"' AND status = 'active' AND day_cd = '"+chosenDayDate+"' AND ('"+newAppTime+"' BETWEEN start_time AND end_time)";
        ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlGetClinicDay);
        
        String dataStates;
        
        if(dataGetStates.size() > 0)
        {
             dataStates = dataGetStates.get(0).get(4);
        }
        else
        {
              dataStates = null;
        }

        
//      QUERY VALIDATE HOLIDAY (hfc based on state yg active - allowed) - message -> 
        String sqlHoliday = "SELECT holiday_date "
                + "FROM pms_holiday "
                + "WHERE (state_code = '"+dataStates+"' OR state_code = '00') AND status = 'active' AND holiday_date = '"+appDate+"'";
        ArrayList<ArrayList<String>> dataGetHoliday = Conn.getData(sqlHoliday);
        
//      GET DOCTOR ID FROM THE INPUT FORM TO SET UP FOR DOCTOR ROSTER AND DOCTOR LEAVE
        String sqlGetUserID = "SELECT * "
                + "FROM adm_user "
                + "WHERE USER_NAME = '"+appDoc+"'";
        ArrayList<ArrayList<String>> dataGetUserID  = Conn.getData(sqlGetUserID);
        String dataUserID = dataGetUserID.get(0).get(0);
        id=dataUserID;
        
        
//      QUERY VALIDATE DUTY ROSTER (staff yg sedang bekerja - status > active (Doctor only))
        String sqlDutyRoster = "SELECT * "
                + "FROM pms_duty_roster "
                + "WHERE hfc_cd = '"+hfc+"' AND user_id = '"+dataUserID+"' AND status = 'active' AND ('"+appDate+"' BETWEEN start_date AND end_date)";
        ArrayList<ArrayList<String>> dataGetRoster = Conn.getData(sqlDutyRoster);
//        out.print(dataUserID);
        
//      QUERY VALIDATE LEAVE (staff not in leave - allowed (Doctor only)) date entered compare ngan tarikh end leave dan status yg active
        String sqlGetLeaveStatus = "SELECT user_id, start_leave_date, end_leave_date, status "
                + "FROM pms_staff_leave "
                + "WHERE user_id = '"+dataUserID+"' AND status = 'approve' ('"+appDate+"' BETWEEN start_leave_date AND end_leave_date)";
        ArrayList<ArrayList<String>> dataGetLeaveStatus  = Conn.getData(sqlGetLeaveStatus);
//       String dataLeaveStatus = dataGetLeaveStatus.get(0).get(2);
        
        if(dataGetHoliday.size() > 0)
        {
            %><script language='javascript'>
                alert('The date is holiday. Please pick others date.'); 
                window.location= 'adminAppointmentUpdate.jsp?e38=<%=pmiNo%>&e39=<%=patientName%>&e40=<%=idNo%>&e41=<%=appDate%>&e42=<%=appTime%>&e43=<%=appDoc%>&e44=<%=disApp%>&e45=<%=subDisApp%>&e46=<%=appType%>';
            </script> <%
        }
        else
        {
            if(dataGetStates.size() > 0)
            {
                if(dataGetRoster.size() > 0)
                {
                    if(dataGetLeaveStatus.size() > 0)
                    {
                        %><script language='javascript'>
                            alert('The doctor is on leave. Please choose other doctor'); 
                            window.location= 'adminAppointmentUpdate.jsp?e38=<%=pmiNo%>&e39=<%=patientName%>&e40=<%=idNo%>&e41=<%=appDate%>&e42=<%=appTime%>&e43=<%=appDoc%>&e44=<%=disApp%>&e45=<%=subDisApp%>&e46=<%=appType%>';
                        </script> <%
                    }
                    else
                    {
                        String sqlValidateAppointment = "SELECT * "
                                            + "FROM pms_appointment "
                                            + "WHERE pmi_no = '"+pmiNo+"' AND hfc_cd = '"+dataHFCCode+"' AND appointment_date = '"+appDate+"'";
                        ArrayList<ArrayList<String>> dataGetAppointment  = Conn.getData(sqlValidateAppointment);

                        if(dataGetAppointment.size() > 0)
                        {
                            %><script language='javascript'>
                                alert('You are not edit anything'); 
                                window.location= 'adminAppointmentUpdate.jsp';
                            </script> <%     
                        }
                        else
                        {
                            RMIConnector rmic = new RMIConnector();
                            String sqlUpdate = "UPDATE pms_appointment "
                                        + "SET appointment_date='"+startDateTime+"',start_time='"+startDateTime+"',userid='"+dataUserID+"' "
                                        + "WHERE pmi_no='"+pmiNo+"' AND appointment_date='"+startDateTimeBefore+"' AND hfc_cd='"+dataHFCCode+"'";

                            boolean isUpdate = rmic.setQuerySQL("10.73.32.200", 1099, sqlUpdate);

                            %><script language='javascript'>
                                alert('Update an appointment is succesful'); 
                                window.location= 'adminAppointmentUpdate.jsp';
                            </script> <%
                        }
                    }
                }     
                else
                {
                    %><script language='javascript'>
                        alert('The doctor is not in their duty. Please choose other doctor'); 
                        window.location= 'adminAppointmentUpdate.jsp?e38=<%=pmiNo%>&e39=<%=patientName%>&e40=<%=idNo%>&e41=<%=appDate%>&e42=<%=appTime%>&e43=<%=appDoc%>&e44=<%=disApp%>&e45=<%=subDisApp%>&e46=<%=appType%>';
                    </script> <%
                }
            }
            else
            {
                %><script language='javascript'>
                    alert('The clinic is off. Please pick other date'); 
                    window.location= 'adminAppointmentUpdate.jsp?e38=<%=pmiNo%>&e39=<%=patientName%>&e40=<%=idNo%>&e41=<%=appDate%>&e42=<%=appTime%>&e43=<%=appDoc%>&e44=<%=disApp%>&e45=<%=subDisApp%>&e46=<%=appType%>';
                </script> <%
            }
        }
          
        
%>
