<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Mura ORM</title>
	</head>
	<body>

		<!--- New School --->
		<cfscript>
			// Mura Scope
				m = application.mura.getBean('m').init('temp-demo');

			// A Person
				person = m
									.getBean('person')
									.set('namelast', 'Withington')
									.set('namefirst', 'Stephen')
									.save();
		</cfscript>

		<!--- Old School --->
		<cfquery name="rsPersons">
			select * from custom_persons;
		</cfquery>
		<cfdump var="#rsPersons#" />

	</body>
</html>