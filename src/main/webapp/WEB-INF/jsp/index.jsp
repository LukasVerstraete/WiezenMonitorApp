<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Home"/>
    </jsp:include>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
