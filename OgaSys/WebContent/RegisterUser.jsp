<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::Registration::</title>
    </head>
    <body bgcolor="skyblue">
        <form action="Controller" method="get">
            <center>
            <br><br><br><br>
            <%
                String msg=(String)request.getAttribute("msg");
                if(msg!=null)
                    out.println("<b>"+msg+"</b>");
            %>
            
            <table border="1">
                <caption>Registration</caption>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="uname" value="Username.." onclick="this.value=''"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass" value="Password.." onclick="this.value=''"/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="cpass" value="confirm Password.." onclick="this.value=''"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Register"></td>
                    <td><input type="reset" value="Cancel"></td>
                </tr>
            </table>
            </center>
            <input type="hidden" name="action" value="register"/>
        </form>
    </body>
</html>