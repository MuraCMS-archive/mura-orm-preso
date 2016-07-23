<!--- Uncomment this query to drop all of the custom bean tables created by this ORM example, then point your browser directly to this file. --->
<!--- 
<cfquery datasource="#application.configBean.getDatasource()#">
DROP TABLE IF EXISTS `custom_persons`;
DROP TABLE IF EXISTS `custom_personaddresses`;
DROP TABLE IF EXISTS `custom_personphonenumbers`;
</cfquery>
 --->

 <!--- To inspect the records created, uncomment this method --->
<!--- 
<cfquery name="rs" datasource="#application.configBean.getDatasource()#">
SELECT * FROM `custom_persons`;
-- SELECT * FROM `custom_personaddresses`;
-- SELECT * FROM `custom_personphonenumbers`;
</cfquery>

<cfdump var="#rs#"> 
--->