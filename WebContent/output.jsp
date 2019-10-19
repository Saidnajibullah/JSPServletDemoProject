<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- this called expression tags; we can use only if the code does not exceed one line -->
	<!--<h1>Welcomerequest.getAttribute("firstname")e") %>request.getAttribute("lastname")e") %></h1>-->


	<!-- this pair of tags is called JSP scriptlet which allows us to write any Java code -->
	<!-- writing Java code inside an HTML file is not considered a good practice anymore. -->

	<%
		String firstname = request.getAttribute("firstname").toString();
		String lastname = request.getAttribute("lastname").toString();
	%>

	<!-- this pair of tag is called JSP declaration -->
	<%!int sum(int num1, int num2) {
		return num1 + num2;
	}%>
	<h1>
		Welcome
		<%=firstname%>
		<%=lastname%></h1>
	<h3>
		4 + 5 =
		<%=sum(4, 5)%></h3>
	<h1>Using EL Expressions and JSTL</h1>
	<h3>JSTL Stands for JSP Tags Library</h3>
	<h4>JSTL Tags are categorized as following:</h4>
	<ul>
		<li>Core Tags</li>
		<li>Formating Tags</li>
		<li>SQL Tags</li>
		<li>XML Tags</li>
		<li>JSTL Functions</li>
	</ul>
	<p>To enable useing JSTL we need to download and add the jar file
		into the class path of the project. After that, we need to reference
		the file into our JSP file. see the picture below:</p>
	<img alt="JSTL Reference Picture" src="jstl.reference.PNG">
	<p>this is an EL expression ${4 + 4}</p>
	<p>this is an EL expression ${4 - 4}</p>
	<p>this is an EL expression ${4 * 4}</p>
	<p>this is an EL expression ${4 / 4}</p>
	<p>this is an EL expression: my name is ${firstname} ${lastname}</p>
	<!-- Below I access the student object directly without the need to to write request.getAttribute...
		this is one of the advantages of EL expression -->
	<p>This student id and name is accessed with EL expression: ${ student.id }
		${ student.name }</p>
	<!-- using JSTL tags -->

	<c:out value="My name is Saidnajibullah Hashimi"></c:out>
	<h3>Displaying List of the Countries Stored in an Array Using The
		forEach loop of JSTL</h3>
	<ul>
		<!-- forEach loop can be used with collections as well -->
		<c:forEach items="${ countries }" var="country">
			<li>${ country }</li>
		</c:forEach>
	</ul>
	<h3>Using JSTL if tag</h3>
	<c:if test="${5 < 9}">
		<p>5 is smaller than 9</p>
	</c:if>
	<h3>Using JSTL choose tag</h3>
	<c:set var="score" value="1000"></c:set>
	<!-- chose tag is used instead of if-else -->
	<c:choose>
		<c:when test="${socre > 1000}">
			<p>score is more that 1000</p>
		</c:when>
		<c:otherwise>
			<p>Score is less that or equal to 1000</p>
		</c:otherwise>
	</c:choose>
	<!-- search google for jstl reference for a comprehensive understanding of the library -->
	<p><c:out value="${fn:toLowerCase('MY NAME IS SOMETHING')}"></c:out></p>
	<p><c:out value="${fn:toUpperCase('my name is something')}"></c:out></p>
	<p><c:out value="${fn:length('MY NAME IS SOMETHING')}"></c:out></p>
	<p><c:out value="${fn:join(countries, ' ;')}"></c:out></p>

</body>
</html>