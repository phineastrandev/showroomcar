<%-- 
    Document   : uploadSucceed
    Created on : Mar 4, 2021, 2:33:25 PM
    Author     : tranp
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Upload Successful</title>
        <s:head />
    </head>
    <body>
        <h2>
            Vi du File Upload trong Struts 2
        </h2>
        User Image: <s:property value="userImage" /><br/>
        Content Type:<s:property value="userImageContentType" /><br/>
        File Name:  <s:property value="userImageFileName" /><br/>
        Uploaded Image: <img src="userimages/${userImageFileName}"/>
    </body>
</html>

