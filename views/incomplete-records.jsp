<%--
  Created by IntelliJ IDEA.
  User: VinhNguyen / copied from medical-records
  Date: 7/16/2018
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>${pageTitle}</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/vendor/datatables.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/vendor/buttons.datatables.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/vendor/daterangepicker.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/vendor/responsive.dataTables.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/medical-patients.css?v=${appConfig.version}"/>">
    <style>
        .dataTables_wrapper .dt-buttons {
            float:none;
            text-align:center;
        }
    </style>
    <script type="text/javascript" src="<c:url value="/resources/js/vendor/moment.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/vendor/datatables.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/vendor/dataTables.responsive.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/vendor/daterangepicker.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/patient-utilities.js?v=${appConfig.version}"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/medical-patients.js?v=${appConfig.version}"/>"></script>

    <script type="text/javascript" src="<c:url value="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"/>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            medicalPatients.initMedicalPatientsScreen('${pathStatus}');
        });
    </script>
</head>
<body>
<main role="main">
    <div class="card medical-patients-filter-container">
        <h5 class="card-header cursor-pointer" class="d-block medical-patients-filter-header"
            onclick="medicalPatients.toggleSearchForm(this);">
            <i class="fab fa-searchengin"></i><strong>&nbsp;Filter</strong>
            <span class="float-right"><i class="fa fa-chevron-up toggle-status-icon"></i></span>
        </h5>
        <div class="medical-patients-filter-body">
            <form id="medical-patients-filter-form" action="#">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">FIRST NAME</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_first_name" name="exactly_first_name" class="custom-control-input">
                                <label class="custom-control-label" for="exactly_first_name">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fa fa-user"></i></span>
                            </span>
                                <input type="text" name="firstName" id="first_name" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">MIDDLE NAME</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_middle_name" name="exactly_middle_name" class="custom-control-input">
                                <label class="custom-control-label" for="exactly_middle_name">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fa fa-user"></i></span>
                            </span>
                                <input type="text" name="middleName" id="middle_name" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">LAST NAME</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_last_name" name="exactly_last_name"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="exactly_last_name">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fa fa-user"></i></span>
                            </span>
                                <input type="text" name="lastName" id="last_name" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">MAIDEN NAME</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_maiden_name" name="exactly_maiden_name"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="exactly_maiden_name">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fa fa-user"></i></span>
                            </span>
                                <input type="text" name="maidenName" id="maiden_name" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">ADDRESS</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_address" name="exactly_address" class="custom-control-input">
                                <label class="custom-control-label" for="exactly_address">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-map-marker-alt"></i></span>
                            </span>
                                <input type="text" name="address" id="address" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">CITY</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_city" name="exactly_city"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="exactly_city">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-university"></i></span>
                            </span>
                                <input type="text" name="city" id="city" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">STATE</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_state" name="exactly_state"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="exactly_state">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-dot-circle"></i></span>
                            </span>
                                <input type="text" name="state" id="state" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <label class="control-label">ZIP CODE</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_zipcode" name="exactly_zipcode"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="exactly_zipcode">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-location-arrow"></i></span>
                            </span>
                                <input type="text" name="zip_code" id="zip_code" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-sm-4 col-12">
                            <label class="control-label">MRN</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_mrn" name="exactly_mrn" class="custom-control-input">
                                <label class="custom-control-label" for="exactly_mrn">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-notes-medical"></i></span>
                            </span>
                                <input type="text" name="mrn" id="mrn" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 col-12">
                            <label class="control-label">SSN</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_ssn" name="exactly_ssn" class="custom-control-input">
                                <label class="custom-control-label" for="exactly_ssn">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-id-card"></i></span>
                            </span>
                                <input type="text" name="ssn" id="ssn" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 col-12">
                            <label class="control-label">PHONE</label>
                            <div class="custom-control custom-checkbox float-right">
                                <input type="checkbox" id="exactly_phone" name="exactly_phone" class="custom-control-input">
                                <label class="custom-control-label" for="exactly_phone">Exactly</label>
                            </div>
                            <div class="input-group">
                            <span class="input-group-prepend">
                                <span class="input-group-text bg-transparent"><i class="fas fa-phone"></i></span>
                            </span>
                                <input type="text" name="phone" id="phone_number" class="form-control py-2 border-left-0 border" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 col-12">
                            <label class="control-label">LAST VISIT DATE</label>
                            <div class="input-group">
                            <span class="input-group-prepend last-visit-date">
                                <span class="input-group-text bg-transparent"><i class="fas fa-calendar-alt"></i></span>
                            </span>
                                <input type="text" id="lastVisitDate" name="lastVisitDate" class="form-control py-2 border-left-0 border filter-date-range-picker" placeholder="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 col-12">
                            <label class="control-label">DATE CREATED</label>
                            <div class="input-group">
                            <span class="input-group-prepend created-date">
                                <span class="input-group-text bg-transparent"><i class="fas fa-calendar-alt"></i></span>
                            </span>
                                <input type="text" id="createdDate" name="createdDate" class="form-control py-2 border-left-0 border filter-date-range-picker" placeholder="">
                            </div>
                        </div>

                        <div class="col-lg-2 col-sm-4 col-12">
                            <label class="control-label">DATE OF BIRTH</label>
                            <div class="input-group">
                                <span class="input-group-prepend created-date">
                                    <span class="input-group-text bg-transparent"><i class="fas fa-calendar-alt"></i></span>
                                </span>
                                <input type="text" id="dateOfBirth" name="dateOfBirth" class="form-control py-2 border-left-0 border filter-date-picker" placeholder="">
                            </div>
                        </div>

                    </div>
                    <div class="row btn-cta">
                        <div class="col-12 text-right">
                            <button class="btn btn-outline-secondary" type="reset">
                                <i class="fas fa-times"></i>&nbsp;&nbsp;Clear
                            </button>
                            <button class="btn btn-outline-secondary" type="button" onclick="medicalPatients.initDataTableMedicalPatients();">
                                <i class="fas fa-search"></i>&nbsp;&nbsp;Search
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="mt-5 columns-toggle-container hide">
        <div class="row">
            <div class="col-lg-12 text-right">
                <div class="btn-group">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-th-list"></span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right columns-setting">
                        <label class="dropdown-item" for="column-mrn"><input type="checkbox" data-column="1" id="column-mrn" name="column-mrn" />&nbsp;MRN</label>
                        <label class="dropdown-item" for="column-patient-name"><input type="checkbox" data-column="2" id="column-patient-name" name="column-patient-name" />&nbsp;Patient Name</label>
                        <label class="dropdown-item" for="column-maiden-name"><input type="checkbox" data-column="3" id="column-maiden-name" name="column-maiden-name" />&nbsp;Maiden Name</label>
                        <label class="dropdown-item" for="column-other-name"><input type="checkbox" data-column="4" id="column-other-name" name="column-other-name" />&nbsp;Other Name</label>
                        <label class="dropdown-item" for="column-ssn"><input type="checkbox" data-column="5" id="column-ssn" name="column-ssn" />&nbsp;SSN</label>
                        <label class="dropdown-item" for="column-dob"><input type="checkbox" data-column="6" id="column-dob" name="column-dob" />&nbsp;DOB</label>
                        <label class="dropdown-item" for="column-gender"><input type="checkbox" data-column="7" id="column-gender" name="column-gender" />&nbsp;Gender</label>
                        <label class="dropdown-item" for="column-phone"><input type="checkbox" data-column="8" id="column-phone" name="column-phone" />&nbsp;Phone</label>
                        <label class="dropdown-item" for="column-address"><input type="checkbox" data-column="9" id="column-address" name="column-address" />&nbsp;Address</label>
                        <label class="dropdown-item" for="column-city"><input type="checkbox" data-column="10" id="column-city" name="column-city" />&nbsp;City</label>
                        <label class="dropdown-item" for="column-state"><input type="checkbox" data-column="11" id="column-state" name="column-state" />&nbsp;State</label>
                        <label class="dropdown-item" for="column-zip-code"><input type="checkbox" data-column="12" id="column-zip-code" name="column-zip-code" />&nbsp;Zip Code</label>
                        <label class="dropdown-item" for="column-last-visit"><input type="checkbox" data-column="13" id="column-last-visit" name="column-last-visit"/>&nbsp;Last Visit</label>
                        <label class="dropdown-item" for="column-last-update"><input type="checkbox" data-column="14" id="column-last-update" name="column-last-update"/>&nbsp;Last Updated</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="medical-patients-data-container">
        <table id="medical-patients-data" class="table table-striped table-bordered table-sm mpi-data-table display nowrap hide">
            <thead>
            <tr>
                <th class="controls-expand"></th>
                <th title="Click to sort" data-toggle="tooltip">MRN</th>
                <th title="Click to sort" data-toggle="tooltip">Patient name</th>
                <th title="Click to sort" data-toggle="tooltip">Maiden name</th>
                <th title="Click to sort" data-toggle="tooltip">Other name</th>
                <th title="Click to sort" data-toggle="tooltip">SSN</th>
                <th title="Click to sort" data-toggle="tooltip">DOB</th>
                <th title="Click to sort" data-toggle="tooltip">Gender</th>
                <th title="Click to sort" data-toggle="tooltip">Phone</th>
                <th title="Click to sort" data-toggle="tooltip">Address</th>
                <th title="Click to sort" data-toggle="tooltip">City</th>
                <th title="Click to sort" data-toggle="tooltip">State</th>
                <th title="Click to sort" data-toggle="tooltip">Zip code</th>
                <th title="Click to sort" data-toggle="tooltip">Last visit</th>
                <th title="Click to sort" data-toggle="tooltip">Last updated</th>
            </tr>
            </thead>
        </table>
    </div>
</main>

<div id="medical-patients-tooltip">
    <div class="tooltip medical-patients-tooltip" role="tooltip">
        <div class="tooltip-inner">Click to view Medical Record</div>
    </div>
</div>

<div class="row view-demographics-details demographics-placeholder hide">
    <div class="col-3">
        <div class="card">
            <div class="card-header">Details</div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Ethnicity:&nbsp;</b><span class="patient-ethnicity"></span></li>
                    <li class="list-group-item"><b>Religion:&nbsp;</b><span class="patient-religion"></span></li>
                    <li class="list-group-item"><b>Language:&nbsp;</b><span class="patient-language"></span></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-3">
        <div class="card">
            <div class="card-header">Guarantor</div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Name:&nbsp;</b><span class="guarantor-name1"></span></li>
                    <li class="list-group-item"><b>Employer:&nbsp;</b><span class="guarantor-employer"></span></li>
                    <li class="list-group-item">&nbsp;</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-3">
        <div class="card">
            <div class="card-header">Next of Kin</div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Name:&nbsp;</b><span class="nok-name"></span></li>
                    <li class="list-group-item"><b>Relationship:&nbsp;</b><span class="nok-relationship"></span></li>
                    <li class="list-group-item"><b>Phone:&nbsp;</b><span class="nok-phone"></span></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%--<jsp:include page="/resources/js/common/patient-details-dialog.jsp"/>--%>
<div class="popover-content-search-patient hide">
    <p>The Search feature in SurePatient allows the user to search and view records from the entire SurePatient database, not just records that are included in a Matchset.</p>
    <p>A user may search for records on the Search page by entering search terms in any of the displayed fields.</p>
    <p>Filter Records </p>
    <ul>
        <li>User can filter records by all fields available or by specific fields</li>
        <li>User can filter by a single digit or character for a wide range of results or narrow the results by including specific information</li>
    </ul>
    <p>If you would like a specific result you may check exact if you want to search by an exact match of data entered</p>
    <ul>
        <li>Leaving this box unchecked will provide greater results but by a wider range</li>
        <li>Checking this box will narrow the search to exact matches only</li>
        <li>Double – Clicking of any row will expand demographics for fields that are not viewable from the list view</li>
        <li>User can display expanded demographics for multiple rows</li>
    </ul>
</div>
</body>
</html>
