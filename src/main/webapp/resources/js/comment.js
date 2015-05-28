$(function() {
	comment.init();
});
var comment = {
	url : "comment",
	init :  function(){
		/**
		 * 关注社群，取消关注社群
		 */
		$("#reply button").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			that.text("发布中...");
			that.addClass("disabled");
			var contentElem = $("#reply #content");
			var content = commentContentEditor.html();
			if(commentContentEditor.isEmpty()){
				alert("内容不能为空");
				contentElem.focus();
				that.text("发布");
				that.removeClass("disabled");
				return;
			}
			var error = "发布失败，请稍后再试！";
			var actionData = getActionData(that.attr("action-data"));
			var pid = actionData["pid"];// 帖子的pid
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/x-www-form-urlencoded',
				},
				async:false,
				type : "POST",
				url : comment.url,
				data : {
					pid : pid,
					content : content
				},
				success : function(data, status, jqXHR) {
					window.location.href="post/"+pid;
				},
				error : function(jqXHR, textStatus) {
					that.text("发布");
					that.removeClass("disabled");
					alert(error + "");
				}
			});
		});
		
		/**
		 * 删除评论
		 */
		$(".deleteComment").click(function(event){
			if(confirm("确认要删除此评论？")){
				var error = "操作失败，请稍后再试！";
				var actionData = getActionData($(this).attr("action-data"));
				var cid = actionData["cid"];
				var url = comment.url + "/" + cid;
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					async:false,
					type : "DELETE",
					url : url,
					success : function(data, status, jqXHR) {
						window.location.reload();
					},
					error : function(jqXHR, textStatus) {
						alert(error);
					}
				});
			};
		});
	},
};
