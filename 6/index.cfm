<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Mura ORM</title>
		<style>
			body {
				padding: 1em;
			}
			div.person-wrapper {
				font-family: sans-serif;
				border-bottom: 1px solid black;
				margin: 0.5em 0;
				padding: 0.5em 0;
			}
		</style>
	</head>
	<body>

		<!--- New School --->
		<cfscript>
			// Mura Scope
				m = application.mura.getBean('m').init('temp-demo');

			// A Person
				person = m
									.getBean('person')
									.loadby(namelast='Withington')
									.set('namelast', 'Withington')
									.set('namefirst', 'Steve');

				person.save();

			// Home Phone
				itPhoneNumber = m
												.getFeed('personphonenumber')
												.where()
												.prop('phonenumber')
												.isEQ('916.555.1212')
												.andProp('personid')
												.isEQ(person.get('personid'))
												.getIterator();

				phoneNumber = itPhoneNumber.hasNext() ? itPhoneNumber.next() : m.getBean('personphonenumber');
				phoneNumber
					.set('phonetype', 'Home')
					.set('phonenumber', '916.555.1212');

				person.addPhoneNumber(phoneNumber);


			// Mobile Phone
				itPhoneNumber = m
												.getFeed('personphonenumber')
												.where()
												.prop('phonenumber')
												.isEQ('916.555.1010')
												.andProp('personid')
												.isEQ(person.get('personid'))
												.getIterator();

				phoneNumber = itPhoneNumber.hasNext() ? itPhoneNumber.next() : m.getBean('personphonenumber');
				phoneNumber
					.set('phonetype', 'Mobile')
					.set('phonenumber', '916.555.1010');

				person.addPhoneNumber(phoneNumber);


			// Home Address
				itAddress = m
										.getFeed('personaddress')
										.where()
										.prop('street1')
										.isEQ('2222 22nd Street')
										.andProp('personid')
										.isEQ(person.get('personid'))
										.getIterator();

				address = itAddress.hasNext() ? itAddress.next() : m.getBean('personaddress');
				address
					.set(
						{
							'addresstype'='Home'
							, 'street1'='2222 22nd Street'
							, 'city'='Sacramento'
							, 'state'='CA'
							, 'zip'='95816'
						}
					);

				person.addAddress(address);


			// Office Address
				itAddress = m
										.getFeed('personaddress')
										.where()
										.prop('street1')
										.isEQ('2110 K Street')
										.andProp('personid')
										.isEQ(person.get('personid'))
										.getIterator();

				address = itAddress.hasNext() ? itAddress.next() : m.getBean('personaddress');
				address
					.set(
						{
							'addresstype'='Office'
							, 'street1'='2110 K Street'
							, 'city'='Sacramento'
							, 'state'='CA'
							, 'zip'='95816'
						}
					);

				person.addAddress(address);

			// SAVE!
				person.save();

	// Feed
		personFeed = m.getFeed('person').setMaxItems(0).setNextN(0); 

	// Iterator
		itPersons = personFeed.getIterator();

		if ( !itPersons.hasNext() ) {
			WriteOutput('<h1>No persons exist</h1>');
		}

		while(itPersons.hasNext()) {
			thisPerson = itPersons.next();

			WriteOutput('<div class="person-wrapper"><h2>' & thisPerson.get('namefirst') & ' ' & thisPerson.get('namelast') & '</h2>');

			// addresses
				itAddresses = thisPerson.getAddresses();

				if ( itAddresses.hasNext() ) {
					addressTitle = itAddresses.getRecordcount() == 1 ? 'Address' : 'Addresses';
					WriteOutput('<h3>#addressTitle#</h3><ul>');
					while(itAddresses.hasNext()) {
						address = itAddresses.next();
						WriteOutput('<li>');
							WriteOutput(
								'<strong>' 
								& address.get('addresstype') 
								& ':</strong> ' 
								& address.get('street1') 
								& ', ' 
								& address.get('city') 
								& ', ' 
								& address.get('state') 
								& ' ' 
								& address.get('zip')
							);
						WriteOutput('</li>');
					}
					WriteOutput('</ul>');
				}

			// phonenumbers
				itPhoneNumbers = thisPerson.getPhoneNumbers();

				if ( itPhoneNumbers.hasNext() ) {
					phoneNumberTitle = itPhoneNumbers.getRecordcount() == 1 ? 'Phone Number' : 'Phone Numbers';
					WriteOutput('<h3>#phoneNumberTitle#</h3><ul>');
					while(itPhoneNumbers.hasNext()) {
						phoneNumber = itPhoneNumbers.next();
						WriteOutput('<li>');
							WriteOutput(
								'<strong>' 
								& phoneNumber.get('phonetype') 
								& ':</strong> ' 
								& phoneNumber.get('phonenumber')
							);
						WriteOutput('</li>');
					}
					WriteOutput('</ul>');
				}

				WriteOutput('</div>');

			}
		</cfscript>

	</body>
</html>