<%@ include file="/init.jsp" %>

<portlet:actionURL name="addbus" var="addbusUrl"/>

<c:choose>
	<c:when test="${bus eq null}">
		<h2>Add Bus!!!</h2>
	</c:when>
	<c:otherwise>
		<h2>Update Bus!!</h2>
	</c:otherwise>
</c:choose>

<aui:form action="${addbusUrl}" name="add-bus" method="Post">
<aui:input name="busId" type="hidden" value='${bus ne null? bus.busId:"0" }'/>
<aui:input name="busName" value='${bus ne null? bus.busName:"" }'/>
<aui:input name="busCompany" value='${bus ne null? bus.busCompany:"" }'/>
<aui:input name="busPrice" value='${bus ne null? bus.busPrice:"" }'/>
<aui:button type="submit" value="add"></aui:button>
</aui:form>