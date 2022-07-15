function id_search() { 
	 	var frm = document.idfindscreen;

	 	if (frm.member_name.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.member_phone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }

	 frm.method = "post";
	 frm.action = "findIdResult.jsp"; //넘어간화면
	 frm.submit();  
	 }