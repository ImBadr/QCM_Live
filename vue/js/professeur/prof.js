function selectedTest() {
    var selector = document.getElementById('list_test');
    var value = selector[selector.selectedIndex + 1].value;
    document.getElementById('selectedTest').innerHTML = value;
}
function selectedTheme() {
    var selector = document.getElementById('list_theme');
    var value = selector[selector.selectedIndex + 1].value;
    document.getElementById('selectedTheme').innerHTML = value;
}

window.onload = function () {
    selectedTheme();
    selectedTest();
};

var i = 1;
/**
 * Pour le formulaire ajout de reponse */
$(document).ready(function() {
    $('#addGood').click(function() {
        i++;
        $('#dynamic_field').append('<tr id="row' + i + '"><td colspan=2 class="bg-success"> Bonne Reponse : <input type="text" name="reponseCorrect[]" class="form-control name_list" required/></td><td class="bg-info"><button type="button" name="remove" id="' + i + '" class="btn btn-warning btn_remove"><i class="fas fa-trash"></i></button></td></tr>');
    });
    $(document).on('click', '.btn_remove', function() {
        var button_id = $(this).attr("id");
        $('#row' + button_id + '').remove();
    });
    $('#submit').click(function() {
        $.ajax({
            url: "name.php",
            method: "POST",
            data: $('#add_name').serialize(),
            success: function(data) {
                alert(data);
                $('#add_name')[0].reset();
            }
        });
    });
});

$(document).ready(function() {
    $('#addBad').click(function() {
        i++;
        $('#dynamic_field').append('<tr id="row' + i + '"><td colspan=2 class="bg-danger"> Mauvaise Reponse : <input type="text" name="reponseFausse[]" class="form-control name_list" required/></td><td class="bg-info"><button type="button" name="remove" id="' + i + '" class="btn btn-warning btn_remove"><i class="fas fa-trash"></i></button></td></tr>');
    });
    $(document).on('click', '.btn_remove', function() {
        var button_id = $(this).attr("id");
        $('#row' + button_id + '').remove();
    });
    $('#submit').click(function() {
        $.ajax({
            url: "name.php",
            method: "POST",
            data: $('#add_name').serialize(),
            success: function(data) {
                alert(data);
                $('#add_name')[0].reset();
            }
        });
    });
});

function goBack() {
    window.history.back();
}