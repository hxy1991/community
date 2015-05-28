$(function() {
	passport.init();
});
var passport = {
	url : "passport",
	init :  function(){
		
		/**
		 * 修改基本资料 passport
		 */
		$("#basicMsg #basicMsgSaveBt").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			
			var nicknameElem = $("#basicMsg #nickname");
			var nickname = nicknameElem.val();
			if(nickname == ""){
				alert("昵称不能为空！");
				return;
			}
			
			var sex = 1;
			if(document.getElementById("sex0").checked){
				sex = 0;
			}
			var descriptionElem = $("#basicMsg #description");

			that.text("正在保存...");
			that.addClass("disabled");
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/x-www-form-urlencoded',
				},
				async:false,
				type : "POST",
				url : passport.url,
				data : {
			        _method: 'PUT',
					"nickname": nickname,
					"sex": sex,
					"description": descriptionElem.val()
				},
				success : function(data, status, jqXHR) {
					that.removeClass("disabled");
					that.text("保存");
					alert("修改成功！");
				},
				error : function(jqXHR, textStatus) {
					that.removeClass("disabled");
					that.text("保存");
					alert("设置失败，请稍后再试！");
				}
			});
		});
		
		/**
		 * 修改密码 passport
		 */
		$("#passwordMsg #passwordMsgSaveBt").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			var currentPasswordElem = $("#passwordMsg #currentPassword");
			var currentPassword = currentPasswordElem.val();
			if(currentPassword == ""){
				alert("请输入当前密码！");
				currentPasswordElem.focus();
				return;
			}
			var inputPasswordElem = $("#passwordMsg #inputPassword");
			var inputPassword = inputPasswordElem.val();
			if(inputPassword == ""){
				alert("请输入新的密码！");
				inputPasswordElem.focus();
				return;
			}
			var inputConfirmPasswordElem = $("#passwordMsg #inputConfirmPassword");
			var inputConfirmPassword = inputConfirmPasswordElem.val();
			if(inputPassword != inputConfirmPassword){
				alert("两次密码不相同！");
				inputConfirmPasswordElem.focus();
				return;
			}
			that.text("正在保存...");
			that.addClass("disabled");
			
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/x-www-form-urlencoded',
				},
				async:false,
				type : "POST",
				url : passport.url,
				data : {
			        _method: 'PUT',
					"currentPassword" :  currentPassword,
					"inputPassword": inputPassword,
					"inputConfirmPassword": inputConfirmPassword
				},
				success : function(data, status, jqXHR) {
					alert("修改成功，请记住新密码！");
					that.removeClass("disabled");
					that.text("保存");
					currentPasswordElem.val("");
					inputPasswordElem.val("");
					inputConfirmPasswordElem.val("");
				},
				error : function(jqXHR, textStatus) {
					if(jqXHR.status == 412){
						alert("当前密码错误！");
					} else if(jqXHR.status == 409) {
						alert("两次密码不一致！");
					} else {
						alert("设置失败，请稍后再试！");
					}
					that.removeClass("disabled");
					that.text("保存");
				}
			});
			
		});
	},
};
