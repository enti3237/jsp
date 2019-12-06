$(document).ready(function(){
				
	$('.btnNext').click(function(){
	
		var isChecked1 = $('input[name=chk1]').is(':checked'); 
		var isChecked2 = $('input[name=chk2]').is(':checked'); 
		
		if(isChecked1 && isChecked2){
			
			return true;
			
		}else{
			
			alert('동의 체크를 해주세요.');
			return false;
		}
		
	});
	
});