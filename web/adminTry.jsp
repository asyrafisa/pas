<%-- 
    Document   : admin
    Created on : Apr 2, 2016, 1:41:40 AM
    Author     : Asyraf
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<!DOCTYPE html>

<html>
<!--<style type="text/css">
	.bs-example
    {
		margin: 1%;
	}
</style>-->
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <body>
<!--    <div class="bs-example">-->
        <ul class="nav nav-pills">      <!--adjust at default.css (#tab)width & margin-top-->
            <li id="tab" class="active" ><a data-toggle="tab" class="editTab" href="#sectionA">Home</a></li>
            <li id="tab"><a data-toggle="tab" class="editTab" href="#sectionB">Maintain Clinic Day</a></li>
            <li id="tab"><a data-toggle="tab" class="editTab" href="#sectionB">Maintain Clinic Day</a></li>
            <li id="tab"><a data-toggle="tab" class="editTab" href="#sectionC">Maintain Roster</a></li>
            <li id="tab"><a data-toggle="tab" class="editTab" href="#sectionD">Maintain Leave</a></li>
        </ul>
    <div class="tab-content" style="background-color: red">
        <div id="sectionA" class="tab-pane active">
            <h3>Section A</h3>
            <p>Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui. Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
        </div>
        <div id="sectionB" class="tab-pane fade">
            <h3>Section B</h3>
            <p>Vestibulum nec erat eu nulla rhoncus fringilla ut non neque. Vivamus nibh urna, ornare id gravida ut, mollis a magna. Aliquam porttitor condimentum nisi, eu viverra ipsum porta ut. Nam hendrerit bibendum turpis, sed molestie mi fermentum id. Aenean volutpat velit sem. Sed consequat ante in rutrum convallis. Nunc facilisis leo at faucibus adipiscing.</p>
        </div>
        <div id="sectionC" class="tab-pane fade">
            <h3>Section C</h3>
            <p>WInteger convallis, nulla in sollicitudin placerat, ligula enim auctor lectus, in mollis diam dolor at lorem. Sed bibendum nibh sit amet dictum feugiat. Vivamus arcu sem, cursus a feugiat ut, iaculis at erat. Donec vehicula at ligula vitae venenatis. Sed nunc nulla, vehicula non porttitor in, pharetra et dolor. Fusce nec velit velit. Pellentesque consectetur eros.</p>
        </div>
        <div id="sectionD" class="tab-pane fade">
            <h3>Section D</h3>
            <p>Donec vel placerat quam, ut euismod risus. Sed a mi suscipit, elementum sem a, hendrerit velit. Donec at erat magna. Sed dignissim orci nec eleifend egestas. Donec eget mi consequat massa vestibulum laoreet. Mauris et ultrices nulla, malesuada volutpat ante. Fusce ut orci lorem. Donec molestie libero in tempus imperdiet. Cum sociis natoque penatibus et magnis.</p>
        </div>
    </div>
<!--</div>-->
    </body>
</html>
