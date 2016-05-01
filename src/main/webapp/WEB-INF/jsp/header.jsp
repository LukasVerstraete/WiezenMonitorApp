<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                
                <a href="<c:url value="/index.htm"/>" class="navbar-brand header-img"><img src="<c:url value="/images/Wiezen_ico.png"/>"/></a>
            </div>    
            <ol class="nav navbar-nav pull-right">
                <li><a class="green-border" href="<c:url value="/games.htm"/>">Games</a></li>
                <li><a class="green-border" href="<c:url value="/players.htm"/>">Players</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
                <li class="green-filler"></li>
            </ol>
        </div>
    </nav>
</header>