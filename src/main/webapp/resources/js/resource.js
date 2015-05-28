$(function() {
	resource.init();
});
var resource = {
	url : "resource",
	init :  function(){
		/**
		 * 上传
		 */
		$("#uploadFrom #ensure").click(function(event){
			var that = $(this);
			if(that.hasClass("disabled")){
				return;
			}
			
			var filepath = $("#uploadFrom #filepath");
			var resourceName = $("#uploadFrom #resourceName");
			var description = $("#uploadFrom #description");
			if(filepath.val().trim() == ""){
				alert("请选择文件！");
				event.preventDefault();
				return;
			}
			var resourceNameStr = resourceName.val();
			if(resourceNameStr.trim() == ""){
				alert("资源名称不能为空！");
				event.preventDefault();
				resourceName.focus();
				return;
			}
			var descriptionStr = description.val();
			if(descriptionStr.trim() == ""){
				alert("资源描述不能为空！");
				event.preventDefault();
				description.focus();
				return;
			}

			that.text("上传中...");
			that.addClass("disabled");
			var closeBt = $("#uploadFrom #closeBt");
			closeBt.css('display', 'none');
			
			$("#uploadFrom").submit();
		});
		

		/**
		 * 删除资源
		 */
		$(".deleteResource").click(function(event){
			if(confirm("确认要删除此资源？")){
				var error = "操作失败，请稍后再试！";
				var actionData = getActionData($(this).attr("action-data"));
				var rid = actionData["rid"];
				var url = resource.url + "/" + rid;
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
						alert(error + textStatus);
					}
				});
			};
		});

	},
};
