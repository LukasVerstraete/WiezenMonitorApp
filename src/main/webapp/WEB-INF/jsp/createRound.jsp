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
            <c:url var="createUrl" value="/games/createRound/${game.id}.htm"/>
            <form:form commandName="roundObject" action="${createUrl}" method="POST">
                <p class="form-group">
                    <label for="type" class="control-label">game type</label>
                    <form:select path="type" items="${gameTypes}"/>
                </p>
                <div class="form-group">
                    
                    <table class="table table-bordered">
                        <tr>
                            <th>players</th>
                            <th>opponents</th>
                        </tr>
                        <c:forEach var="player" items="${game.players}" varStatus="status">
                            <tr>
                                <td><div class="checkbox-inline"><form:checkbox path="players" value="${player.id}" label="${player.username}" onclick="CheckBoxes()"/></div></td>
                                <td><div class="checkbox-inline"><form:checkbox path="opponents" value="${player.id}" label="${player.username}" onclick="CheckBoxes()"/></div></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <p class="form-group">
                    <input type="submit" value="start round"/>
                </p>
            </form:form>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>