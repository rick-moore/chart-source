$(document).on('keypress', '#genre_input', function(e) {
    if(e.key == 'Enter') {
        e.preventDefault();
        $('#add_tag_button').trigger('click');
    }
})

$(document).on('click', '#add_tag_button', function() {
    tag = $('#genre_input').val()
    if (tag != '') {
        $('#genre_list').append(`<span class="tag_span">${tag}<button type='button' class='remove_tag'>X</button></span>`)
        $('#genre_input').val('')
    }
});

$(document).on('click', '.remove_tag', function() {
    $(this).parent().remove()
})

// $('#genre_list').on('DOMSubtreeModified', function() {
//     console.log("triggered")
    // genres = $('#genre_list').children()
    // genre_names = ''
    // for (i of genres) {
    //     genre_names += i.innerText.slice(0, -1) + ","    
    // }
    // $('#genres_hidden').val(genre_names.slice(0, -1))
// })


