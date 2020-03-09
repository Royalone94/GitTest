<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login to Registration Search</title>
</head>
<body>
<div class="container-fluid">
    <div class="hide">this-is-a-message-for-recognizing-login-page</div>
    <div class="row top-left">
        <div class="col">
            <img src="resources/images/logo-medarcus.png" alt="">
        </div>
    </div>
    <div class="row centered">
        <div class="login-box">
            <c:if test="${not empty loginError}">
                <div class="d-inline-flex flex-row alert-error">
                    <div><i class="fas fa-exclamation-circle"></i></div>
                    <div class="ml-1">
                        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                    </div>
                </div>
            </c:if>
            <form id="log-in-form" class="form-signin" method="POST" action="<c:url value='/authenticate' />">
                <label for="username" class="sr-only">User ID</label>
                <input id="username" name="username" class="form-control" placeholder="User ID"
                       type="text" path="login" value=""
                       size="35" maxlength="255" Class="orm-control"/>
                <label for="password" class="sr-only">Password</label>
                <input id="password" name="password" class="form-control" path="password"
                       placeholder="Password" type="password"
                       value="" size="35" class="form-control"/>
                <button class="btn btn-md btn-primary btn-block" type="submit">Sign in</button>

            </form>
        </div>
    </div>
    <div class="row bottom-right">
        <div class="col">
            <img src="resources/images/logo-surepatient-search.png" alt="">
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#username').focus();
    });
</script>
</body>
</html>