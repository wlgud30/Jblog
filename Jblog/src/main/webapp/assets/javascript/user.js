function userJoin() {

	var check = $("input[name=check]").val().trim();	//	중복 이메일 체크 여부
	var u_name = $("input[name=userName]").val().trim();
	var u_pw = $("input[name=password]").val().trim();
	var u_id = $("input[name=id]").val().trim();
	
	if(u_name.length <2 ||u_name.length >= 20){
		alert("이름은 최소2글자부터 최대20글자 까지 입력 가능합니다.")
	}else if(u_id.length<4 || u_id.length>=20){
		alert("아이디는 최소4글자부터 최대20글자 까지 입력 가능합니다.")
	}else if (check != "t") {	//	중복 체크 안함
		alert("이메일 중복 체크를 해 주십시오.");
	}else if(u_pw.length<4 || u_pw.length >= 20){
		alert("비밀번호는 최소4글자부터 최대20글자 까지 입력 가능합니다.");
	}else if($("#chk").is(":checked") == false){
		alert("약관동의에 체크를 해 주십시오.");
	}else {	//	검증 통과
		$("#uJoinForm").submit();
	}
	return false;

}

function checkId() {
	
	let u_id = $("input[name=id]").val();
	if(u_id==""){
		alert("아이디를 입력해주세요.");
		return false;
	}
	$.ajax({
		async : true,
		type : 'get',
		data: {"id" : u_id},
		url: "/jblog/user/idCheck",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		success: function(result) {
			if (result.data==true) {
				$("input[name=check]").val('t');
				alert("사용 가능한 아이디 입니다.")
			} else {
				$("input[name=check]").val('f');
				alert("이미 사용중인 아이디 입니다.")
			}
		},
		error: function(xhr,status,error){
			console.error(status);
			console.error(xhr);
			console.error(error);
			
			$("input[name=check]").val('f');
		}
	});

}
