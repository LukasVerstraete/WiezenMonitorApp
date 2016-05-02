<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="game ${game.id}"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div id="dialog" title="enter player name type" style="display: none;">
                <form method="POST" action="<c:url value="/games/add/${game.id}.htm"/>">
                <input type="text" name="name"/>
                <input type="submit" value="add"/>
            </div>
            <table class="table table-hover table-striped">
                <tr>
                    <c:forEach var="player" items="${game.players}">
                        <th>${player.username}</th>
                    </c:forEach>
                        <th onclick="OpenDialog()"><span class="glyphicon glyphicon-plus"></span></th>
                </tr>
                
                <c:forEach var="round" items="${game.rounds}">
                    
                </c:forEach>
                
                <c:if test="${game.players.size() >= 4}">    
                    <tr>
                        <c:forEach var="player" items="${game.players}">
                            <th><c:out value="${player.score.points}"/></th>
                        </c:forEach>
                        <th></th>
                    </tr>
                    <tr>
                        <td colspan="${game.players.size() + 1}" style="padding:0;"><a href="<c:url value="/games/newRound/${game.id}.htm"/>" style="text-align: center; display: block;"><h4>NEW ROUND</h4></a></td>
                    </tr>
                </c:if>
            </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
