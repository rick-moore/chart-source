$(document).on('input', '#user_password', function() {
    console.log('checking')
    if ($('#user_password').val() !== $('#user_password_confirmation').val()) {
        $('#password_match_error').show();
        $('#password_match_success').hide();
        $('#user_password_confirmation').addClass("error_border");
    } else {
        $('#password_match_error').hide();
        $('#password_match_success').show();
        $('#user_password_confirmation').removeClass("error_border");
    }
    if ($('#user_password').val() === '' && $('#user_password_confirmation').val() === '') {
        $('#password_match_error').hide();
        $('#password_match_success').hide();
        $('#user_password_confirmation').removeClass("error_border");
    }

});
$(document).on('input', '#user_password_confirmation', function() { 
    console.log('checking')
    if ($('#user_password').val() !== $('#user_password_confirmation').val()) {
        $('#password_match_error').show();
        $('#password_match_success').hide();
        $('#user_password_confirmation').addClass("error_border");
    } else {
        $('#password_match_error').hide();
        $('#password_match_success').show();
        $('#user_password_confirmation').removeClass("error_border");
    }
    if ($('#user_password').val() == '' && $('#user_password_confirmation').val() == '') {
        $('#password_match_error').hide();
        $('#password_match_success').hide();
        $('#user_password_confirmation').removeClass("error_border");
    }
});