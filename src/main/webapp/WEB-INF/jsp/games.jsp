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
            <table class="table table-hover table-striped table-responsive">
                <tr>
                    <th>Game state</th>
                    <th>Players</th>
                    <th>#rounds</th>
                    <th></th>
                </tr>
                <c:forEach var="game" items="${games}">
                    <tr >
                        <td url="<c:url value="/games/${game.id}.htm"/>">${game.state}</td>
                        <td url="<c:url value="/games/${game.id}.htm"/>">
                            <table>
                                <c:forEach var="player" items="${game.players}">
                                    <tr><td>${player.username}</td></tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td url="<c:url value="/games/${game.id}.htm"/>">
                            ${game.rounds.size()}
                        </td>
                        <td>
                            <form method="POST" action="<c:url value="/games/delete/${game.id}.htm"/>">
                                <button type="submit"><span class=" glyphicon glyphicon-trash"></span></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" style="padding:0;"><a href="<c:url value="/games/new.htm"/>" style="text-align: center; display: block;"><span class="glyphicon glyphicon-plus" style="height: 100%; width:100%; position:relative; margin: 20px;"></span></a></td>
                </tr>
            </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
