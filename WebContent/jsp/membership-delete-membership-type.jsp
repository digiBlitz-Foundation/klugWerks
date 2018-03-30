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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmCreateMemb.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<%
String[] subType = (String[])session.getAttribute("displayEditMemDetails");

String membershipTypeId = "";
String membershipTypeName = "";
String membershipAmount = "";
String mDate = "";
String periodValue="";
String UserTypeID="";

if(subType!=null){
	membershipTypeId = subType[0];
	membershipTypeName = subType[1];
	UserTypeID = subType[2];   
	membershipAmount = subType[3];  
	mDate   = subType[4];
	periodValue = subType[5];
//	{membershipTypeId, membershipTypeName, membershipAmount, mDate, uTypeId};
}

%>

<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center"  height="350">



        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:groove;border-width:thin">
  <tr>
    <td class="tableCommonBg">
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="100%" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
  <tr style="border-bottom-style:groove;border-bottom-width:thin;">
    <td colspan="2" class="tblMainHead">
		Membership: <span class="styleBoldTwo">Delete Membership Type</span>	</td>
  </tr>
  <tr style="border-bottom-style:groove;border-bottom-width:thin;">
    <td colspan="2" class="tblDescrp"><strong>Delete Membership Type . </strong></td>
  </tr>
  <tr>
  	<td>
	
		<form name="frmCreateMembType" id="frmCreateMembType" method="post" action="./memberMaster.html" >
		<input type="hidden" name="memProcess" value="memTyDelete"/>
		<input type="hidden" value="<%=membershipTypeId%>" name="memId" />
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
				  <tr>
					<td colspan="2" class="tblRowHead">
						Delete Membership Type </td>
				  </tr>
				  <tr>
					  <td colspan="2">Fields marked with an asterisk (*) are required.</td>
		  </tr>
				  <tr>
					<td class="tableLeft">User Type:</td> 
					<td class="tableRight">
						<%
					
					String uTypeId = (String)request.getAttribute("uTypeId");
							Vector vUType = (Vector)session.getAttribute("displayUserTypeDetails");
							if(vUType!=null && vUType.size()!=0){
								Enumeration eUtype = vUType.elements();
								 //String [] userType = {ID, name };
								while(eUtype.hasMoreElements()){
									String[] strType = (String [])eUtype.nextElement();
									String uTypeID = strType[0];
									String uTypeName = strType[1];
									if(uTypeID.equals(UserTypeID)){
											%>
											<%=uTypeName%>
											<input type="hidden" name="uTypeId" value="<%=uTypeID%>" />
											<%
									}
								}
							}
							%>					  </td>
				  </tr>
				  <tr>
					<td class="tableLeft">Membership Type Name:</td>
					<td class="tableRight">
					<%=membershipTypeName%></td>
				  </tr>
				   <tr>
				     <td class="tableLeft">Membership Amount: </td>
				     <td class="tableRight">
					 <%=membershipAmount%></td>
		      </tr>
			 <tr>
				     <td class="tableLeft">Membership Priority: </td>
				     <td class="tableRight">
					 <%=periodValue%></td>
		      </tr>			  
				   <tr>
					<td class="tableLeft">&nbsp;</td>
					<td class="tableRight">
					<input name="Button" type="submit" class="gradBtn" value="Delete"  />&nbsp;
					<input type="button" value="cancel" class="gradBtn" onclick="javascript:history.back(-1);"  />					</td>
				  </tr>
			</table>
		</form>	</td>
  </tr>
  
  <tr>
    <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
  </tr>
</table>

			<!-- CONTENTS END HERE -->			</td>
		  </tr>
	  </table>	</td>
  </tr>
</table>
	  </td>
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
