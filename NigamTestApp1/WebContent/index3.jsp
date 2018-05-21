



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

	<!-- Start: Added by Nigam -->
      <FONT size = 3 COLOR="#0000FF">
        <h3> Server Info: </h3>
        Serving from: <FONT COLOR="red"> <%=java.net.InetAddress.getLocalHost()%></FONT> 
        WebServer/Loadbalancer Name: <FONT COLOR="black"><%=request.getServerName()%>:<%=request.getServerPort()%><br></FONT>        
      </FONT>
    <!-- End: Added by Nigam -->
                
    </body>
</html>
