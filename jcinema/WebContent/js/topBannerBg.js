$(function(){   

    // 상단 배너 이미지를 임의로 출력
    var rand = Math.ceil(Math.random() * 6);
    var imgPath = '/jcinema/img/top_banner_poster'+rand+'.jpg';
    $('#topBannerImg').attr('src', imgPath);


    // 상단 배너 이미지와 같은 색상을 배경색으로 지정
    var ctx = document.getElementById('canvas').getContext('2d');            
    var img = document.getElementById('topBannerImg');

    if (img.complete) {
        drawBackground();
    } else {
        img.onload = drawBackground;
    }

    function drawBackground() {        
        ctx.drawImage(img, 0, 0);
        var d = ctx.getImageData(0, 0, 1, 1).data;
        var rgb = 'rgb('+d[0]+', '+d[1]+', '+d[2]+')';

        $('#top-banner').css('background-color', rgb);
    }

});