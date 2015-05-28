$(function() {
	userGroup.init();
});
var userGroup = {
	init :  function(){
		/**
		 * 加关注 取消关注
		 */
		$(".friendship a").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			that.text("操作中...");
			that.addClass("disabled");
			var error = "操作失败，请稍后再试！";
			var actionType = that.attr("action-type");
			var actionData = getActionData(that.attr("action-data"));
			var uid = actionData["uid"];
			var btnSize = actionData["btnSize"];
			var isMyFollower = actionData["isMyFollower"];
			var url = "relationship/" + uid;
			if(actionType == "createFriendship"){
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					async:false,
					type : "POST",
					url : url,
					success : function(data, textStatus, jqXHR) {
						that.attr("action-type","destroyFriendship");
						that.text("取消关注");
						that.removeClass("disabled");
						if(isMyFollower === "true"){
							if(btnSize != null){
								$("<button class=\"btn disabled btn-large\" style=\"margin-left:4px\">互相关注</button>").insertAfter(that);
							}else{
								$("<button class=\"btn disabled\" style=\"margin-left:4px\">互相关注</button>").insertAfter(that);
							}
						}
					},
					error : function(jqXHR, textStatus) {
						that.text("加关注");
						that.removeClass("disabled");
						alert(error + "");
					}
				});
			}else  if(actionType == "destroyFriendship"){
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					async:false,
					type : "DELETE",
					url : url,
					success : function(data, status, jqXHR) {
						that.attr("action-type","createFriendship");
						that.text("加关注");
						that.removeClass("disabled")
						if(isMyFollower === "true"){
							that.next().remove();
						}
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
