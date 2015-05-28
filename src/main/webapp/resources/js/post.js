$(function() {
	post.init();
});
var post = {
	url : "post",
	init :  function(){
		/**
		 * 关注社群，取消关注社群
		 */
		$("#newPost button").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			that.text("发布中...");
			that.addClass("disabled");
			var titleElem = $("#newPost #title");
			var title = titleElem.val();
			if(title == ""){
				alert("标题不能为空");
				titleElem.focus();
				that.text("发布");
				that.removeClass("disabled");
				return;
			}
			if(title.Trim() == ""){
				alert("标题不能只含有空格！");
				titleElem.focus();
				that.text("发布");
				that.removeClass("disabled");
				return;
			}
			var contentElem = $("#newPost #content");
			var content = postContentEditor.html();
			if(postContentEditor.isEmpty()){
				alert("内容不能为空");
				contentElem.focus();
				that.text("发布");
				that.removeClass("disabled");
				return;
			}
			var tags = $("#newPost #tags").val();
			var error = "发布失败，请稍后再试！";
			var actionData = getActionData(that.attr("action-data"));
			var gid = actionData["gid"];// 帖子所属的社群gid
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/x-www-form-urlencoded',
				},
				async:false,
				type : "POST",
				url : post.url,
				data : {
					gid : gid,
					title : title,
					tags : tags,
					content : content
				},
				success : function(data, status, jqXHR) {
					window.location.href="group/"+gid;
				},
				error : function(jqXHR, textStatus) {
					that.text("发布");
					that.removeClass("disabled");
					alert(error + "");
				}
			});
		});
		
		/**
		 * 删除微博
		 */
		$(".deletePost").click(function(event){
			if(confirm("确认要删除此帖子？")){
				var error = "操作失败，请稍后再试！";
				var actionData = getActionData($(this).attr("action-data"));
				var pid = actionData["pid"];
				var gid = actionData["gid"];
				var url = post.url + "/" + pid;
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					async:false,
					type : "DELETE",
					url : url,
					success : function(data, status, jqXHR) {
						if(gid != undefined){
							window.location.href="group/"+gid;
						} else {
							window.location.reload();
						}
					},
					error : function(jqXHR, textStatus) {
						alert(error);
					}
				});
			};
		});
		


		$(".reply").click(function(event){
			var replyTop = $("#reply").offset().top;
			$("html,body").animate({scrollTop:replyTop}, 'slow'); 
		});
	},
};
