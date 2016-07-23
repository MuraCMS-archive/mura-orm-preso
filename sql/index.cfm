<!--- Uncomment this query to drop all of the custom bean tables created by this ORM example, then point your browser directly to this file. --->
<!---
<cftry>
	<cfquery datasource="#application.configBean.getDatasource()#">
	DROP TABLE IF EXISTS `custom_persons`;
	DROP TABLE IF EXISTS `custom_personaddresses`;
	DROP TABLE IF EXISTS `custom_personphonenumbers`;
	</cfquery>
	<h3>All custom tables have been dropped</h3>
	<cfcatch>
		<cfdump var="#cfcatch#" />
	</cfcatch>
</cftry>
--->

<!--- To inspect the records created, uncomment this method --->
<!--- 
<cftry>
	<cfquery name="rs" datasource="#application.configBean.getDatasource()#">
	SELECT * FROM `custom_persons`;
	-- SELECT * FROM `custom_personaddresses`;
	-- SELECT * FROM `custom_personphonenumbers`;
	</cfquery>
	<cfdump var="#rs#"> 
	<cfcatch>
		<cfdump var="#cfcatch#" />
	</cfcatch>
</cftry>
--->