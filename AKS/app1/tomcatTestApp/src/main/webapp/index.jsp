<%@page import="typik.aks.app.tomcat.test.TestResources"%>
<HTML>
    <HEAD>
        <TITLE>Using Buttons</TITLE>
    </HEAD>

    <BODY>
        <% 
        	String command = request.getParameter("command");
			if ( command != null ){
        %>
            	Last command:<%=command%>
        <%
	        	switch(command){
	        	case "addMemory" : TestResources.addMemoryUsage(); break;
	        	case "addCpu"    : TestResources.addCpuUsage(); break;
	        	case "freeMemory": TestResources.freeMemory(); break;
	        	case "freeCpu"   : TestResources.freeCpu(); break;
	        	}
			}
        %>

        <FORM NAME="form1" METHOD="POST">        
            <INPUT TYPE="HIDDEN" NAME="command">
        <TABLE>
            <TR><TD><INPUT TYPE="BUTTON" VALUE="Add memory usage" ONCLICK="handleClick('addMemory')"></TD></TR>
            <TR><TD><INPUT TYPE="BUTTON" VALUE="Add cpu usage" ONCLICK="handleClick('addCpu')"></TD></TR>
            <TR><TD><INPUT TYPE="BUTTON" VALUE="free memory" ONCLICK="handleClick('freeMemory')"></TD></TR>
            <TR><TD><INPUT TYPE="BUTTON" VALUE="free cpu" ONCLICK="handleClick('freeCpu')"></TD></TR>
        </TABLE>
        </FORM>

        <SCRIPT LANGUAGE="JavaScript">
            function handleClick(val)
            {
                document.form1.command.value = val
                form1.submit()
            }
        </SCRIPT>
    </BODY>
</HTML>
