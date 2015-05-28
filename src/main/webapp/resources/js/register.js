$(function() {
	register.init();
});
var register = {
		init :  function(){
		/**
		 * 注册 register
		 */
		$(".form-signin #registerBtn").click(function(event){
			var email = $(".form-signin #inputEmail");
			var emailStr = email.val();
			if(emailStr.trim() == ""){
				alert("请输入账号！");
				event.preventDefault();
				email.focus();
				return;
			}
			if(!chkFormat(emailStr, 'email')){
				alert("请正确的邮箱账号！");
				event.preventDefault();
				email.focus();
				return;
			}
			var password = $(".form-signin #inputPassword");
			var passwordStr = password.val();
			if(passwordStr.trim() == ""){
				alert("请输入密码！");
				event.preventDefault();
				password.focus();
				return;
			}
			var confirmPassword = $(".form-signin #inputConfirmPassword");
			if(confirmPassword.val() != passwordStr){
				alert("两次密码不相同！");
				event.preventDefault();
				confirmPassword.focus();
				return;
			}
			var inputNickname = $(".form-signin #inputNickname");
			if(inputNickname.val().trim() == ""){
				alert("请输入昵称！");
				event.preventDefault();
				inputNickname.focus();
				return;
			}
			var code = $(".form-signin #inputCode");
			if(code.val().trim() == ""){
				alert("请输入验证码！");
				event.preventDefault();
				code.focus();
				return;
			}
		});
	},
};
