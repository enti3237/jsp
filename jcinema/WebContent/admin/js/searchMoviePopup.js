 function textLengthOverCut(txt, len, lastTxt) {
        if (len == "" || len == null) { // 기본값
            len = 5;
        }
        if (lastTxt == "" || lastTxt == null) { // 기본값
            lastTxt = "...";
        }
        if (txt.length > len) {
            txt = txt.substr(0, len) + lastTxt;
        }
        return txt;
    }


$(function() {
	
	// 영화검색 팝업창 띄우기
	var searchBg 	   = $('#searchBg');
	var btnClose	   = $('#searchBg .btnClose');
	var btnMovieSearch = $('.btnMovieSearch');
	
	btnMovieSearch.click(function(e){
		e.preventDefault();
		searchBg.show();
	});
	
	btnClose.click(function (e) {
		e.preventDefault();
		searchBg.hide();
	});
	
	// 팝업에서 검색하기
	var btnSearch  = $('#searchBg .btnSearch');
	var searchTable = $('#searchBg .searchTable');
		
	btnSearch.click(function () {
		
		var movieTitle = $('#searchBg input[name=title]').val();
		var url = "/jcinema/admin/api/movies?title="+movieTitle;
		
		$.get(url, function(data){
			
			searchTable.empty();
			
			for(var i=0 ; i<data.length ; i++){
				
				searchTable.append( '<tr>'+
                        			'<th>'+data[i].movie_no+'</th>'+
                        			'<td>'+data[i].movie_title+'</td>'+
                        			'<td>'+data[i].movie_genre+'</td>'+
                        			'<td>'+data[i].movie_grade+'</td>'+
                        			'<td>'+data[i].movie_release_date.substring(2, 10)+'</td>'+
                        			'<td><button class="btnChoice" data-movie-no="'+data[i].movie_no+'" title="'+data[i].movie_title+'">선택</button></td>'+
                        			'</tr>');
				}
			});
		}); // btnSearch end
	
	// btnChoice 동적이벤트 구현 (아직 생성되지 않은 버튼액션)
	$(document).on('click', '.btnChoice', function () {
		
		var title   = $(this).attr('title');
		var movieNo = $(this).attr('data-movie-no');

		$('#schedule_movie').val(title);
		$('input[name=schedule_movie_no]').val(movieNo);
		
		searchBg.hide();
		
	}); 
	
});