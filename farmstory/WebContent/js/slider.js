// $(function(){

//     var slides = $('.slider > ul > li');
//     var i = 0;
    
//     setInterval(function(){

//         slides.eq(i).animate({'left':'-100%'}, {
//             duration: 1000,
//             easing: 'linear'                
//         });
//         i++;

//         if(i==3){
//             i=0;
//         }

//         slides.eq(i).css('left', '100%').animate({'left':'0px'}, {
//             duration: 1000,
//             easing: 'linear'                
//         });

//     }, 1000*3);
// });   


$(document).ready(function(){
    $('.slider>ul').bxSlider({
        slideWidth: 'auto',
        auto:'true',
        pause: 2000,
        controls: false,
        pager: false
    });
});