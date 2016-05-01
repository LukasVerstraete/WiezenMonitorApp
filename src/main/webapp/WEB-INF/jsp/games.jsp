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
                    <td>Game state</td>
                    <th>Players</th>
                    <th>#rounds</th>
                </tr>
                <c:forEach var="game" items="${games}">
                    <tr url="<c:url value="/games/${game.id}.htm"/>">
                        <td>${game.state}</td>
                        <td>
                            <table>
                                <c:forEach var="player" items="${game.players}">
                                    <tr>${player.username}</tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            ${game.rounds.size()}
                        </td>
                    </tr>
                    <tr></tr>
                </c:forEach>
                <tr>
                    <td colspan="3" style="padding:0;"><a href="<c:url value="/games/new.htm"/>" style="text-align: center; display: block;"><span class="glyphicon glyphicon-plus" style="height: 100%; width:100%; position:relative; margin: 20px;"></span></a></td>
                </tr>
            </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
