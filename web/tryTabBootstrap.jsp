<%-- 
    Document   : tabBootstrap1
    Created on : Apr 2, 2016, 3:32:20 AM
    Author     : Asyraf
--%>

<html>
    <title>Tab Bootstrap</title>
    <%@include file="header.jsp"%>
<body>
<style type="text/css">
#accountForm {
    margin-top: 15px;
}
</style>
<div class="container-fluid">
<ul class="nav nav-tabs">
    <li class="active"><a href="#info-tab" data-toggle="tab">Information <i class="fa"></i></a></li>
    <li><a href="#address-tab" data-toggle="tab">Address <i class="fa"></i></a></li>
</ul>

<form id="accountForm" method="post" class="form-horizontal">
    <div class="tab-content">
        <div class="tab-pane active" id="info-tab">
            <div class="form-group">
                <label class="col-xs-3 control-label">Full name</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="fullName" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Company</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="company" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Job title</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="jobTitle" />
                </div>
            </div>
        </div>

        <div class="tab-pane" id="address-tab">
            <div class="form-group">
                <label class="col-xs-3 control-label">Address</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="address" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Date</label>
                <div class="col-xs-5">
                    <input type="date" class="form-control" name="city" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-3 control-label">Country</label>
                <div class="col-xs-5">
                    <select class="form-control" name="country">
                        <option value="">Select a country</option>
                        <option value="FR">France</option>
                        <option value="DE">Germany</option>
                        <option value="IT">Italy</option>
                        <option value="JP">Japan</option>
                        <option value="RU">Russian</option>
                        <option value="US">United State</option>
                        <option value="GB">United Kingdom</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <div class="form-group" style="margin-top: 15px;">
        <div class="col-xs-5 col-xs-offset-3">
            <button type="submit" class="btn btn-default">Validate</button>
        </div>
    </div>
</form>
</div>
</body>
</html>
