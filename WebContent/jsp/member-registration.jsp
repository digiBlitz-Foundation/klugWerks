#-------------------------------------------------------------------------------
# * Copyright: 2019 digiBlitz Foundation
#  * 
#  * License: digiBlitz Public License 1.0 (DPL) 
#  * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
#  * 
#  * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
#  * 
#  * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
#  * 
#  * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
#-------------------------------------------------------------------------------
<!---
Copyright: 2019 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcform.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/frmMembRegValidate.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script type="text/javascript">
function hideRegiOpt(){
	document.getElementById('regiOption').style.display="none";
	document.getElementById('regiSect').value=1;
}

function hideSubPubli(){
	document.getElementById('subscriberPubli').style.display="none";
	document.frmMembRegi.subsMailExist.value=0;
}
function fillFamId(){
	if(document.frmMembRegi.regiOpt[0].checked==true){
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		document.getElementById('regiAct').value="Active";
	}
	else if(document.frmMembRegi.regiOpt[1].checked==true){
		var futurefamId = document.getElementById('currentfamId').value;
		var futurefamAmt = document.getElementById('currntAddAmt').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
	}
}
function fillDropDown(){
	if(document.frmMembRegi.regiOpt[0].checked==true){
		document.getElementById('regiOpt').value = "nxtYr";
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		document.getElementById('regiAct').value="Active";
		var membType = document.getElementById('membTypes').value;
		
		var d = new Date();
		var curr_year = d.getFullYear();
		var curr_month = d.getMonth();		
		
		retrieveURL(membType,curr_year+1);
		document.getElementById('regiYear').value = curr_year+1;
	}
	else if(document.frmMembRegi.regiOpt[1].checked==true){
			document.getElementById('regiOpt').value = "curntYr";
			var futurefamId = document.getElementById('currentfamId').value;
			var futurefamAmt = document.getElementById('currntAddAmt').value;

			document.getElementById('famembId').value=futurefamId;
			document.getElementById('addOnAmount').value=futurefamAmt;
			var membType = document.getElementById('membTypes').value;

			var d = new Date();
			var curr_year = d.getFullYear();
			var curr_month = d.getMonth();
				
			retrieveURL(membType,curr_year);
			document.getElementById('regiYear').value = curr_year;
	}
	else{

		var futurefamId = document.getElementById('currentfamId').value;
		var futurefamAmt = document.getElementById('currntAddAmt').value;

		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		var membType = document.getElementById('membTypes').value;
		
		var d = new Date();
		var curr_year = d.getFullYear();
		var curr_month = d.getMonth();
		
		retrieveURL(membType,curr_year);
		document.getElementById('regiYear').value = curr_year;
		document.frmMembRegi.regiOpt[1].checked=false;
		document.frmMembRegi.regiOpt[0].checked=false;		
	}
}
function fillIdAmount(){
	var d = new Date();
	var curr_year = d.getFullYear();
	var curr_month = d.getMonth();
	var membType = document.getElementById('membTypes').value;

	if(curr_month==11){
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		document.getElementById('regiAct').value="Active";

		document.getElementById('regiOption').style.display="none";
		document.getElementById('regiSect').value=1;
		retrieveURL(membType,curr_year+1);
		document.getElementById('regiYear').value = curr_year+1;
	}
	else{
		if(curr_month>=9 && curr_month<=11){
			if(membType!="Life Member" && membType!="Subscribing Member"){
				document.getElementById('regiOption').style.display="block";
				document.getElementById('regiSect').value=0;
				retrieveURL(membType,curr_year);
				document.frmMembRegi.regiOpt[1].checked=false;
				document.frmMembRegi.regiOpt[0].checked=false;

				document.frmMembRegi.amount_txt.value = 0;
				clearMemAmt();
			}
			else{
				document.getElementById('regiOption').style.display="none";
				document.getElementById('regiSect').value=1;

				var futurefamId = document.getElementById('currentfamId').value;
				var futurefamAmt = document.getElementById('currntAddAmt').value;
	
				document.getElementById('famembId').value=futurefamId;
				document.getElementById('addOnAmount').value=futurefamAmt;
				retrieveURL(membType,curr_year);
				document.getElementById('regiYear').value = curr_year;
			}
		}
		else{
			document.getElementById('regiOption').style.display="none";
			document.getElementById('regiSect').value=1;

			var futurefamId = document.getElementById('currentfamId').value;
			var futurefamAmt = document.getElementById('currntAddAmt').value;

			document.getElementById('famembId').value=futurefamId;
			document.getElementById('addOnAmount').value=futurefamAmt;

			retrieveURL(membType,curr_year);
			document.getElementById('regiYear').value = curr_year;
		}
	}
   //parseandFillAmt();
}

var req;
function retrieveURL(membType,year)
{
	url = "RenewMembTypAjax.html?method=memberTypeIdandAmt&membType="+membType+"&year="+year;
//	alert(' URL is '+url);
	if (window.XMLHttpRequest) {
           req = new XMLHttpRequest();
		   
       } else if (window.ActiveXObject) {
           req = new ActiveXObject("Microsoft.XMLHTTP");
       }
       
       req.onreadystatechange = displayTypeChange;
	   
       req.open("GET", url, true);
       req.send(null);
    }
		
function displayTypeChange() {
	if (req.readyState == 4) { // Complete
		if (req.status == 200) { // OK response  
			var arnameXML = req.responseXML.getElementsByTagName("membValue")[0]; 
			var arnameText = arnameXML.childNodes[0].nodeValue; 		
			
			document.getElementById("memTyp_sel").value = arnameText;
			parseandFillAmt();
			showHideLife();showHideFam();Dispall();showHideMailAddress();dispAmateurDiv();
		} 
		else {
			alert("Problem: " + req.statusText);
		}
	}
}
function parseandFillAmt(){
	document.frmMembRegi.amount_txt.value=0;
	var str = document.getElementById("memTyp_sel").value;
	var splitstr = str.split("#");
	
	document.frmMembRegi.amount_txt.value = splitstr[2];
	Sumup();
}
function amatCard(cbxName){
	var chkObj = document.getElementById(cbxName);
	
	//alert(chkObj.value);
	var spval=chkObj.value;
	val=spval.split("#");
	//alert(val[1]);
	
	if (val[1] == "USEF" || val[1] == "usef" ){
		if(chkObj.checked==false){
			document.getElementById('amateurCrd').style.display="none";
			document.getElementById('amatCrd').checked=false;
		}
		else{
       		document.getElementById('amateurCrd').style.display="block";
			document.getElementById('amatCrd').checked=false;
	   }
    }
}

function getText(){
	var selectedYear = document.getElementById('regiOpt').value;
	var dob = document.frmMembRegi.dob.value;
	var nowDate = new Date();
	var year = nowDate.getFullYear();
	
	if(selectedYear=="nxtYr") year = year+1;
	else year = year;

	var dobYear = new Date();
	dobYear.setMonth(dob.substring(5,6));
	dobYear.setDate(dob.substring(8,10));
	dobYear.setYear(dob.substring(0,4));

	var newYear = new Date();
	newYear.setDate(31);
	newYear.setMonth(11);
	newYear.setYear(year);
	

	var dobTime = dobYear.getTime();
	var newTime = newYear.getTime();
	var diff = (newTime - dobTime)/(1000*60*60*24*365);
	
	var selObj = document.getElementById('membTypes');
	var selIndex = selObj.selectedIndex;
	var selTxt = selObj.options[selIndex].text;
	var selVal = selObj.options[selIndex].value;
	if (selTxt == "Junior Member" ){
		if(diff >= 19){
			alert("Sorry the age you have specified doesn't  match as required for a Junior Member");
			document.getElementById('memTyp_sel').value = 0;
			document.getElementById('membTypes').value = "";
			document.getElementById('amount_txt').value = 0;
			document.getElementById('regiOption').style.display="none";
			document.getElementById('membTypes').focus();
		}
	}
}

</script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>

<%

String logName=(String)session.getAttribute("loginName");
System.out.println("session.getAttribute(loginName) :"+logName);
double diff=0.0;
Date  dob = (Date) request.getAttribute("dobCnt");
Double convertLong = new Double(0.0);
String endDate = "";
//out.print("dob "+dob);
//out.print("dob" + dob);

	int ageCnt = 0;
	if(dob!=null){
		Date first = new Date();
		java.util.Calendar c7 = java.util.Calendar.getInstance();
		int calDay=31;
		int calMonth=12;
		int calMonth1=first.getMonth();
		int calYear = c7.get(Calendar.YEAR);
		if(calMonth1==11){
		calYear=calYear+1;
		}
		//out.println("calYear :"+calYear);
		endDate = calMonth+"/"+calDay+"/"+calYear;
		//out.println("P:"+endDate);
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyy");

		Date check_date = (Date)sdf1.parse(endDate);
		//out.println(check_date);
		double exTime=check_date.getTime();
		//out.println(exTime);
		//out.println(endDate);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String secondString = sdf.format(dob);
		//out.println(dob);
		
	
		double msPerDay = 1000 * 60 * 60 * 24 * 365;
		diff =
		(check_date.getTime() / msPerDay) - (dob.getTime() / msPerDay);
		System.out.println("******************************************: "+diff);
		convertLong = new Double(diff);
		}

 //
%>


</head>


<body onload="initLife();cardclear();Sumup();forDropDown();hideRegiOpt();hideSubPubli();">

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
          <td class="tableCommonBg"><table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
              <tr>
               
                <td width="100%" class="subDeptTablePad"><!-- CONTENTS START HERE         padding-top:3px; padding-left:5px;-->
                    <div class="cmmnForm">
                      <div class="colspan"> <strong>Membership:</strong> <span class="styleBoldTwo">Membership Application Form</span></div>
					  <div class="divider3"></div>
                      <div id="commonBG" class="textCommon" > <span class="asterisk"> IMPORTANT </span> --The only accepts payment by credit card for services purchased online. If you prefer to pay by check, please complete the appropriate <a href="http://useventing.com/start.php?section=docs" target="_blank">form</a> and mail with your check to the office. </div>
					  <div class="divider3"></div>
                      <div id="commonBG" class="textCommon" >Memberships are valid for the period of <strong>December 1st</strong> to <strong>November 30th</strong>. <br/>
                        Subscribing members are active for <strong>1 year</strong> from the membership join/renew date. </div>
						<div class="divider3"></div>
                      <!--
						<table cellpadding="0" cellspacing="0" border="0" class="container">
						<tr>
							<td id="tabData1" class="tabHighlight" onclick="naviTab('1')">
								<a id="link1" href="javascript:void(0);" class="active"><span id="1" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData2" class="tabLowlight" onclick="naviTab('2')">
								<a id="link2" href="javascript:void(0);" class="inactive"><span id="2" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData3" class="tabLowlight" onclick="naviTab('3')">
								<a id="link3" href="javascript:void(0);" class="inactive"><span id="3" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData4" class="tabLowlight" onclick="naviTab('4')">
								<a id="link4" href="javascript:void(0);" class="inactive"><span id="4" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData5" class="tabLowlight" onclick="naviTab('5')">
								<a id="link5" href="javascript:void(0);" class="inactive"><span id="5" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData6" class="tabLowlight" onclick="naviTab('6')">
								<a id="link6" href="javascript:void(0);" class="inactive"><span id="6" class="tabHead"></span></A>
							</td>
						</tr>
						</table>
					-->
                      <form name="frmMembRegi" id="myform" method="post" class="formcss" action="./insertMembershipReg.html" onsubmit="return myvalidate(this);">
                        <input type="hidden" name="dob" value="<%=dob%>" id="dob" />
                        <input type="hidden" name="dobCnt" value="<%=convertLong%>"/>
                        <input type="hidden" name="memberTypeId"/>
                        <input type="hidden" id="regiSect" name="regiSect" />
                        <input type="hidden" id="regiAct" name="regiAct" />
                        <input type="hidden" id="regiYear" name="regiYear" />
                        <div id="part1" class="holderDivOne" >
                          <!--++++++++++++++++++++ Part A of the form starts here ++++++++++++++++++++++++++++++ -->
                          <div class="rowHead"> Membership Information: </div>
                          <% 
																 Vector dispMembershipTypeVect=new Vector();
																 dispMembershipTypeVect=(Vector)request.getAttribute("dispMembershipTypeVect");
																					
																Vector areUAMemberVect=new Vector();
																areUAMemberVect=(Vector)request.getAttribute("areUAMemberVect");
																
					
																 Vector membershipToVect=new Vector();
																 membershipToVect=(Vector)request.getAttribute("membershipToVect");
																 Enumeration itrat= (Enumeration)membershipToVect.elements();
																 String[] addonPrice=(String[])request.getAttribute("addonPrice");
                                                                                                                                 String country=(String)request.getAttribute("country");																																												 																ArrayList donDet=new ArrayList();
																 
                                                                                                                                 donDet=(ArrayList)request.getAttribute("donDet");
                                                                                                                                 
																String newFamilyPrice = "";
																String newFamilyId = "";
																String newFamilyPrice1 = (String) request.getAttribute("newFamilyPrice");
																if(newFamilyPrice1!=null || newFamilyPrice1.trim().length()>0){
																	String[] split_str = newFamilyPrice1.split("#"); 																				
																	 newFamilyId = split_str[0];
																	 newFamilyPrice = split_str[1];
																}
															%>
                          <input type="hidden" name="futrefamPrice" id="futrefamPrice" value="<%=newFamilyPrice%>" />
                          <input type="hidden" name="futrefamId" id="futrefamId" value="<%=newFamilyId%>" />
                          <input type="hidden" name="logNam" value="<%=logName%>" />
                          <%
															int year=0;
															ArrayList humanMembTypes = (ArrayList) request.getAttribute("humanMembTypes");
															Iterator itr1 = humanMembTypes.iterator();
															%>
                          <div class="row"> <span class="label">Membership Type:</span> <span class="formX">
                            <select name="membTypes" id="membTypes" class="selectboxOne" onchange="fillIdAmount();fillFamId();clrAmt();Sumup();">
                              <!-- showHideLife(), showHideFam(), Dispall(), showHideMailAddress();dispAmateurDiv(); -->
                              <option value="">Select One</option>
                              <%
															java.util.Calendar c = java.util.Calendar.getInstance();
															year= c.get(Calendar.YEAR);																
															int flg = 0;
															while(itr1.hasNext()){
																Date fir = new Date();
																String typeName = (String) itr1.next();
																String dobStr = dob.toString();
																String[] spliStr = dobStr.split("-");
																System.out.println(dobStr);
																SimpleDateFormat newSdf = new SimpleDateFormat("yyyy-MM-dd");
																
																if(dobStr!=null){
																int calDay=31;
																int calMonth=12;
																int calMonth1=fir.getMonth();
																System.out.println(">>>>>>>>>>>>>"+calMonth1);
																if(calMonth1==11){
																	year=year+1;
																}
																String eDate = calMonth+"/"+calDay+"/"+year;
																SimpleDateFormat newsdf1 = new SimpleDateFormat("MM/dd/yyy");
																Date chdate = (Date)newsdf1.parse(eDate);
																Date membDOB = newSdf.parse(dobStr);
																long dobTime = membDOB.getTime();
																long nowTime = chdate.getTime();
																long differenceFinal = nowTime - dobTime;
																float diffAge1 = (float)(differenceFinal/(1000 * 60 * 60 * 24));
																float diffAge = diffAge1/365;
																if(diffAge>=19){
																	flg= 1;
																}
																	
																if(diffAge>=19){
																	if(!typeName.equalsIgnoreCase("Junior Member")){
																		%>
                              <option value="<%=typeName%>"><%=typeName%></option>
                              <%
																	}
																}
																else{
																		%>
                              <option value="<%=typeName%>"><%=typeName%></option>
                              <%																		
																}
															}
															else{
																%>
                              <option value="<%=typeName%>"><%=typeName%></option>
                              <%																		
																}
															}
														%>
                            </select>
                            <span class="asterisk">*</span> <strong>$</strong>&nbsp;
                            <input id="amount_txt" name="amount_txt" class="textboxOne" type="text" size="10" readonly="true" value="0"/>
                          </span> </div>
                          <!--	<div class="row">
																<span class="label">Membership Type:</span>
																<span class="formX">
																<select name="selDisp" id="memTyp_sel" class="selectboxOne" onchange="showHideLife(), showHideFam(), Dispall(), showHideMailAddress();dispAmateurDiv();fillFamId();clrAmt();Sumup();">
					
																  <option selected="selected" value="0">Select One</option>
																											  
																 < %  
																 
																 
																 if(dispMembershipTypeVect!=null)
																 {
																 
																  Enumeration itrators= (Enumeration)dispMembershipTypeVect.elements();
																  
																  java.util.Calendar c = java.util.Calendar.getInstance();
																					//int day = c.get(Calendar.DAY);
																					//int month = c.get(Calendar.MONTH);
																					 year= c.get(Calendar.YEAR);
																					//String date = day+" / "+month+" / "+year;
																					System.out.println("Current Date = "+year);
																		
																		
																	/*	int yrfrmdb=dob.getYear();
																		
																		int age=18;//year-yrfrmdb;
																		
																		System.out.println("yrfrmdb :"+yrfrmdb);
																		
																		System.out.println("age :"+age);*/
																		
																 while(itrators.hasMoreElements()){
																		   String[] sarray = (String[]) itrators.nextElement();
					
																		   String memberTypeId = sarray[0];
																		   String membershipName = sarray[1];
																		   String membershipAmount = sarray[2];
																		   String cnct=memberTypeId+"#"+membershipName+"#"+membershipAmount;																		
																		
																		
																					 
																if(diff>6939)
																{
																	if(!membershipName.equalsIgnoreCase("junior member"))
																	{%>
																		<option id="< %=membershipName.toLowerCase()%>" value="< %=cnct%>">< %=membershipName%></option>
																	< %}
																}
																else
																{%>			
																 <option id="< %=membershipName.toLowerCase()%>" value="< %=cnct%>">< %=membershipName%></option>
																 
																 < %}}}%>
																</select>
																<span class="asterisk">*</span>																&nbsp;
																<strong>$</strong>&nbsp;<input id="amount_txt" name="amount_txt" class="textboxOne" type="text" size="10" readonly="true" value="0"/>
																</span>		
														</div>-->
                          <input name="selDisp" id="memTyp_sel" type="hidden"/>
                          <input type="hidden" id="currentfamId" name="currentfamId" value="<%=addonPrice[0]%>" />
                          <input type="hidden" id="currntAddAmt" name="currntAddAmt" value="<%=addonPrice[1]%>" />
                          <input type="hidden" id="famembId" name="famembId" value="<%=addonPrice[0]%>" />
                          <input type="hidden" name="addOnAmount" id="addOnAmount" value="<%=addonPrice[1]%>" />
                          <div id="regiOption">
                            <div class="row"> <span class="label2">
                              <input type="radio" value="nxtYr" name="regiOpt" id="regiOpt" onclick="fillDropDown(); showHideLife(), showHideFam(), Dispall(), showHideMailAddress(); dispAmateurDiv(); fillFamId(); clrAmt(); getText(); Sumup();"/>
                              <strong>Join for upcoming membership</strong> </span> </div>
                            <div class="row"> <span class="label2">
                              <input type="radio" value="curntYr" id="regiOpt" name="regiOpt" onclick="fillDropDown();showHideLife(), showHideFam(), Dispall(), showHideMailAddress(); dispAmateurDiv(); fillFamId(); clrAmt(); getText(); Sumup();"/>
                              <strong>Join for current membership</strong> </span> <span class="formX4"> </span> </div>
                          </div>
                          <div id="forLife">
                            <div class="colspan"> <strong>Current Full / Life Member Info:</strong> </div>
                            <div id="commonBG">
                              <p> Your Family Membership will be linked to the following Full or Life Member Account. </p>
                            </div>
                            <div class="row"> <span class="label">Member ID:</span> <span class="formX">
                              <input name="memberid" id="memberid" type="text" class="textboxOne" size="20" onblur="HLCMemberDetails();" />
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">First Name:</span> <span class="formX">
                              <input name="firstName" class="textboxOne" id="firstNameId5" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                            </span> </div>
                            <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                              <input name="lastName" class="textboxOne" id="lastNameId5" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                            </span> </div>
                            <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                  <input name="phone" class="textboxOne" id="phoneId5" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="8" readonly="readonly" />
                            </span> </div>
                            <div id="commonBG" style="padding:8px;">
                              <input type="checkbox" name="confFam" id="confFam_Id" value="" />
                              I confirm that I am attached to the <strong>FULL/LIFE member</strong> whose details are shown above. </div>
                          </div>
                          <div class="colspan"> <span><strong>Please Support these Programs</strong></span></br>
                          </div>
                          <div id="commonBG">
                            <p> A suggested donation , Inc. has been added. Please uncheck the box to remove this donation, or change the amount if desired. To designate this donation to another, enter text in the corresponding name field (ie: In memory of.., Anonymous, Bob and Sarah Smith, etc.) This is a 501 (c) (3) educational organization and all donations are fully tax deductible. Donations made on this page are not considered restricted donations will make every attempt to honor your intent.</p>
                          </div>
                          <!------------------------->
                          <div class="row" style="height:auto"><br />
                              <%
															 
															 String Usrname ="";
															 
															 if(donDet!=null)
															 {
															 	String doncbname;
																String dontbname;
																String donNametbname;
																String donChked="";
																String donId="";
																
																int donsiz=donDet.size();
																
															 	for(int j=0;j<donDet.size();j++)
															 	{
                                                                    doncbname="donCb"+j;
																	dontbname="donTb"+j;
																	donNametbname="donNametb"+j;
																	
																	 HLCDonationVO donvo=new HLCDonationVO();
																	 donvo=(HLCDonationVO)donDet.get(j);
																	                                                                                                                                         
																	 donId=donvo.getDonationId();
																	 String donName=donvo.getDonationName();
																	 String donAmt=donvo.getDonationPrice();
																	 String doncnct=donId+"#"+donName+"#"+donAmt;
																	 System.out.println("doncnct :"+doncnct);
																	 String firstName = (String)session.getAttribute("firstName"); String lastName= (String)session.getAttribute("lastName");
																	 Usrname = firstName+" " +lastName;
																	 String preChk="";
																	    String dis_stat="";
																	 
																	 if(donvo.isPrecheckStatus())
																	 {
																	 	preChk="checked";
																	 	System.out.println("preChk :"+preChk);
																	 }
																	 else
																	 {
																	 	dis_stat="disabled";
																	 }
																	 
															%>
                              <span class="formXThree">
                              <input type="checkbox" <%=preChk%> name="<%=doncbname%>" id="<%=doncbname%>" value="<%=doncnct%>" onclick="txtBxDisabEnab2('<%=dontbname%>');donaName();Sumup();totalDonation();"/>
                                <%=donName%> </span> <span>&nbsp;<strong>$</strong>
                              <input name="<%=dontbname%>" id="<%=dontbname%>" class="textboxOne" <%=dis_stat%> value="<%=donAmt%>" size="10" onblur="Sumup();" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name: &nbsp;
                                  <%
																	if(preChk.equalsIgnoreCase("checked")){%>
                                  <input name="<%=donNametbname%>" id="<%=donNametbname%>" class="textboxOne" size="10" value="<%=firstName%>&nbsp;<%=lastName%>" />
                                  <br />
                                  <br />
                                  <% } 
																	else{%>
                                  <input name="<%=donNametbname%>" id="<%=donNametbname%>" class="textboxOne" size="10">
                                  <br />
                                  <br />
                                  <% } %>
                              </span>
                              <%}%>
                              <input type="hidden" name="donCbxCt" value="<%=donsiz%>" />
                              <input type="hidden" name="donaId" value="<%=donId%>" />
                              <%}%>
                          </div>
                          <input type="hidden" name="userNam" value="<%=Usrname%>" />
                          <div id="famAddOn">
                            <div class="colspan"> <strong>Family Member Add On:</strong> </div>
                            <div id="commonBG" class="textCommon" style="height:35px;"> I would like to add the following family member(s) to an existing Full or Life membership. Family 
                              Memberships are available to novice and training level riders only. </div>
                            <div class="row"> <span class="label">How many family members are joining? </span> <span class="formX">
                              <select name="famMemb" id="famAdd_sel" class="selectboxOne" onchange="showAddOn();Sumup();">
                                <option value="0" selected="selected">Select One</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">Four</option>
                              </select>
                              &nbsp; (Maximum 4 Members) </span> </div>
                            <!-- spacer starts-->
                            <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                            <!-- spacer starts-->
                            <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                          </div>
                          <!--++++++++++++++++++++ Part A of the form Ends here ++++++++++++++++++++++++++++++ -->
                          <div id="part2" class="holderDivFour" >
                            <!--++++++++++++++++++++ Part B of the form starts here ++++++++++++++++++++++++++++++ -->
                            <!--// Family Memb One // -->
                            <div>
                              <div class="colspan"> <strong>Family Member <span class="styleBoldOne">One</span>:</strong> </div>
                              <div class="row"> <span class="alignLeft">I am  registering for: (choose one)</span> </div>
                              <div class="row"> <span class="formX">
                                <input type="radio" size="10" name="famUser1" value="mem" onclick="switchDiv('member1');showHideRadio('famUser1','webUserOne','yes');showHideRadio('famUser1','othUserOne','yes');"/>
                                A current Member(requires ID number). </span> </div>
                              <div class="row" style="height:35px;"> <span class="formX">
                                <input type="radio" size="10" name="famUser1" value="yes" onclick="switchDiv('webUserOne');showHideRadio('famUser1','member1','mem');showHideRadio('famUser1','othUserOne','mem');"/>
                                A non Member with a webuser account &nbsp;<span class="paddleft">(requires username).</span></span> </div>
                              <div class="row"> <span class="formX">
                                <input type="radio" size="10" name="famUser1" value="no" checked="checked" onclick="switchDiv('othUserOne');showHideRadio('famUser1','webUserOne','yes');showHideRadio('famUser1','member1','yes');"/>
                                A non Member without a webuser account.</span> </div>
                              <div id="webUserOne">
                                <div class="row"> <span class="label">User Name:</span> <span class="formX">
                                  <input name="userNameId1" id="userNameId1" type="text" class="textboxOne" size="20" onblur="nonUserDetails(this);userMembExist();sameUsr1();" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="spacer"></div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input name="text" type="text" class="readOnly" id="firstNameId1" size="20" readonly="true" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input name="text" type="text" class="readOnly" id="lastNameId1" size="20" readonly="true" />
                                </span> </div>
                                <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                      <input name="text" type="text" class="readOnly" id="phoneId1" size="8" readonly="true" />
                                </span> </div>
                              </div>
                              <div id="othUserOne">
                                <div class="row"> <span class="label">Salutation:</span> <span class="formX">
                                  <select name="sal1" id="selectSalute1" class="selectboxOne">
                                    <option selected="selected" value="">Select One</option>
                                    <option value="Mr">Mr.</option>
                                    <option value="Mrs">Mrs.</option>
                                    <option value="Miss">Miss.</option>
                                    <option value="Ms">Ms.</option>
                                  </select>
                                </span> </div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input type="text" name="fname1" id="firstname1" class="textboxOne" size="20" maxlength="40" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Middle Name:</span> <span class="formX">
                                  <input type="text" name="mname1" id="middlename1" class="textboxOne" size="20" maxlength="40" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input type="text" name="lname1" id="lastname1" class="textboxOne" size="20" maxlength="40" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Suffix:</span> <span class="formX">
                                  <input type="text" name="suffix1" id="suffix1" class="textboxOne" size="20" maxlength="20" />
                                </span> </div>
                                <div class="row"> <span class="label">Date of Birth :</span> <span class="formX">
                                  <select name="birthmonth1" id="selectMonth1" class="selectboxOne">
                                    <option value="" selected="selected">Month</option>
                                    <option value="01">January</option>
                                    <option value="02">February</option>
                                    <option value="03">March</option>
                                    <option value="04">April</option>
                                    <option value="05">May</option>
                                    <option value="06">June</option>
                                    <option value="07">July</option>
                                    <option value="08">August</option>
                                    <option value="09">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                  </select>
                                  <select name="birthday1" id="selectDay1" class="selectboxOne">
                                    <option value="" selected="selected">Day</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                  </select>
                                  <select name="birthyear1" id="selectYear1" class="selectboxOne">
                                    <option value="" selected="selected" >Year</option>
                                    <%
																					for(int e=1900;e<=year;e++) 
																					{%>
                                    <option  value="<%=e%>"><%=e%></option>
                                    <%}
																					%>
                                  </select>
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Gender:</span> <span class="floatLeft">
                                  <input type="radio" size="10" name="gender1" id="gender1" value="male" />
                                  Male
                                  <input type="radio" size="10" name="gender1" id="gender1" value="female" />
                                  Female
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Phone:</span> <span class="formX">
                                  <input type="text" name="phone1" id="phone1" class="textboxOne" size="15" maxlength="30" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Mobile:</span> <span class="formX">
                                  <input type="text" name="mobile1" id="mobile1" class="textboxOne" size="15" maxlength="30" />
                                </span> </div>
                                <div class="row"> <span class="label">Fax:</span> <span class="formX">
                                  <input type="text" name="fax1" id="fax1" class="textboxOne" size="15" maxlength="30" />
                                </span> </div>
                                <div class="row"> <span class="label">EMail :</span> <span class="formX">
                                  <input type="text" name="email1" id="email1" class="textboxOne" size="25" maxlength="50" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                              </div>
                              <div id="member1">
                                <div class="row"> <span class="label">Member ID:</span> <span class="formX">
                                  <input name="memberAdd1" id="memberAdd1" type="text" class="textboxOne" size="20" onblur="membDetails1(this);" />
                                  <span class="asterisk">*</span> </span> </div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input name="firstName" class="textboxOne" id="firstNameAdd1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input name="lastName" class="textboxOne" id="lastNameAdd1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                                </span> </div>
                                <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                      <input name="phone" class="textboxOne" id="phoneAdd1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="8" readonly="readonly" />
                                </span> </div>
                              </div>
                              <div class="colspan"> <strong>Amateur Rider Declaration:</strong> </div>
                            </div>
                          </div>
                          <div id="part3" class="holderDivFour" >
                            <!--++++++++++++++++++++ Part C of the form starts here ++++++++++++++++++++++++++++++ -->
                            <!--// Family Memb Two // -->
                            <div>
                              <div class="colspan"> <strong>Family Member <span class="styleBoldOne">Two</span>:</strong> </div>
                              <div class="row"> <span class="alignLeft">I am  registering for: (choose one)</span> </div>
                              <div class="row"> <span class="formX">
                                <input type="radio" size="10" name="famUser2" value="mem" onclick="switchDiv('member2');showHideRadio('famUser2','webUserTwo','yes');showHideRadio('famUser2','othUserTwo','yes');"/>
                                A current Member (requires ID number). </span> </div>
                              <div class="row" style="height:35px;"> <span class="formX">
                                <input type="radio" size="10" name="famUser2" value="yes" onclick="switchDiv('webUserTwo');showHideRadio('famUser2','member2','mem');showHideRadio('famUser2','othUserTwo','mem');"/>
                                A non Member with a webuser account (requires username).</span> </div>
                              <div class="row"> <span class="formX">
                                <input type="radio" size="10" name="famUser2" value="no" checked="checked" onclick="switchDiv('othUserTwo');showHideRadio('famUser2','webUserTwo','yes');showHideRadio('famUser2','member2','yes');"/>
                                A non Member without a webuser account.</span> </div>
                              <div id="webUserTwo">
                                <div class="row"> <span class="label">User Name:</span> <span class="formX">
                                  <input type="text" name="userNameId2" id="userNameId2" class="textboxOne" size="20" onblur="nonUserDetails2(this);userMembExist2();sameUsr2();" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input type="text" name="firstNameId2" id="firstNameId2" class="readOnly" readonly="true" size="20" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input name="lastNameId2" id="lastNameId2" type="text" class="readOnly" readonly="true" size="20" />
                                </span> </div>
                                <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                      <input type="text" name="phoneId2" id="phoneId2" class="readOnly" readonly="true" size="8" />
                                </span> </div>
                              </div>
                              <div id="othUserTwo">
                                <div class="row"> <span class="label">Salutation:</span> <span class="formX">
                                  <select name="sal1" id="selectSalute2" class="selectboxOne">
                                    <option selected="selected" value="">Select One</option>
                                    <option value="Mr">Mr.</option>
                                    <option value="Mrs">Mrs.</option>
                                    <option value="Miss">Miss.</option>
                                    <option value="Ms">Ms.</option>
                                  </select>
                                </span> </div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input name="fname2" id="firstname2" type="text" class="textboxOne" size="20" maxlength="40" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Middle Name:</span> <span class="formX">
                                  <input name="mname2" id="middlename2" type="text" class="textboxOne" size="20" maxlength="40" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input name="lname2" id="lastname2" type="text" class="textboxOne" size="20" maxlength="40" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Suffix:</span> <span class="formX">
                                  <input type="text" id="suffix2" name="suffix2" class="textboxOne" size="20" maxlength="20" />
                                </span> </div>
                                <div class="row"> <span class="label">Date of Birth :</span> <span class="formX">
                                  <select name="birthmonth2" id="selectMonth2" class="selectboxOne">
                                    <option value="" selected="selected">Month</option>
                                    <option value="01">January</option>
                                    <option value="02">February</option>
                                    <option value="03">March</option>
                                    <option value="04">April</option>
                                    <option value="05">May</option>
                                    <option value="06">June</option>
                                    <option value="07">July</option>
                                    <option value="08">August</option>
                                    <option value="09">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                  </select>
                                  <select name="birthday2" id="selectDay2" class="selectboxOne">
                                    <option value="" selected="selected">Day</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                  </select>
                                  <select name="birthyear2" id="selectYear2" class="selectboxOne">
                                    <option value="" selected="selected" >Year</option>
                                    <%
																				java.util.Calendar c2 = java.util.Calendar.getInstance();
																				//int day = c.get(Calendar.DAY);
																				//int month = c.get(Calendar.MONTH);
																				int year2 = c2.get(Calendar.YEAR);
																				//String date = day+" / "+month+" / "+year;
																				System.out.println("Current Date = "+year2);

																				for(int d=1900;d<=year2;d++) 
																				{%>
                                    <option  value="<%=d%>"><%=d%></option>
                                    <%}
																				%>
                                  </select>
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Gender:</span> <span class="floatLeft">
                                  <input type="radio" size="10" name="gender2" id="gender2" value="male" />
                                  Male
                                  <input type="radio" size="10" name="gender2" id="gender2" value="female" />
                                  Female
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Phone:</span> <span class="formX">
                                  <input type="text" name="phone2" id="phone2" class="textboxOne" size="15" maxlength="30" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Mobile:</span> <span class="formX">
                                  <input type="text"  name="mobile2" id="mobile2" class="textboxOne" size="15" maxlength="30"/>
                                </span> </div>
                                <div class="row"> <span class="label">Fax:</span> <span class="formX">
                                  <input type="text" name="fax2" id="fax2" class="textboxOne" size="15" maxlength="30"/>
                                </span> </div>
                                <div class="row"> <span class="label">EMail :</span> <span class="formX">
                                  <input type="text" name="email2" id="email2" class="textboxOne" size="25" maxlength="50" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <!--// Family Memb Two // -->
                              </div>
                            </div>
                            <div id="member2">
                              <div class="row"> <span class="label">Member ID:</span> <span class="formX">
                                <input name="memberAdd2" id="memberAdd2" type="text" class="textboxOne" size="20" onblur="membDetails2(this);" />
                                <span class="asterisk">*</span> </span> </div>
                              <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                <input name="firstName" class="textboxOne" id="firstNameAdd2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                              </span> </div>
                              <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                <input name="lastName" class="textboxOne" id="lastNameAdd2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                              </span> </div>
                              <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                    <input name="phone" class="textboxOne" id="phoneAdd2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="8" readonly="readonly" />
                              </span> </div>
                            </div>
                            <div class="colspan"> <strong>Amateur Rider Declaration:</strong> </div>
                            <div id="commonBG" style="padding:8px;"> <strong>USEF Rules for Eventing Appendix 3, Section, 2.4:</strong><br />
                                <br />
                                <blockquote> AMATEUR RIDER (AR) - For the purposes of Eventing, an Amateur is a Senior Rider whose remuneration from the activities listed in GR808 does not exceed $2,500.00 in either the preceding or current calendar year. In order to compete as an Amateur a rider must possess either a USEF Amateur Card or have on file in the office a signed affidavit stating that he/she is in compliance with the above definition. Amateurs in Eventing are subject to the relevant provisions of GR809-810. </blockquote>
                              <br />
                                <br />
                                <strong>By typing in my full name in the box below, I hearby declare that I am eligible for Amateur status under the conditions set forth in the above USEF rule.</strong> </div>
                            <div class="row"> <span class="label">Name (Type full name):</span> <span class="formX">
                              <input name="nameAmat2" id="nameAmat_id" type="text" class="textboxOne" size="20" />
                            </span> </div>
                            <div class="row"> <span class="label"><strong>Select option that applies to you:</strong></span> </div>
                            <div class="row" style="height:50px"> <span class="floatLeft">
                              <input type="checkbox" size="10" name="amatCrdPoss2" id="amatCrdPoss2" value="yes" onclick="tempValidate2();"/>
                              I am in the possession of a current USEF Amateur Card. <br />
                              <input type="checkbox" size="10" name="amatCrdElig2" id="amatCrdElig2" value="yes" onclick="tempValidate2();"/>
                              I am declaring my Amateur Status Eligibility with only. </span> </div>
                            <div id="commonBG" style="padding:8px;"> <span class="styleBoldTwo">NOTE:</span> A person's Amateur status must be declared for each competition season. To be eligible for the U.S. Eventing Association Year-End Awards, <b>this section must be completed</b> and <b>signed</b>. </div>
                            <!-- spacer starts-->
                            <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                            <!--++++++++++++++++++++ Part C of the form Ends here ++++++++++++++++++++++++++++++ -->
                          </div>
                          <div id="part4" class="holderDivFour" >
                            <!--++++++++++++++++++++ Part C of the form starts here ++++++++++++++++++++++++++++++ -->
                            <!--// Family Memb Two // -->
                            <div>
                              <div class="colspan"> <strong>Family Member <span class="styleBoldOne">Three</span>:</strong> </div>
                              <div class="row"> <span class="alignLeft">I am  registering for: (choose one)</span> </div>
                              <div class="row"> <span class="formX">
                                <input type="radio" size="10" name="famUser3" value="mem" onclick="switchDiv('member3');showHideRadio('famUser3','webUserThree','yes');showHideRadio('famUser3','othUserThree','yes');"/>
                                A current Member (requires ID number). </span> </div>
                              <div class="row" style="height:35px;"> <span class="formX">
                                <input type="radio" size="10" name="famUser3" value="yes" onclick="switchDiv('webUserThree');showHideRadio('famUser3','member3','mem');showHideRadio('famUser3','othUserThree','mem');"/>
                                A non Member with a webuser account (requires username).</span> </div>
                              <div class="row"> <span class="formX">
                                <input type="radio" size="10" name="famUser3" value="no" checked="checked" onclick="switchDiv('othUserThree');showHideRadio('famUser3','webUserThree','yes');showHideRadio('famUser3','member3','yes');"/>
                                A non Member without a webuser account.</span> </div>
                              <div id="webUserThree">
                                <div class="row"> <span class="label">User Name:</span> <span class="formX">
                                  <input type="text" id="userNameId3" name="userNameId3" class="textboxOne" size="20" onblur="nonUserDetails3(this);userMembExist3();sameUsr3()" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input name="text" type="text" class="readOnly" id="firstNameId3" size="20" readonly="true" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input name="lastNameId3" id="lastNameId3" type="text" class="readOnly" readonly="true" size="20" />
                                </span> </div>
                                <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                      <input name="text" type="text" class="readOnly" id="phoneId3" size="8" readonly="true" />
                                </span> </div>
                              </div>
                              <div id="othUserThree">
                                <div class="row"> <span class="label">Salutation:</span> <span class="formX">
                                  <select name="sal3" id="selectSalute3" class="selectboxOne">
                                    <option selected="selected" value="">Select One</option>
                                    <option value="Mr">Mr.</option>
                                    <option value="Mrs">Mrs.</option>
                                    <option value="Miss">Miss.</option>
                                    <option value="Ms">Ms.</option>
                                  </select>
                                </span> </div>
                                <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                  <input type="text" name="fname3" id="firstname3" class="textboxOne" size="20" maxlength="40" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Middle Name:</span> <span class="formX">
                                  <input type="text" name="mname3" id="middlename3" class="textboxOne" size="20" maxlength="40" />
                                </span> </div>
                                <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                  <input type="text" name="lname3" id="lastname3" class="textboxOne" size="20" maxlength="40" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Suffix:</span> <span class="formX">
                                  <input type="text" name="suffix3" id="suffix3" class="textboxOne" size="20" maxlength="20" />
                                </span> </div>
                                <div class="row"> <span class="label">Date of Birth :</span> <span class="formX">
                                  <select name="birthmonth3" id="selectMonth3" class="selectboxOne">
                                    <option value="" selected="selected">Month</option>
                                    <option value="01">January</option>
                                    <option value="02">February</option>
                                    <option value="03">March</option>
                                    <option value="04">April</option>
                                    <option value="05">May</option>
                                    <option value="06">June</option>
                                    <option value="07">July</option>
                                    <option value="08">August</option>
                                    <option value="09">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                  </select>
                                  <select name="birthday3" id="selectDay3" class="selectboxOne">
                                    <option value="" selected="selected">Day</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                  </select>
                                  <select name="birthyear3" id="selectYear3" class="selectboxOne">
                                    <option value="" selected="selected" >Year</option>
                                    <%
																				java.util.Calendar c3 = java.util.Calendar.getInstance();
																				//int day = c.get(Calendar.DAY);
																				//int month = c.get(Calendar.MONTH);
																				int year3 = c3.get(Calendar.YEAR);
																				//String date = day+" / "+month+" / "+year;
																				System.out.println("Current Date = "+year3);

																				for(int a=1900;a<=year3;a++) 
																				{%>
                                    <option  value="<%=a%>"><%=a%></option>
                                    <%}
																				%>
                                  </select>
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Gender:</span> <span class="floatLeft">
                                  <input type="radio" size="10" name="gender3" id="gender3" value="male" />
                                  Male
                                  <input type="radio" size="10" name="gender3" id="gender3" value="female" />
                                  Female
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Phone:</span> <span class="formX">
                                  <input type="text" name="phone3" id="phone3" class="textboxOne" size="15" maxlength="30" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <div class="row"> <span class="label">Mobile:</span> <span class="formX">
                                  <input type="text" name="mobile3" id="mobile3" class="textboxOne" size="15" maxlength="30" />
                                </span> </div>
                                <div class="row"> <span class="label">Fax:</span> <span class="formX">
                                  <input type="text" name="fax3" id="fax3" class="textboxOne" size="15" maxlength="30"/>
                                </span> </div>
                                <div class="row"> <span class="label">EMail :</span> <span class="formX">
                                  <input type="text" name="email3" id="email3" class="textboxOne" size="25" maxlength="50" />
                                  &nbsp;<span class="asterisk">*</span></span> </div>
                                <!--// Family Memb Two // -->
                              </div>
                            </div>
                            <div id="member3">
                              <div class="row"> <span class="label">Member ID:</span> <span class="formX">
                                <input name="memberAdd3" id="memberAdd3" type="text" class="textboxOne" size="20" onblur="membDetails3(this);" />
                                <span class="asterisk">*</span> </span> </div>
                              <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                <input name="firstName" class="textboxOne" id="firstNameAdd3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                              </span> </div>
                              <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                <input name="lastName" class="textboxOne" id="lastNameAdd3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                              </span> </div>
                              <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                    <input name="phone" class="textboxOne" id="phoneAdd3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="8" readonly="readonly" />
                              </span> </div>
                            </div>
                            <div class="colspan"> <strong>Amateur Rider Declaration:</strong> </div>
                            <div id="commonBG" style="padding:8px;"> <strong>USEF Rules for Eventing Appendix 3, Section, 2.4:</strong><br />
                                <br />
                                <blockquote> AMATEUR RIDER (AR) - For the purposes of Eventing, an Amateur is a Senior Rider whose remuneration from the activities listed in GR808 does not exceed $2,500.00 in either the preceding or current calendar year. In order to compete as an Amateur a rider must possess either a USEF Amateur Card or have on file in the office a signed affidavit stating that he/she is in compliance with the above definition. Amateurs in Eventing are subject to the relevant provisions of GR809-810. </blockquote>
                              <br />
                                <br />
                                <strong>By typing in my full name in the box below, I hearby declare that I am eligible for Amateur status under the conditions set forth in the above USEF rule.</strong> </div>
                            <div class="row"> <span class="label">Name (Type full name):</span> <span class="formX">
                              <input name="nameAmat3" id="nameAmat_id" type="text" class="textboxOne" size="20" />
                            </span> </div>
                            <div class="row"> <span class="label"><strong>Select option that applies to you:</strong></span> </div>
                            <div class="row" style="height:50px;"> <span class="floatLeft">
                              <input type="checkbox" size="10" name="amatCrdPoss3" id="amatCrdPoss3" value="yes" onclick="tempValidate3"/>
                              I am in the possession of a current USEF Amateur Card. <br />
                              <input type="checkbox" size="10" name="amatCrdElig3" id="amatCrdElig3" value="yes" onclick="tempValidate3"/>
                              I am declaring my Amateur Status Eligibility with only. </span> </div>
                            <div id="commonBG" style="padding:8px;"> <span class="styleBoldTwo">NOTE:</span> A person's Amateur status must be declared for each competition season. To be eligible for the U.S. Eventing Association Year-End Awards, <b>this section must be completed</b> and <b>signed</b>. </div>
                            <!-- spacer starts-->
                            <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                            <!--++++++++++++++++++++ Part C of the form Ends here ++++++++++++++++++++++++++++++ -->
                          </div>
                          <div id="part5" class="holderDivFour" >
                            <!--++++++++++++++++++++ Part C of the form starts here ++++++++++++++++++++++++++++++ -->
                            <!--// Family Memb Two // -->
                            <div>
                              <div class="colspan"> <strong>Family Member <span class="styleBoldOne">Four</span>:</strong> </div>
                            </div>
                            <div class="row"> <span class="alignLeft">I am  registering for: (choose one)</span> </div>
                            <div class="row"> <span class="formX">
                              <input type="radio" size="10" name="famUser4" value="mem" onclick="switchDiv('member4');showHideRadio('famUser4','webUserFour','yes');showHideRadio('famUser4','othUserFour','yes');"/>
                              A current Member (requires ID number). </span> </div>
                            <div class="row" style="height:35px;"> <span class="formX">
                              <input type="radio" size="10" name="famUser4" value="yes" onclick="switchDiv('webUserFour');showHideRadio('famUser4','member4','mem');showHideRadio('famUser4','othUserFour','mem');"/>
                              A non Member with a webuser account (requires username).</span> </div>
                            <div class="row"> <span class="formX">
                              <input type="radio" size="10" name="famUser4" value="no" checked="checked" onclick="switchDiv('othUserFour');showHideRadio('famUser4','webUserFour','yes');showHideRadio('famUser4','member4','yes');"/>
                              A non Member without a webuser account.</span> </div>
                            <div id="webUserFour">
                              <div class="row"> <span class="label">User Name:</span> <span class="formX">
                                <input type="text" id="userNameId4" name="userNameId4" class="textboxOne" size="20" onblur="nonUserDetails4(this);userMembExist4();sameUsr4();" />
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                <input type="text" name="firstNameId4" id="firstNameId4" class="readOnly" readonly="true" size="20" />
                              </span> </div>
                              <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                <input name="text" type="text" class="readOnly" id="lastNameId4" size="20" readonly="true" />
                              </span> </div>
                              <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                    <input name="text" type="text" class="readOnly" id="phoneId4" size="8" readonly="true" />
                              </span> </div>
                            </div>
                            <div id="othUserFour">
                              <div class="row"> <span class="label">Salutation:</span> <span class="formX">
                                <select name="sal4" id="selectSalute4" class="selectboxOne">
                                  <option selected="selected" value="">Select One</option>
                                  <option value="Mr">Mr.</option>
                                  <option value="Mrs">Mrs.</option>
                                  <option value="Miss">Miss.</option>
                                  <option value="Ms">Ms.</option>
                                </select>
                              </span> </div>
                              <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                <input name="fname4" id="firstname4" type="text" class="textboxOne" size="20" maxlength="40" />
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <div class="row"> <span class="label">Middle Name:</span> <span class="formX">
                                <input name="mname4" id="middlename4" type="text" class="textboxOne" size="20" maxlength="40" />
                              </span> </div>
                              <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                <input name="lname4" id="lastname4" type="text" class="textboxOne" size="20" maxlength="40" />
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <div class="row"> <span class="label">Suffix:</span> <span class="formX">
                                <input name="suffix4" id="suffix4" type="text" class="textboxOne" size="20" maxlength="40" />
                              </span> </div>
                              <div class="row"> <span class="label">Date of Birth :</span> <span class="formX">
                                <select name="birthmonth4" id="selectMonth4" class="selectboxOne">
                                  <option value="" selected="selected">Month</option>
                                  <option value="01">January</option>
                                  <option value="02">February</option>
                                  <option value="03">March</option>
                                  <option value="04">April</option>
                                  <option value="05">May</option>
                                  <option value="06">June</option>
                                  <option value="07">July</option>
                                  <option value="08">August</option>
                                  <option value="09">September</option>
                                  <option value="10">October</option>
                                  <option value="11">November</option>
                                  <option value="12">December</option>
                                </select>
                                <select name="birthday4" id="selectDay4" class="selectboxOne">
                                  <option value="" selected="selected">Day</option>
                                  <option value="01">01</option>
                                  <option value="02">02</option>
                                  <option value="03">03</option>
                                  <option value="04">04</option>
                                  <option value="05">05</option>
                                  <option value="06">06</option>
                                  <option value="07">07</option>
                                  <option value="08">08</option>
                                  <option value="09">09</option>
                                  <option value="10">10</option>
                                  <option value="11">11</option>
                                  <option value="12">12</option>
                                  <option value="13">13</option>
                                  <option value="14">14</option>
                                  <option value="15">15</option>
                                  <option value="16">16</option>
                                  <option value="17">17</option>
                                  <option value="18">18</option>
                                  <option value="19">19</option>
                                  <option value="20">20</option>
                                  <option value="21">21</option>
                                  <option value="22">22</option>
                                  <option value="23">23</option>
                                  <option value="24">24</option>
                                  <option value="25">25</option>
                                  <option value="26">26</option>
                                  <option value="27">27</option>
                                  <option value="28">28</option>
                                  <option value="29">29</option>
                                  <option value="30">30</option>
                                  <option value="31">31</option>
                                </select>
                                <select name="birthyear4" id="selectYear4" class="selectboxOne">
                                  <option value="" selected="selected" >Year</option>
                                  <%
																				java.util.Calendar c4 = java.util.Calendar.getInstance();
																				//int day = c.get(Calendar.DAY);
																				//int month = c.get(Calendar.MONTH);
																				int year4 = c4.get(Calendar.YEAR);
																				//String date = day+" / "+month+" / "+year;
																				System.out.println("Current Date = "+year4);

																				for(int k=1900;k<=year4;k++) 
																				{%>
                                  <option  value="<%=k%>"><%=k%></option>
                                  <%}
																				%>
                                </select>
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <div class="row"> <span class="label">Gender:</span> <span class="floatLeft">
                                <input type="radio" size="10" name="gender4" id="gender4" value="male" />
                                Male
                                <input type="radio" size="10" name="gender4" id="gender4" value="female" />
                                Female
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <div class="row"> <span class="label">Phone:</span> <span class="formX">
                                <input name="phone4" id="phone4" type="text" class="textboxOne" size="15" maxlength="30" />
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <div class="row"> <span class="label">Mobile:</span> <span class="formX">
                                <input name="mobile4" id="mobile4" type="text" class="textboxOne" size="15" maxlength="30" />
                              </span> </div>
                              <div class="row"> <span class="label">Fax:</span> <span class="formX">
                                <input name="fax4" id="fax4" type="text" class="textboxOne" size="15" maxlength="40" />
                              </span> </div>
                              <div class="row"> <span class="label">EMail :</span> <span class="formX">
                                <input type="text" name="email4" id="email4" class="textboxOne" size="25" maxlength="40" />
                                &nbsp;<span class="asterisk">*</span></span> </div>
                              <!--// Family Memb Two // -->
                            </div>
                            <div id="member4">
                              <div class="row"> <span class="label">Member ID:</span> <span class="formX">
                                <input name="memberAdd4" id="memberAdd4" type="text" class="textboxOne" size="20" onblur="membDetails4(this);" />
                                <span class="asterisk">*</span> </span> </div>
                              <div class="row"> <span class="label">First Name:</span> <span class="formX">
                                <input name="firstName" class="textboxOne" id="firstNameAdd4" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                              </span> </div>
                              <div class="row"> <span class="label">Last Name:</span> <span class="formX">
                                <input name="lastName" class="textboxOne" id="lastNameAdd4" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" />
                              </span> </div>
                              <div class="row"> <span class="label">Phone: (Last 4 digits)</span> <span class="formX"><strong>xxx-xxx-</strong>
                                    <input name="phone" class="textboxOne" id="phoneAdd4" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="8" readonly="readonly" />
                              </span> </div>
                            </div>
                            <div class="colspan"> <strong>Amateur Rider Declaration:</strong> </div>
                            <div id="commonBG" style="padding:8px;"> <strong>USEF Rules for Eventing Appendix 3, Section, 2.4:</strong><br />
                                <br />
                                <blockquote> AMATEUR RIDER (AR) - For the purposes of Eventing, an Amateur is a Senior Rider whose remuneration from the activities listed in GR808 does not exceed $2,500.00 in either the preceding or current calendar year. In order to compete as an Amateur a rider must possess either a USEF Amateur Card or have on file in the office a signed affidavit stating that he/she is in compliance with the above definition. Amateurs in Eventing are subject to the relevant provisions of GR809-810. </blockquote>
                              <br />
                                <br />
                                <strong>By typing in my full name in the box below, I hearby declare that I am eligible for Amateur status under the conditions set forth in the above USEF rule.</strong> </div>
                            <div class="row"> <span class="label">Name (Type full name):</span> <span class="formX">
                              <input name="nameAmat4" id="nameAmat_id" type="text" class="textboxOne" size="20" />
                            </span> </div>
                            <div class="row"> <span class="label"><strong>Select option that applies to you:</strong></span> </div>
                            <div class="row" style="height:50px;"> <span class="floatLeft">
                              <input type="checkbox" size="10" name="amatCrdPoss4" id="amatCrdPoss4" value="yes" onclick="tempValidate4();" />
                              I am in the possession of a current USEF Amateur Card. <br />
                              <input type="checkbox" size="10" name="amatCrdElig4" id="amatCrdElig4" value="yes" onclick="tempValidate4();" />
                              I am declaring my Amateur Status Eligibility with only. </span> </div>
                            <div id="commonBG" style="padding:8px;"> <span class="styleBoldTwo">NOTE:</span> A person's Amateur status must be declared for each competition season. To be eligible for the U.S. Eventing Association Year-End Awards, <b>this section must be completed</b> and <b>signed</b>. </div>
                            <!-- spacer starts-->
                            <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                            <!--++++++++++++++++++++ Part C of the form Ends here ++++++++++++++++++++++++++++++ -->
                          </div>
                          <div id="part6" class="holderDivThree" >
                            <!--++++++++++++++++++++ Part D of the form starts here ++++++++++++++++++++++++++++++ -->
                            <div id="publi">
                              <div class="rowHead"> Publication Mailing Options: </div>
                              <div class="tblDescrp"> <span class="labelFull"> Please check the appropriate boxes below to receive publications at your preferred mailing address: </span> </div>
                              <div class="row"> <span class="labelFull">
                                <input type="checkbox" name="mailOptQuesti" id="mailOptQuesti" value="" onclick="unhideMailOpts('hideMail','mailOptQuesti');clrAmt();Sumup();"/>
                                Do not send any publications. </span> </div>
                              <%
																		int chkInd=0;
																		String chk_id="";
																		
																		ArrayList DispPublication= (ArrayList)request.getAttribute("DispPubDetails");
																		//out.print("DispPublication" + DispPublication);
																		if(DispPublication.size()!=0 && DispPublication!=null)
																		{%>
                              <div class="row" id="hideMail">
                                <%
																		Iterator itr = DispPublication.iterator();
																		
																		while(itr.hasNext()){
																		HLCPublicationVO donObj = (HLCPublicationVO) itr.next();
																		String publicationId = donObj.getPublicationId();
																		String publicationName = donObj.getPublicationName();
																		chk_id="mailOpt1"+chkInd;
																		
																		%>
                                <div class="row"> <span class="labelFull">
                                  <input type="checkbox" name="mailOpt1" id="<%=chk_id%>" value="<%=publicationId%>" onclick="mailAmt();"/>
                                  <%=publicationName%>. </span> </div>
                                <%chkInd++;}%>
                              </div>
                              <input type="hidden" value="<%=DispPublication.size()%>" name="pub_ct" />
                              <%}%>
                            </div>
                            <input type="hidden" name="subsMailExist" value="0" />
                            <div id="subscriberPubli">
                              <div class="rowHead"> Publication Mailing Options: </div>
                              <div class="tblDescrp"> <span class="labelFull"> Please check the appropriate boxes below to receive publications at your preferred mailing address: </span> </div>
                              <div class="row"> <span class="labelFull">
                                <input type="checkbox" name="mailOptQuestion" id="mailOptQuestion" value="" onclick="unhideMailOpts('hidesubsMail','mailOptQuestion');clrAmt();Sumup();"/>
                                Do not send any publications. </span> </div>
                              <%
																		int chkInd1=0;
																		String chk_id1="";
																		
																		ArrayList DispPublication1= (ArrayList)request.getAttribute("DispPubDetails");
																		//out.print("DispPublication" + DispPublication);
																		if(DispPublication1.size()!=0 && DispPublication1!=null)
																		{%>
                              <div class="row" id="hidesubsMail">
                                <%
																		Iterator itr2 = DispPublication1.iterator();
																		
																		while(itr2.hasNext()){
																		HLCPublicationVO donObj = (HLCPublicationVO) itr2.next();
																		String publicationId = donObj.getPublicationId();
																		String publicationName = donObj.getPublicationName();
																		chk_id1="submailOpt1"+chkInd1;
																		
																		if(publicationName.trim().equalsIgnoreCase("Send Me Eventing USA magazines")){
																		%>
                                <div class="row"> <span class="labelFull">
                                  <input type="checkbox" name="submailOpt1" id="<%=chk_id1%>" value="<%=publicationId%>" onclick="mailAmt();"/>
                                  <%=publicationName%>. </span> </div>
                                <%chkInd1++;
																		}
																	}
																	
																%>
                              </div>
                              <input type="hidden" value="<%=DispPublication1.size()%>" name="pub_ct1" />
                              <%}%>
                            </div>
                            <div class="row">
                              <%
                                                                                                                                   String ctry="";
                                                                                                                                   
                                                                                                                                if(country!=null)
                                                                                                                                {
                                                                                                                                    ctry=country;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                    ctry="NA";
                                                                                                                                }%>
                              <!--div class="row" id="mAddress1"-->
                              <div id="mAddress1" class="rowTwo"> <span class="label">Additional Mailing Charges:</span> <span class="formX">
                                <input type="text" name="country" value="<%=ctry%>" class="readOnly" size="25" readonly="true" />
                                &nbsp; <strong>$</strong>&nbsp;
                                <input name="ctryAmt" id="amountTwo_txt" class="readOnly" type="text" size="5" readonly="true" value="0"/>
                              </span> </div>
                            </div>
                          </div>
                          <!-- <div class="rowHead">
														Additional Options:
													</div>
									
														<div class="row">
																	<strong>Arm Band:</strong>													    </div>														
															<span class="label">Armband Quantity:</span>
															<span class="formX"><input type="text" name="armbandQty" id="armbandQty" value="0" class="textboxOne" size="5" onblur="bandPrice();"/>&nbsp;<span> ($ 5 Per Band)&nbsp;</span>&nbsp; <strong>$</strong>
																  <input type="text" name="armband" id="armband" value="0" readonly class="textboxOne" size="10"/>
								  </span> -->
                          <div class="spacer">&nbsp;</div>
                          <%
              
			  int si=0;
			  String logBy="user";
			                                                                                                                      if(session.getAttribute("loggedBy")!=null)
              {
				 																																                  String loggedBy="";
																																								                  loggedBy=(String)session.getAttribute("loggedBy");
				  logBy=loggedBy;
				   																																                  if(loggedBy.equalsIgnoreCase("Admin"))																																						                  {
                                                                                                                                     %>
                          <div id="phoneReg">
                            <div class="rowHead"> Phone Registration Information: </div>
                            <%  
                                int chksfx=0;
                                String cbx="classification";
                                Vector horsesertypVect = new Vector();

                                horsesertypVect =(Vector)request.getAttribute("serviceTypeVect");
								 								 
								 if(horsesertypVect!=null)
                                 {
                                 si=horsesertypVect.size();
								 System.out.print("horsesertypVect.size() :"+si);
                        
                                    if(si!=0)
                                    {
                                 Enumeration itrate= (Enumeration)horsesertypVect.elements();
                                 while(itrate.hasMoreElements()){
                            
                                String[] sarray1 = (String[]) itrate.nextElement();
                                String memberTypeId1 = sarray1[0];
                                String membershipName1 = sarray1[1];
                                String membershipAmount1 = sarray1[2];
                                String cn=memberTypeId1+"#"+membershipName1+"#"+membershipAmount1;
                                String cbxname=cbx+Integer.toString(chksfx);
                                System.out.println(" serviceTypeId1#serviceName1#serviceAmount1 :"+cn);
								
                         %>
                            <div class="row"> <span class="floatLeft">
                              <input type="checkbox" id="<%=cbxname%>" name="<%=cbxname%>" value="<%=cn%>" size="10" onclick="Sumup();" />
                            </span> <span class="floatLeftRadio"> <%=membershipName1%> </span> <span class="floatRight"><strong><%=membershipAmount1%></strong>&nbsp;&nbsp;</span> </div>
                            <%chksfx++;}}}
						  
						  %>
                          </div>
                          <%}%>
                          <div class="rowHead"> Payment Information: </div>
                          <div class="row"> <span class="label">Total Amount:</span> <span class="formX"><strong>$</strong>
                                <input name="tot_amt" id="totalAmount" type="text" class="textboxOne" value="0" readonly="readonly" size="10" />
                            &nbsp; U.S. Dollars</span> </div>
                          <div class="row"> <span class="floatLeft">
                            <input type="radio" size="10" name="r11" value="check" onclick="switchDiv('chkEnc'), showHideRadio('r11','chrgCrd','check'),clrRad(),hideImgDiv('cvvImg');" />
                            Check enclosed.
                            <input type="radio" size="10" name="r11" value="card" checked="checked" onclick="switchDiv('chrgCrd'), showHideRadio('r11','chkEnc','card'),clrRad(),showImgDiv('cvvImg');" />
                            Please charge my card. </span> </div>
                          <input type="hidden" name="cc11" id="cc11" value="adsec1"/>
                          <div id="chkEnc">
                            <div class="colspan"> <strong>Check Details:</strong> </div>
                            <div class="tblDescrp">
                              <p> If paying by check , please mail your payment to: <br />
                                  <br />
                                  <strong> <br />
                                    Member Registration <br />
                                    525 Old Waterford Road, NW <br />
                                    Leesburg, VA 20176 </strong><br />
                                <br />
                                <strong>Note:</strong> <span class="styleBoldOne">Your registration status will be pending until check is processed.</span> <br />
                                <br />
                              </p>
                            </div>
                            <div class="row"> <span class="label">Check Amount :</span> <span class="formX">
                              <input name="chckAmount" id="chckAmount" type="text" class="textboxOne"  size="30" maxlength="60" />
                            </span> </div>
                            <div class="row"> <span class="label">Check No:</span> <span class="formX">
                              <input name="checkNo" type="text" id="txtChNumber" class="textboxOne"  size="16" maxlength="25" />
                              <span class="asterisk">*</span> </span> </div>
                            <%
																		    String chkDat2="";
																		
																			java.util.Calendar c6 = java.util.Calendar.getInstance();
																			int dyChk = c6.get(Calendar.DATE);
																			int mnth = c6.get(Calendar.MONTH);
																			
																			int mnthChk = mnth+1;
																			int yrChk = c6.get(Calendar.YEAR);
																			
																			if(mnthChk<10)
																			{
																				chkDat2 = "0"+mnthChk+"/"+dyChk+"/"+yrChk;
																			}
																			else
																			{
																				
																				chkDat2 = mnthChk+"/"+dyChk+"/"+yrChk;
																			}
																			%>
                            <div class="row"> <span class="label">Check Date:</span> <span class="formX">
                              <input name="checkDate" type="text" id="checkDate"  class="textboxOne" value="<%=chkDat2%>"  size="10" />
                              <span class="asterisk">*</span><a href="javascript:cal1.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a></span></div>
                            <div class="row"> <span class="label">Activation Date:</span> <span class="formX">
                              <input name="activeDate" type="text" id="activeDate"  class="textboxOne" value="<%=chkDat2%>"  size="10" />
                              <span class="asterisk">*</span><a href="javascript:cal2.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /> </a></span></div>
                            <div class="row"> <span class="label">Bank Name :</span> <span class="formX">
                              <input name="inFavorof" id="inFavorof" type="text" class="textboxOne"  size="30" maxlength="60" />
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">Name on Check:</span> <span class="formX">
                              <input name="nameOnchk" id="nameOnchk" type="text" class="textboxOne"  size="30" maxlength="25" />
                              <span class="asterisk">*</span> </span> </div>
                          </div>
                          <div id="chrgCrd">
                            <div class="colspan"> <strong>Card Details:</strong> </div>
                            <div class="row"> <span class="label">Card Type:</span> <span class="formX">
                              <select name="cardselect" id="ccTypeId" class="selectboxOne" >
                                <option selected="selected">Select One</option>
                                <option value="Visa">Visa</option>
                                <option value="MasterCard">Master Card</option>
                                <option value="American Express">AmEx</option>
                              </select>
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">Card No:</span> <span class="formX">
                              <input name="cardNo" type="text" class="textboxOne" id="txtCard" size="20" maxlength="16" />
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">CVV No.:</span> <span class="formX">
                              <input name="cVVNo" type="text" class="textboxOne" id="txtCvvId" size="5" maxlength="4" />
                              &nbsp;(see details below) </span> </div>
                            <div class="row"> <span class="label">Print Name On Card:</span> <span class="formX">
                              <input name="printName" type="text" class="textboxOne" id="txtPrName" size="25" maxlength="40" />
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">Activation Date:</span> <span class="formX">
                              <input name="activeDate2" type="text" id="activeDate2"  class="textboxOne" value="<%=chkDat2%>"  size="10" />
                              <span class="asterisk">*</span><a href="javascript:cal3.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /> </a></span></div>
                            <div class="row"> <span class="label">Expiry Date:</span> <span class="formX">
                              <select name="expirymonth" id="selExpMonthId" class="selectboxOne">
                                <option value="" selected="selected">Month</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                              </select>
                              <select name="expiryyear" id="selExpYearId" class="selectboxOne">
                                <option value="" selected="selected" >Year</option>
                                <%
																				java.util.Calendar c5 = java.util.Calendar.getInstance();
																				//int day = c.get(Calendar.DAY);
																				//int month = c.get(Calendar.MONTH);
																				int year5 = c5.get(Calendar.YEAR);
																				//String date = day+" / "+month+" / "+year;
																				System.out.println("Current Date = "+year5);

																				for(int f=year5;f<=year5+15;f++) 
																				{%>
                                <option  value="<%=f%>"><%=f%></option>
                                <%}
																				%>
                              </select>
                              <span class="asterisk">*</span> </span> </div>
                          </div>
                          <%
								 }else{%>
                          <div class="rowHead"> Payment Information: </div>
                          <div class="row"> <span class="label">Total Amount:</span> <span class="formX"><strong>$</strong>
                                <input name="tot_amt" id="totalAmount" type="text" class="textboxOne" value="0" readonly="readonly" size="10" />
                            &nbsp; U.S. Dollars</span> </div>
                          <div class="row"> <span class="floatLeft">
                            <input type="radio" size="10" name="r11" value="card" checked="checked" onclick="switchDiv('chrgCrd'),showImgDiv('cvvImg');" />
                            Please charge my card. </span> </div>
                          <input type="hidden" name="cc11" id="cc11" value="usrsec2"/>
                          <div id="chrgCrd">
                            <div class="colspan"> <strong>Card Details:</strong> </div>
                            <div class="row"> <span class="label">Card Type:</span> <span class="formX">
                              <select name="cardselect" id="ccTypeId" class="selectboxOne" >
                                <option selected="selected">Select One</option>
                                <option value="Visa">Visa</option>
                                <option value="MasterCard">Master Card</option>
                                <option value="American Express">AmEx</option>
                              </select>
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">Card No:</span> <span class="formX">
                              <input name="cardNo" type="text" class="textboxOne" id="txtCard" size="20" maxlength="16" />
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">CVV No.:</span> <span class="formX">
                              <input name="cVVNo" type="text" class="textboxOne" id="txtCvvId" size="5" maxlength="4" />
                              <span class="asterisk">*</span>&nbsp;(see details
                              below) </span> </div>
                            <div class="row"> <span class="label">Print Name On Card:</span> <span class="formX">
                              <input name="printName" type="text" class="textboxOne" id="txtPrName" size="25" maxlength="40" />
                              <span class="asterisk">*</span> </span> </div>
                            <div class="row"> <span class="label">Expiry Date:</span> <span class="formX">
                              <select name="expirymonth" id="selExpMonthId" class="selectboxOne">
                                <option value="" selected="selected">Month</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                              </select>
                              <select name="expiryyear" id="selExpYearId" class="selectboxOne">
                                <option value="" selected="selected" >Year</option>
                                <%
																				java.util.Calendar c5 = java.util.Calendar.getInstance();
																				//int day = c.get(Calendar.DAY);
																				//int month = c.get(Calendar.MONTH);
																				int year5 = c5.get(Calendar.YEAR);
																				//String date = day+" / "+month+" / "+year;
																				System.out.println("Current Date = "+year5);

																				for(int f=year5;f<=year5+15;f++) 
																				{%>
                                <option  value="<%=f%>"><%=f%></option>
                                <%}
																				%>
                              </select>
                              <span class="asterisk">*</span> </span> </div>
                          </div>
                          <%}%>
                          <input type="hidden" name="cbxct" value="<%=si%>" />
                          <input type="hidden" name="logBy" value="<%=logBy%>" />
                          <input type="hidden" name="totDonaAmt"/>
                          <input type="hidden" name="armbandQty" value="0" />
                          <input type="hidden" name="armband" value="0" />
                          <div class="alignCenter"> <span>
                            <input name="submit" type="submit" class="gradBtn" value="Become A Member" />
                          </span> </div>
                          <br/>
                          <div id="cvvImg" class="alignCenter"> <span class="label">&nbsp;</span> <span class="formX"> <img src="images/cvv_graphic.jpg" /> </span> </div>
                          <!--++++++++++++++++++++ Part D of the form Ends here ++++++++++++++++++++++++++++++ -->
                        </div>
                      </form>
                    </div>
                  <!-- CONTENTS END HERE -->
                </td>
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
<script language="javascript">
<%  if(session.getAttribute("loggedBy")!=null){	%>
	var cal1 = new calendar2(document.forms['myform'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	if(document.getElementById('activeDate'))
	{
	var cal2= new calendar2(document.forms['myform'].elements['activeDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	}
if(document.getElementById('activeDate2'))
	{
	var cal3= new calendar2(document.forms['myform'].elements['activeDate2']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	}
	
	<%}%>
	</script>
</html>
