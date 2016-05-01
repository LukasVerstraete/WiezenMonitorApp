<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="new player"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <form:form commandName="player" method="POST" action="create.htm">
                <p class="form-group">
                    <label class="control-label" for="username">username</label>
                    <form:input id="username" path="username"/>
                    <form:errors path="username"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="name">firstname</label>
                    <form:input id="name" path="name"/>
                    <form:errors path="name"/>
                </p>
                <p class="form-group">
                    <label class="control-label" for="family-name">lastname</label>
                    <form:input id="family-name" path="familyName"/>
                    <form:errors path="familyName" element="span"/>
                </p>
                <p>
                    <label for="save" class="glyphicon glyphicon-floppy-disk"></label>
                    <input id="save" type="submit" value="save"/>
                </p>
            </form:form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
