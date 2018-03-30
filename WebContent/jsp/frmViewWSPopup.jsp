<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
 
 <script language="javascript">

//window.onload=call();

function selfClose(name,id) {
refreshProductList(name,id);
self.close();
}



function refreshProductList(name,id){
	var val=document.getElementById("reqVal").value;
	window.opener.document.frmWSArti.name.value=name;
	window.opener.document.frmWSArti.drop.value=val;
	window.opener.document.frmWSArti.id.value=id;

	window.opener.document.frmWSArti.submit();
}
 
 function call(){

	document.frmDrop.submit();
	window.close();
		
	       }


	 </script>
</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	
	  <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="100" style="border:thin;border-style:groove;">
        <tr>
          <td valign="top" class="tableCommonBg">
		  
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr>
                <td>&nbsp;<strong>
                  <%String name=(String)request.getAttribute("name");
 String artId=(String)request.getAttribute("artId");

%>
                </strong>
                    <form action="SysMgmt.do" method="post" name="frmDrop" id="frmDrop">
                      <table width="100%" >
                        <tr>
                          <td width="33%"> &emsp;Process Name : </td>
                          <td width="67%"><%=name%></td>
                        </tr>
                        <tr>
                          <td> &emsp;Select LifeCycle: </td>
                          <td><select name="reqVal" id="reqVal" class="selectboxOne">
                              <option value="high">High</option>
                              <option value="medium">Medium</option>
                              <option value="low">Low</option>
                            </select>                          </td>
                        </tr>
                      </table>
                      </br>
                      </br>
                      </br>
                      <table width="100%" >
                        <tr>
						<td align="center">
                          <input name="button" type="button" onclick="selfClose('<%=name%>','<%=artId%>')" value="OK"  align="middle"/>                        </td>
						</tr>
                      </table>
                  </form></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
   

    </tr>
    	<tr><td>&nbsp;</td></tr>

  </table>
<!--=======footer=================================-->
 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>

</body>


</html>
