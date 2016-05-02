<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Home"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <form:form commandName="roundObject" action="/games/createRound.htm" method="POST">
                <form:checkboxes items="${game.players}" path="players" itemLabel="username" itemValue="id"/>
            </form:form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>