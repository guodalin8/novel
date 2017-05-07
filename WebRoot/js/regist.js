function check(form){
	var authorName=regist.txtUserName.value;
	var authorPassword=regist.txtPassword.value;
	var rePassword=regist.txtPassword2.value;
	var email=regist.txtEmail.value;
	var atpos=email.indexOf("@");
	var dotpos=email.lastIndexOf(".");
	
			if(authorName.length==""){
				alert("用户名不能为空");
				return false;
			}
			if(authorPassword.length==""){
				alert("密码不能为空");
				return false;
			}
			if(rePassword.length==""){
				alert("请输入确认密码");
				return false;
			}
			if(email.length==""){
				alert("邮箱不能为空");
				return false;
			}
			if(authorPassword!=rePassword){
				alert("两次输入的密码不一致");
				return false;
			}
			if(atpos<1||dotpos<atpos+2||dotpos+2>=email.length){
				alert("邮箱格式不正确");
				return false;
			}
		}