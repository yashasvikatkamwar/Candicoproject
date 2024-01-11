<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="eror.jsp"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
