component extends="mura.cfobject" {

	// This is a custom event handler ... place any event handlers/listeners you wish here!

	public any function onPageBodyRender(struct m) {
		m.content('body', '<h2>You have been hacked!</h2>');
		return m.content('body');
	}

}