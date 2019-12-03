$(function(){
	
	var input = $('.checkDp');
			
	input.focusout(function(){
		
		var tag   = $(this);
		var type  = tag.attr('name');
		var value = tag.val();
		
		if(value == ''){
			// 값을 입력하지 않으면 서버로 통신하지 않음
			return false;
		}
		
		$.ajax({
			url: '/farmstory/user/checkDuplicateProc.jsp?type='+type+'&value='+value,
			type: 'get',
			dataType: 'json',
			success: function( data ){							
				if(data.rs == 1){								
					tag.next().css('color', 'red').text('이미 사용중인 '+type+' 입니다.');
					tag.focus();
				}else{								
					tag.next().css('color', 'green').text('사용 가능한 '+type+' 입니다.');								
				}							
			}
		});
	});	
	
	
	
	
});