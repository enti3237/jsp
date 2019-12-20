$(function(){

    var sideMenu = $('.sideMenu > li > a');
    

    sideMenu.click(function(e){
        e.preventDefault();

        var subMenu = $(this).next();
        var isOpen = subMenu.is(':visible');

        if(isOpen){
            $(this).next().slideUp(200);
        }else{
            $(this).next().slideDown(200);
        }

    });

});