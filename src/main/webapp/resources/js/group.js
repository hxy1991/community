$(function() {
	group.init();
});
var group = {
	url : "group",
	init :  function(){
		/**
		 * 创建新的社群
		 */
		$("#createGroupDiv #ensure").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			that.text("创建中...");
			that.addClass("disabled");
			
			var groupName = $("#createGroupDiv #groupName");
			var description = $("#createGroupDiv #description");
			var groupNameStr = groupName.val().trim();
			var descriptionStr = description.val().trim();
			if(groupNameStr == ""){
				alert("社群名称不能为空！");
				groupName.focus();
				that.text("确定");
				that.removeClass("disabled");
				return;
			}
			if(descriptionStr == ""){
				alert("社群描述不能为空！");
				description.focus();
				that.text("确定");
				that.removeClass("disabled");
				return;
			}
			var error = "创建社群失败，请稍后再试！";
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/x-www-form-urlencoded',
				},
				async:false,
				type : "POST",
				url : group.url,
				data : {
					name : groupNameStr,
					description : descriptionStr
				},
				success : function(data, status, jqXHR) {
					window.location.href="groups";
				},
				error : function(jqXHR, textStatus) {
					that.text("确定");
					that.removeClass("disabled");
					alert(error + "");
				}
			});
		});
	},
};
