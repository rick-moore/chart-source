$(document).on('click', '.nav_menu_button', function() {
    console.log('clicked')
    $('.nav_menu').toggleClass('hide')
    $('.nav_menu_button').toggleClass('selected')
})