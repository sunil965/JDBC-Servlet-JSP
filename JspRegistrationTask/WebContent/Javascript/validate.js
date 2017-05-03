function validateUserReg() {
	var uid = document.myform.uid.value;
	var name = document.myform.user.value;
	var password = document.myform.password.value;
	var x = document.myform.mail.value;
	var atposition = x.indexOf("@");
	var dotposition = x.lastIndexOf(".");

	if (uid == null || uid == "") {
		alert("UID can't be blank");
		return false;
	}
	if (name == null || name == "") {
		alert("Name can't be blank");
		return false;
	}
	if (password == null || password == "" || password.length < 6) {
		alert("Password must be at least 6 characters long.");
		return false;
	}
	if (atposition < 1 || dotposition < atposition + 2
			|| dotposition + 2 >= x.length) {
		alert("Please enter a valid e-mail address \n atpostion:" + atposition
				+ "\n dotposition:" + dotposition);
		return false;
	}
	return true;
}