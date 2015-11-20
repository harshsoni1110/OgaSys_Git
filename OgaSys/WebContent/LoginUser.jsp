<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>::Login::</title>
    </head>
    <body bgcolor="skyblue">
        <form method="get" action="Controller">
            <center>
                <br><br><br>
<%
String loginfail=(String)request.getAttribute("loginfail");
if(loginfail!=null)
{
    out.println(loginfail);
}

String msg=(String)request.getAttribute("regmsg");
if(msg!=null){
    out.println(msg);
}

%>
                <table border="2" bordercolor="green">
                    <caption>Admin Login</caption>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="uname" value="username" onclick="this.value=''"></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pwd" value="password" onclick="this.value=''"></td>
                    </tr>
                    <tr>
                    <a href="LoginUser.jsp"></a>
                        <td>
                            <input type="submit" value="Login" name="Submit">
                        </td>
                        <td>
                            <input type="reset" value="Cancel" name="Cancel">
                        </td>
                    </tr>
                    <tr>
                       <td colspan="2"><a href="RegisterUser.jsp">Get Registerd!</a>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="action" value="loginvalidate"/>
            </center>
        </form>
    </body>
</html>