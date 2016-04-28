<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="games overview"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <table class="table table-hover table-striped">
                <tr>
                    <th>Players</th>
                    <th>#rounds</th>
                </tr>
                <c:forEach var="game" items="${games}">
                    <tr>
                        <table>
                            <c:forEach var="player" items="${game.players}">
                                <tr>${player.username}</tr>
                            </c:forEach>
                        </table>
                        <td>
                            ${game.rounds.size}
                        </td>
                    </tr>
                </c:forEach>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
