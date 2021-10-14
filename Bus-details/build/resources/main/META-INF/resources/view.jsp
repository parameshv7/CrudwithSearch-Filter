<%@page import="com.liferay.portal.kernel.dao.search.DisplayTerms"%>
<%@ include file="init.jsp"%>

<liferay-portlet:renderURL varImpl="iteratorURL">
	<portlet:param name="mvcPath" value="/view.jsp" />
</liferay-portlet:renderURL>


<liferay-portlet:renderURL varImpl="addbusURL">
	<portlet:param name="mvcPath" value="/addbus.jsp" />
</liferay-portlet:renderURL>


<!--<portlet:resourceURL var="searchURL" />-->


<liferay-portlet:actionURL name="partySearch" var="partySearchURL">
	<portlet:param name="mvcActionCommand" value="partySearch" />
</liferay-portlet:actionURL>


<aui:button onClick="${addbusURL}" value="add-Bus"></aui:button>

<aui:form action="${partySearchURL}" method="post" name="form">
	<liferay-ui:search-toggle buttonLabel="search"
		displayTerms="<%=new DisplayTerms(renderRequest)%>" id="advanceSearch">
		<aui:input type="text" name="busName" />
		<aui:input type="text" name="busCompany" />
		<aui:input type="text" name="busPrice" />
	</liferay-ui:search-toggle>
</aui:form>
<liferay-ui:search-container delta="5" deltaConfigurable="true"
	emptyResultsMessage="no-buses">
	<liferay-ui:search-container-results results="${busList}" />

	<liferay-ui:search-container-row className="com.bus.service.model.Bus"
		modelVar="bus">
		<liferay-ui:search-container-column-text name="busName"
			property="busName" />

		<liferay-ui:search-container-column-text name="busCompany"
			property="busCompany" />

		<liferay-ui:search-container-column-text name="busPrice"
			property="busPrice" />


		<liferay-ui:search-container-column-text name="Update">
			<liferay-portlet:renderURL varImpl="editURL">
				<portlet:param name="mvcPath" value="/addbus.jsp" />
				<portlet:param name="busId" value="${bus.busId}" />
				<a href="${editURL }">EDIT</a>
			</liferay-portlet:renderURL>
		</liferay-ui:search-container-column-text>
		<liferay-ui:search-container-column-text name="Delete">
			<liferay-portlet:actionURL name="deletebus" var="delURL">
				<portlet:param name="busId" value="${bus.busId}" />
			</liferay-portlet:actionURL>
			<a href="${delURL }">DELETE</a>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
<%-- <aui:script>
	function search(){
	console.log("search");
	var searchText = $("#<portlet:namespace />searchText").val();
	console.log("searchText:::"+searchText);
	   	$.ajax({
	   		  url : '${searchURL}', 
	          type: 'post',
	           data: {
	       	   <portlet:namespace />searchText: searchText,
	           },
               success: function(data) {
               		console.log("dfsdfdg::::"+data);
                }
	    });
	}
</aui:script> --%>