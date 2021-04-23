/**
 * 
 */

function cateDel(cateNo,u_id){
	$.ajax({
		type : 'get',
		data:{cateNo : cateNo},
		url: "/jblog/"+u_id+"/admin/category_delete",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		success: function(result) {
			if (result.data==true) {
				location.href="/jblog/"+u_id+"/admin/category";
			} else {
				alert("삭제할 수 없습니다.")
			}
		},
		error: function(xhr,status,error){
			console.error(status);
			console.error(xhr);
			console.error(error);
			
		}
	});
}

function hrefBlog(u_id){
	location.href="/jblog/"+u_id;
}

function cmtInsert(){
	var cmtContent =  $("input[name=cmtContent]").val().trim();
	
	if(cmtContent==""){
		alert("코멘트를 작성해 주세요.")
		return false;
	}else{
		$("#cmtForm").submit();
	}
}

function cmtDel(cmtNo,postNo){
	$("#cmt_cmtNo").val(cmtNo);
	$("#cmt_postNo").val(postNo);
	
	$("#cmtDelForm").submit();
}

