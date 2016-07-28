<cfscript>
	dsn = application.configBean.getDatasource();
	param name="url.drop" default="0";
	param name="url.seepersons" default="0";
	param name="url.seeaddresses" default="0";
	param name="url.seephones" default="0";
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<title>Mura ORM</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<style>
	* {
		-webkit-border-radius: 0 !important;
     -moz-border-radius: 0 !important;
          border-radius: 0 !important;
	}
	body {
  	min-height: 2000px;
  	padding-top: 70px;
	}
	/* custom lucee dump styling */
	.-lucee-dump table, .-lucee-dump table td.h1, .-lucee-dump table td.h3 {
		font-size: 10px !important;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./">Mura ORM</a>
			</div>

			<div class="collapse navbar-collapse" id="main-nav">
				<ul class="nav navbar-nav">
					<li><a href="./?drop=1">Drop Tables</a></li>
					<li><a href="./?seepersons=1">View Persons</a></li>
					<li><a href="./?seeaddresses=1">View Addresses</a></li>
					<li><a href="./?seephones=1">View Phones</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<cfif url.drop>
					<cftry>
						<cfquery datasource="#dsn#">
							DROP TABLE IF EXISTS `custom_persons`;
							DROP TABLE IF EXISTS `custom_personaddresses`;
							DROP TABLE IF EXISTS `custom_personphonenumbers`;
						</cfquery>
						<p class="alert alert-success">custom_persons, custom_personaddresses, and custom_personphonenumbers tables have been dropped</p>
						<cfcatch>
							<cfdump label="drop tables error" var="#cfcatch#" />
						</cfcatch>
					</cftry>
				</cfif>

				<cfif url.seepersons>
					<cftry>
						<cfquery name="rspersons" datasource="#dsn#">
							SELECT * FROM `custom_persons`;
						</cfquery>
						<cfdump label="rspersons" var="#rspersons#" /> 
						<cfcatch>
							<cfdump label="rspersons error" var="#cfcatch#" />
						</cfcatch>
					</cftry>
				</cfif>

				<cfif url.seeaddresses>
					<cftry>
						<cfquery name="rsaddresses" datasource="#dsn#">
							SELECT * FROM `custom_personaddresses`;
						</cfquery>
						<cfdump label="rsaddresses" var="#rsaddresses#" /> 
						<cfcatch>
							<cfdump label="rsaddresses error" var="#cfcatch#" />
						</cfcatch>
					</cftry>
				</cfif>

				<cfif url.seephones>
					<cftry>
						<cfquery name="rsphones" datasource="#dsn#">
							SELECT * FROM `custom_personphonenumbers`;
						</cfquery>
						<cfdump label="rsphones" var="#rsphones#" /> 
						<cfcatch>
							<cfdump label="rsphones error" var="#cfcatch#" />
						</cfcatch>
					</cftry>
				</cfif>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>