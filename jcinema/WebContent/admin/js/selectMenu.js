$(function() {
	
    // ticket-generate
	// 가급적 분리하는 게 좋음
    
	var theater_city = $('#theater_city');
	var theater_name = $('#theater_name');
	var screen_name  = $('#screen_name');
	var movie_no     = $('#movie_no');
	var movie_date   = $('#movie_date');
	var round_view   = $('#round_view');
	var price        = $('#price');
	
// 지역을 선택할 때 극장정보 서버로부터 가져오기
	theater_city.change(function() {
		
		var city = $(this).val();
		var url  = "/jcinema/admin/api/theater?city="+city;
		
		$.get(url, function(data){
			
			
			// 모든 옵션태그 삭제
			theater_name.empty();
			theater_name.append('<option>선택</option>');
			
			for (var i=0 ; i < data.length ; i++){
				theater_name.append('<option value="'+data[i].theater_no+'">'+data[i].theater_name+'</option>');
			}

		});
		
	});
	
	
// 극장을 선택할 때 상영관정보 서버로부터 가져오기
	theater_name.change(function(){
			
		var theater_no = $(this).val();
		var url = "/jcinema/admin/api/screen?theater_no="+theater_no;
					
		$.get(url, function(data){
			
			// 모든 option태그 삭제
			screen_name.empty();
			screen_name.append('<option>선택</option>');
			
			for(var i=0 ; i<data.length ; i++){
				screen_name.append('<option value="'+data[i].screen_no+'">'+data[i].screen_name+'</option>');
			}
							
		});
		
			// 영화관을 선택하면 해당값이 theater_no로 지정되고 input[name=theater_no]에 그 값을 지정해준다.
			var theater_no = $(this).val();
			$('input[name=theater_no]').val(theater_no);
			
	});
	
	
// 상영관을 선택하면 해당 값이 screen_no로 설정되고 input 이름이 screen_no인 곳에 그 값을 지정해준다. 
// (현재는 영화정보를 가져올 일이 없으므로 이 행만 수행한다)
	screen_name.change(function(){
		
		var screen_no = $(this).val();
		$('input[name=screen_no]').val(screen_no);
		
	});
	
	
	round_view.change(function() {
		
		var count = $(this).val();
		if(count == 0){
			alert('회차를 선택하세요');
		} 

		var theater_no 	  = $('input[name=theater_no').val();
		var screen_no 	  = $('input[name=screen_no').val();
		var schedule_date = $('input[name=movie_date').val();
		var round_view    = $('select[name=round_view').val();
		
		var json = {'theater_no' : theater_no, 
					'screen_no' : screen_no, 
					'schedule_date' : schedule_date, 
					'round_view' : round_view};

		var url = "/jcinema/admin/api/movie-schedule";
		
	
		$.post(url, json, function (data) {
			
			$('input[name=movie_no]').val(data.schedule_movie_no);
			$('input[name=movie_title]').val(data.movie_title);
			
		});
		
	});
	
	
	
	
	
});