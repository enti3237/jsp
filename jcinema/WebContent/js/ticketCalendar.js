/*
    날짜 : 2019/11/26
    이름 : 김철학
    내용 : 예매하기 날짜 출력
*/
$(document).ready(function(){

    var $a       = $('.calendar a');
    var $year    = $('.calendar .year');
    var $month   = $('.calendar .month');

    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth();
    var today = d.getDate();
    var day  = d.getDay();

    var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var week = ['일', '월', '화', '수', '목', '금', '토'];

    // 오늘 월 출력
    $year.text(year+' '+monthNames[month]);
    $month.text(month+1);

    // 월의 첫날과 마지막날 구함
    var firstDate = new Date(year, d.getMonth(),   1);
    var lastDate  = new Date(year, d.getMonth()+1, 0);

    // 요일, 날짜 출력하기
    $a.each(function(){
                
        // 요일
        if(day == 7){
            day = 0;
        }

        var week_name = week[day++];
        
        $(this).children().first().text(week_name);

        if( week_name == '토' ){
            $(this).parent().removeClass().addClass('sat');
        }else if( week_name == '일' ){
            $(this).parent().removeClass().addClass('sun');
        }else{
            $(this).parent().removeClass().addClass('day');
        }


        // 날짜
        if(today > lastDate.getDate()){
            today = 1;
        }

        $(this).children().last().text(today++);

    }); // each 끝


    // 오늘 날짜에 선택 하이라이트
    $a.eq(0).parent().addClass('on');

    // 날짜를 클릭하면 동그라미 강조
    $a.click(function(e){
        e.preventDefault();
        
        $a.parent().removeClass('on');
        $(this).parent().addClass('on');

    });

});