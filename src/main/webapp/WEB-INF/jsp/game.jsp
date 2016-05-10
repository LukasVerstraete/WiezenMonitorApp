<%@page import="com.lukas.verstraete.wiezendomain.domain.Round"%>
<%@page import="com.lukas.verstraete.wiezendomain.domain.Player"%>
<%@page import="com.lukas.verstraete.wiezendomain.domain.Game"%>
<%@page import="com.lukas.verstraete.wiezendomain.domain.Score"%>
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
            <table class="table table-hover table-striped table-bordered">
                <tr>
                    <c:forEach var="player" items="${game.players}">
                        <th>${player.username}</th>
                    </c:forEach>
                        <th onclick="OpenDialog()"><span class="glyphicon glyphicon-plus"></span></th>
                </tr>
                
                <c:forEach var="round" items="${game.rounds}">
                    <tr>
                        <c:forEach var="player" items="${game.players}">
                            <%
                                Player player = (Player)pageContext.findAttribute("player");
                                Round round = (Round)pageContext.findAttribute("round");
                                Score score = round.getScores().get(player);
                                pageContext.setAttribute("score", score);
                            %>
                            <td><c:out value="${score.points}"/></td>
                        </c:forEach>
                            <td>
                                <form method="POST" action="<c:url value="/games/delete/${game.id}/${round.id}.htm"/>">
                                    <button type="submit"><span class=" glyphicon glyphicon-trash"></span></button>
                                </form>
                            </td>
                    </tr>
                </c:forEach>
                <c:if test="${game.currentRound != null}">
                <tr>
                    <c:forEach var="player" items="${game.players}">
                        <td>0</td>
                    </c:forEach>
                    <c:url var="endRoundUrl" value="/games/endRound/${game.id}.htm"/>
                    <td>
                        <form method="GET" action="#"></form>
                        <div>
                        <form method="POST" action="<c:url value="/games/endRound/${game.id}.htm"/>">
                            <div class="form-group">
                                <label for="wins">#hits</label>
                                <input type="number" class="form-control" id="wins" name="wins" min="0" max="13"/>
                            </div>
                            <input type="submit" value="end round" class="btn"/>
                        </form>
                        </div>
                    </td>
                </tr>
                </c:if>
                
                <%
                    pageContext.setAttribute("state", Game.GameState.FINISHED);
                %>
                <tr>
                    <c:forEach var="player" items="${game.players}">
                        <th><c:out value="${player.score.points}"/></th>
                    </c:forEach>
                    <th>
                        <c:if test="${game.state != state}">
                            <a href="<c:url value="/games/endGame/${game.id}.htm"/>" style="text-align: center; display: block;"><h4>END GAME</h4></a>
                        </c:if>
                    </th>
                </tr>
                <c:if test="${game.players.size() >= 4 && game.state != state}">    
                    <tr>
                        <td colspan="${game.players.size() + 1}" style="padding:0;"><a href="<c:url value="/games/newRound/${game.id}.htm"/>" style="text-align: center; display: block;"><h4>NEW ROUND</h4></a></td>
                    </tr>
                </c:if>
            </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
