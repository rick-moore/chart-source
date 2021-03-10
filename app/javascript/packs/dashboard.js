$(document).on('click', '.accordion_title', function() {
    $(this).parent().next().toggleClass("active")
})

$(document).on('input', "#arr_search", function(){
    arrs = $('#arrangement_list').children()
    for (i of arrs) {
        text = $(i).find(".title_span").first().text().toLowerCase()
        if (!text.includes($("#arr_search").val().toLowerCase())) {
            $(i).hide()
        } else {
            $(i).show()
        }
    }
});    

$(document).on('change', "#setlist_id", function(){
    $.ajax({
        url: "/populate_setlist",
        type: "GET",
        data: {setlist_id: $(this).val()}
    })
});

$(document).on('click', ".add_to_setlist", function(event){
    if ($("#setlist_list").children().length == 0) {
        last_arrangement_id = 0
    } else {
        last_arrangement_id = $("#setlist_list").children().last().data().id
    }

    $.ajax({
        url: "/set_entries",
        type: "POST",
        data: {
            arrangement_id: $(this).children(".arrangement_id_span").text(),
            setlist_id: $("#setlist_id").val(),
            last_arrangement_id: last_arrangement_id
        }
    })
});

$(document).on('click', ".remove_from_setlist", function(event){
    $.ajax({
        url: "/set_entries",
        type: "DELETE",
        data: {
            set_entry_id: $(this).children('.set_entry_id_span').text()
        }
    })
});