<html>
	<head>
		<title>Mura ORM</title>
	</head>
	<body>

		<!--- Old School --->
		<cfquery name="rsNew">
			INSERT INTO custom_persons (
				namelast
				, namefirst
				, personid
			) VALUES (
				'Grant'
				, 'Shepert'
				, '#CreateUUID()#'
			);
		</cfquery>

		<!--- Old School --->
		<cfquery name="rsPersons">
			select * from custom_persons;
		</cfquery>

		<cfdump var="#rsPersons#" />

	</body>
</html>