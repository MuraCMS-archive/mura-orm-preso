<html>
	<head>
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
									.set('namelast', 'Levine')
									.set('namefirst', 'Matt')
									.save();

				WriteDump(person.getAllValues());

			rsPersons = m.getFeed('person').getQuery();
			WriteDump(rsPersons);
		</cfscript>

	</body>
</html>