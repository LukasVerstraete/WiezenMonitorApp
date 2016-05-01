<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="player overview"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <table class="table table-hover table-striped">
                <tr>
                    <th>username</th>
                    <th>name</th>
                    <th>family name</th>
                    <th></th>
                    <th></th>
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
                <tr>
                    <td colspan="5" style="padding:0;"><a href="<c:url value="/players/new.htm"/>" style="text-align: center; display: block;"><span class="glyphicon glyphicon-plus" style="height: 100%; width:100%; position: relative; margin: 20px;"></span></a></td>
                </tr>
            </table>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
