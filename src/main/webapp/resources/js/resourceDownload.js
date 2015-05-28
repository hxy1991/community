$(function() {
	resourceDownload.init();
});
var resourceDownload = {
	init :  function(){
		/**
		 * 删除下载记录
		 */
		$(".deleteResourceDownload").click(function(event){
			if(confirm("确认要删除此下载记录？")){
				var error = "操作失败，请稍后再试！";
				var actionData = getActionData($(this).attr("action-data"));
				var rdid = actionData["rdid"];
				var url = "resourceDownload/" + rdid;
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
