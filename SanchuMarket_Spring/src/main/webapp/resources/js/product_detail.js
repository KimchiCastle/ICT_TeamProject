

// 페이지 들어올때 이상품이 찜이 되어있는지 아닌지 거래중인지 아닌지 확인
	$(function(){
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#buyer_u_idx").val();
		
		$.ajax({
			
			url		: 'jjimCheck.do',
			type	: 'POST',
			data	: {'p_idx':p_idx, 'u_idx':u_idx},
			success	: function(res){
				
				if(res.result){
					$("#jjim_off").css('display','inline-block');
					
				}else{
					$("#jjim_on").css('display','inline-block');
				
				}
				
			}
			
		});
		
		$.ajax({
			
			url		: 'tradeCheck.do',
			type	: 'POST',
			data	: {'p_idx':p_idx, 'u_idx':u_idx},
			success	: function(res){
				
				if(res.result){
					$("#cancel_trade").css('display','inline-block');
				}else{
					$("#trade_on").css('display','inline-block');
				}
			},
			error	: function(err){
				alert('상품 불러오기에 실패했습니다. 관리자에게 문의 해주세요.')
			}
		
		
		
		});
		
		
		
	})
		


//	찜기능 on
	function jjimOn(){
		
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#buyer_u_idx").val().trim();
		
		if(u_idx==''){
			
			if(confirm("로그인후 이용가능 합니다.\n로그인 하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);
			
			return;
		}
		
 		$.ajax({
			
			url	     : 'jjimon.do',
			type	 : 'POST',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
				if(res.result){
					
					$("#jjim_on").css('display','none');
					$("#jjim_off").css('display','inline-block');
				
				}else{
					
					alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
				
				}
				
			},error	 : function(err){
				alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
		
		
	}


	//찜기능 off
	function jjimOff(){
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#buyer_u_idx").val().trim();
		
		
		$.ajax({
			
			url	     : 'jjimoff.do',
			type	 : 'POST',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
				if(res.result){
					
					$("#jjim_off").css('display','none');
					$("#jjim_on").css('display','inline-block');
				
				}else{
					
					alert('찜 해제을 실패하였습니다. 관리자에게 문의하세요');
				
				}
				
			},error	 : function(err){
				alert('찜 해제을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
	}
	
	
	// 거래하기기능
	function trade(p_idx){
		
		var seller_u_idx = $("#seller_u_idx").val();
		var buyer_u_idx = $("#buyer_u_idx").val();
		
		if(buyer_u_idx==''){
			
			if(confirm("로그인후 이용가능 합니다.\n로그인 하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);
			
			return;
		}
		
		if(seller_u_idx==buyer_u_idx){
			alert('본인이 올린 상품은 구매할 수 없습니다.');
			return false;
		}
		
		
		if(!confirm('상품을 구매하시겠습니까?')) return;
		
		
		$.ajax({
		
			url		:  'trade.do',
			type	: 'POST',
			dataType: 'json',
			data	: {
						"seller_u_idx":seller_u_idx, 
						"buyer_u_idx":buyer_u_idx, 
						"p_idx":p_idx},
			success : function(res){
				
				
				if(res.result==1){
					window.location.reload();
				}else if(res.result==0){
					alert('상품 구매시 문제가 발생했습니다. 관리자에게 문의하세요.');
				}else if(res.result==2){
					alert('탈퇴한 회원의 상품입니다.');
					return;
				}
				
			},
			error	: function(err){
				alert('상품 구매시 문제가 발생했습니다. 관리자에게 문의하세요.');
			}
			
		});
		
		
		
	}
	
	function cancelTrade(p_idx){
		
		if(!confirm('거래를 취소 하시겠습니까?')) return false;
		
		$.ajax({
			
			url		: 'tradeCancel.do',
			data	: {'p_idx':p_idx},
			type	: 'POST',
			success	: function(res){
				
				if(res.result){
					window.location.reload();
				}else{
					alert('거래취소를 실패했습니다. 관리자에게 문의하세요.');	
				}
				
			},
			error	: function(err){
				alert('거래취소를 실패했습니다. 관리자에게 문의하세요.');
			}
			
			
		})
		
		
		
	}
	
	
	
	//판매하기
	function sell(p_idx){
		
		if(!confirm('상품을 판매하시겠습니까?')) return;
		
		$.ajax({
			
			url		: 'product_sell.do',
			type	: 'POST',
			data	: {"p_idx" : p_idx},
			success	: function(res){
				
				if(res.result){
					window.location.reload();
				}else{
					alert('상품 구매시 문제가 발생했습니다. 관리자에게 문의하세요.');
				}
				
			},
			error	: function(err){
				
				alert("상품판매시 문제가 발생했습니다. 관리자에게 문의하세요.");
				
			}
			
			
		});		
		
		
	}
	
	
	