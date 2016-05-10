$('body').on('mousedown', 'td[url]', function(e){
    var click = e.which;
    var url = $(this).attr('url');
    if(url){
        if(click == 1){
            window.location.href = url;
        }
        else if(click == 2){
            window.open(url, '_blank');
            window.focus();
        }
        return true;
    }
});

$(function() {
    $( "#dialog" ).dialog({
        autoOpen: false,
        closeOnescape: true
    });
});

function OpenDialog()
{
    $("#dialog").dialog("open");
}

function CheckBoxes()
{
//    $('input[name=players]').each(function(index, element) {
//        $('input[name=opponents]').each(function(index2, element2) {
//            if(index == index2)
//            {
//                $(element2).prop("disabled", $(element).prop("checked"));
//                $(element).prop("disabled", $(element2).prop("checked"));
//            }
//        });
//    });
    
    //$('input:checkbox:not(:checked)').prop("disabled", true);
    if($('input:checkbox:checked').length >= 4)
    {
        $('input:checkbox:not(:checked)').prop("disabled", true);
    }
    else
    {
        $('input[name=players]').each(function(index, element) {
        $('input[name=opponents]').each(function(index2, element2) {
            if(index == index2)
            {
                $(element2).prop("disabled", $(element).prop("checked"));
                $(element).prop("disabled", $(element2).prop("checked"));
            }
        });
    });
    }
    
    
}