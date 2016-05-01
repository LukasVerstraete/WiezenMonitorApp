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
            <div id="dialog" title="enter player name type">
                <form method="POST" action="<c:url value="/add/${game.id}.htm"/>">
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
                <c:forEach var="player" items="${players}">
                    <tr>
                        <td><c:out value="${player.username}"/></td>
                        <td><c:out value="${player.name}"/></td>
                        <td><c:out value="${player.familyName}"/></td>
                        <td>
                            <a href="<c:url value="/players/${player.id}.htm"/>"><span class="glyphicon glyphicon-pencil"></span></a>
                        </td>
                        <td>
                            <form method="POST" action="<c:url value="/players/delete/${player.id}.htm"/>">
                                <button type="submit"><span class=" glyphicon glyphicon-trash"></span></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${game.players.size() >= 4}">    
                    <tr>
                        <td colspan="${game.players.size() + 1}" style="padding:0;"><a href="<c:url value="/players/new.htm"/>" style="text-align: center; display: block;"><h4>NEW ROUND</h4></a></td>
                    </tr>
                </c:if>
            </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
