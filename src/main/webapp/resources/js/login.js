$(function() {
	login.init();
});
var login = {
	init :  function(){
		/**
		 * 登录 login
		 */
		$(".form-login #loginBtn").click(function(event){
			var email = $(".form-login #inputEmail");
			if(email.val().trim() == ""){
				alert("请输入账号！");
				event.preventDefault();
				email.focus();
				return;
			}
			var password = $(".form-login #inputPassword");
			if(password.val().trim() == ""){
				alert("请输入密码！");
				event.preventDefault();
				password.focus();
				return;
			}
			var code = $(".form-login #inputCode");
			if(code.val().trim() == ""){
				alert("请输入验证码！");
				event.preventDefault();
				code.focus();
				return;
			}
		});
	},
};
