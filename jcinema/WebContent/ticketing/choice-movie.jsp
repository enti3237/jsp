<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script src="/jcinema/js/ticketCalendar.js"></script>
<script>
	// 지역별 영화관 불러오기
	$(document).ready(function(){
		
		var theaters_li   = $('.theaters > li');
		var theaters      = $('.theaters > li > ol');
		
		// 지역메뉴 클릭
		theaters_li.click(function(e){
			e.preventDefault();
			
			var i = $(this).index();
			
			// active						
			theaters_li.removeClass().eq(i).addClass('active');
			
			// on
			theaters.removeClass().eq(i).addClass('on');			
		});
		
		
		// 극장이름 클릭(동적이벤트 구현)
		$(document).on('click', '.theaters ol > li', function(e){			
			e.preventDefault();
			
			var theaters_all = $('.theaters ol > li');
			
			theaters_all.removeClass('chk');			
			$(this).addClass('chk');
			
			
			var theater_no    = $(this).attr('data-theater-no');			
			$('input[name=theater_no]').val(theater_no);
			
			var schedule_date = $('input[name=movie_date]').val();
			
			
			var url = "/jcinema/api/movies?theater_no="+theater_no+"&schedule_date="+schedule_date;  
			var movie_list = $('.rank > article > ul');
			
			movie_list.empty();
						
			$.get(url, function(data){
				
				$.each(data, function(i, value){
					
					var grade = null; 
					
					if(value.movie_grade == '0'){
						grade = 'gradeAll';
					}else if(value.movie_grade == '12'){
						grade = 'grade12';
					}else if(value.movie_grade == '15'){
						grade = 'grade15';
					}else if(value.movie_grade == '18'){
						grade = 'grade18';
					}else if(value.movie_grade == '19'){
						grade = 'grade19';
					}									
					
					movie_list.append(
						"<li data-movie-no='"+value.movie_no+"'>"+
						"<a href='#'>"+
						"<span class='grade "+grade+"'></span>"+
						"<span class='tit'>"+value.movie_title+"</span>"+
						"</a>"+
						"</li>"
					);
					
				});
			});
			
		});
		
		// 영화선택
		$(document).on('click', '.rank > article > ul > li', function(e){
			e.preventDefault();
			
			var movie_no = $(this).attr('data-movie-no');			
			var schedule_date = $('input[name=movie_date]').val();
			var schedule_theater_no = $('input[name=theater_no]').val();
			
			var url = "/jcinema/api/movies-schedule";			
			var param = {"schedule_date": schedule_date, 
						 "theater_no": schedule_theater_no, 
						 "movie_no": movie_no}; 
			
			var showtime_round_view = $('.showtime .round_view');
			var showtime_nodata     = $('.showtime .nodata');

			showtime_round_view.empty();
			
			$.get(url, param, function(data){
				
				// alert(data.length);
				
				if(data.length > 0) {
					
					showtime_nodata.remove();
					
					// function(인덱스번호, 객체)
					$.each(data, function (i, obj) {

						// 시작시간이 반복해서 출력된다!
//					alert(obj.schedule_start_time);
						
						showtime_round_view.append(
								'<li>'+
								'<a href="#">'+
								'<span>' + obj.schedule_round_view + '회차</span>'+
								'<span>' + obj.schedule_start_time.substring(0, 5) + ' ~ ' + obj.schedule_end_time.substring(0, 5)+ '</span>'+
								'<span><em>24</em>석/<em>80</em>석</span>'+
								'</a>'+
								'</li>'
						
						);
						
						
					});
					
					
					
				}
				
				
				
			});			
			
			
			
		});
		
		
		// 영화관 데이터 불러오기
		$.ajax({
			url: '/jcinema/admin/api/theaters',
			type: 'get',
			dataType: 'json',
			success: function(data){
				
				$.each(data, function(k, values){
					
					//console.log(k+' : '+v);
					if(k == '서울'){
						$.each(values, function(i, data){							
							theaters.eq(0).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");
						});
					}else if(k == '경기/인천'){
						$.each(values, function(i, data){theaters.eq(1).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}else if(k == '충청/대전'){
						$.each(values, function(i, data){theaters.eq(2).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}else if(k == '전라/광주'){
						$.each(values, function(i, data){theaters.eq(3).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}else if(k == '경북/대구'){
						$.each(values, function(i, data){theaters.eq(4).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}else if(k == '경남/부산/울산'){
						$.each(values, function(i, data){theaters.eq(5).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}else if(k == '강원'){
						$.each(values, function(i, data){theaters.eq(6).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}else if(k == '제주'){
						$.each(values, function(i, data){theaters.eq(7).append("<li data-theater-no='"+data.theater_no+"'><a href='#'>"+data.theater_name+"</a></li>");});
					}
					
				});
				
			}			
		});
		
		
	});
	
	
	
	
</script>



<div id="sub" class="choice-movie">

    <nav class="sub-menu"></nav>
         
    <div class="theater">
        <article>
                                 
            <a class="side-banner left"  href="#"><img src="${path}/img/ticketing_side_banner_event.png" alt=""></a>
            <a class="side-banner right" href="#"><img src="${path}/img/ticketing_side_banner_event.png" alt=""></a> 
            
            <div class="calendar">
            	
            	<input type="text" name="movie_date" />
            	<input type="text" name="theater_no" />
            	<input type="text" name="movie_no" />
                
                <nav>
                    <span class="month">11</span>
                    <span class="year">2019 November</span>
                </nav>

                <div>
                    <ul>
                        <li class="day on"><a href="#" data-date=""><em>월</em><span>01</span></a></li>
                        <li class="sat"><a href="#"><em>화</em><span>02</span></a></li>
                        <li class="sun"><a href="#"><em>수</em><span>03</span></a></li>
                        <li class="day"><a href="#"><em>목</em><span>04</span></a></li>
                        <li class="day"><a href="#"><em>금</em><span>05</span></a></li>
                        <li class="day"><a href="#"><em>토</em><span>06</span></a></li>
                        <li class="day"><a href="#"><em>일</em><span>07</span></a></li>
                        <li class="day"><a href="#"><em>월</em><span>08</span></a></li>
                        <li class="sat"><a href="#"><em>화</em><span>09</span></a></li>
                        <li class="sun"><a href="#"><em>수</em><span>10</span></a></li>
                        <li class="day"><a href="#"><em>목</em><span>11</span></a></li>
                        <li class="day"><a href="#"><em>금</em><span>12</span></a></li>
                        <li class="day"><a href="#"><em>토</em><span>13</span></a></li>
                        <li class="day"><a href="#"><em>일</em><span>14</span></a></li>
                    </ul>                            
                </div>
            </div>

            <section>
                <div class="region">
                    <div>
                        <h3>영화관</h3>
                        <span><strong>·&nbsp;최대 1개</strong>까지 선택 가능</span>
                    </div>
                    <div>
                        <h4>MY 영화관</h4>
                        <p>
							로그인 후 확인하실 수 있습니다.<a class="login" href="#">로그인</a>
                        </p>
                    </div>
                    <article>
                        <h4>전체영화관</h4>
                        <ul class="theaters">
                            <li class="active">
                                <a href="#">서울(24)</a>
                                <ol class="on"></ol>
                            </li>
                            <li>
                                <a href="#">경기/인천(44)</a>
                                <ol></ol>
                            </li>
                            <li>
                                <a href="#">충청/대전(10)</a>
                                <ol></ol>
                            </li>
                            <li>
                                <a href="#">전라/광주(9)</a>
                                <ol></ol>
                            </li>
                            <li>
                                <a href="#">경북/대구(16)</a>
                                <ol></ol>
                            </li>
                            <li>
                                <a href="#">경남/부산/울산(22)</a>
                                <ol></ol>
                            </li>
                            <li>
                                <a href="#">강원(3)</a>
                                <ol></ol>
                            </li>
                            <li>
                                <a href="#">제주(3)</a>
                                <ol></ol>
                            </li>
                        </ul>


                    </article>
                </div>
                <div class="rank">
                    <div>
                        <h3>영화</h3>
                        <span><strong>·&nbsp;최대 1개</strong>까지 선택 가능</span>
                    </div>
                    <div>
                        <p>
                            <a class="on" href="#">예매순</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">평점순</a>
                        </p>
                    </div>
                    <article>
                        <ul></ul>
                    </article>
                </div>
            </section>
        </article>
    </div>

    <div class="showtime">
        <article>
            <div class="info">
                <em>상영일</em>
                <span class="infoDate">2019.11.27(수)</span>
                <em>영화관</em>
                <span class="infoTheater">영화관을 선택하세요.</span>
                <em>영화</em>
                <span class="infoMovie">영화를 선택하세요.</span>
            </div>
            <section>
                <h1>상영시간<span>예고편 상영 등으로 시작이 10여분 정도 차이 날 수 있습니다.</span></h1>
                
                <p class="nodata">상영시간이 조회되지 않았습니다.</p>
                
                <ul class="round_view">
					<li>
						<a href="#">
							<span>1회차</span>
							<span>09:00 ~ 11:00</span>
							<span><em>24</em>석/<em>80</em>석</span>
						</a>                	
					</li>
					
				</ul>
				
				
                

            </section>               
            

        </article>
    </div>

</div>
<%@ include file="../_footer.jsp" %>