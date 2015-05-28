$(function() {
	userGroup.init();
});
var userGroup = {
	init :  function(){
		/**
		 * 关注社群，取消关注社群
		 */
		$(".userGroup a").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			that.text("操作中...");
			that.addClass("disabled");
			var error = "操作失败，请稍后再试！";
			var actionType = that.attr("action-type");
			var actionData = getActionData(that.attr("action-data"));
			var gid = actionData["gid"];
			var url = "userGroup/" + gid;
			if(actionType == "createUserGroup"){
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					async:false,
					type : "POST",
					url : url,
					success : function(data, status, jqXHR) {
						that.attr("action-type","destroyUserGroup");
						that.text("取消关注");
						that.removeClass("disabled");
					},
					error : function(jqXHR, textStatus) {
						that.text("加关注");
						that.removeClass("disabled");
						alert(error + "");
					}
				});
			}else  if(actionType == "destroyUserGroup"){
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					async:false,
					type : "DELETE",
					url : url,
					success : function(data, status, jqXHR) {
						that.attr("action-type","createUserGroup");
						that.text("加关注");
						that.removeClass("disabled");
					},
					error : function(jqXHR, textStatus) {
						that.text("取消关注");
						that.removeClass("disabled");
						alert(error + "");
					}
				});
				
			}
		});
	},
};
