$(function() {

    $("#btnAjax").on("click", callServer);

});

const callServer = () => {

    $.ajax({
        url: 'index.php',
        type: 'GET',
        data: {},
        dataType: 'json',
        //contentType: '',
        success: (response) => {
            console.log(response);
            $("#pAjax").append("Nom: " + response.pers.nom + "<br>");
            $("#pAjax").append("Prénom: " + response.pers.prenom + "<br>");
            $("#pAjax").append("Age: " + response.pers.age + "<br>");
            $("#pAjax").append("Téléphones: ");
            let i = 0;
            response.pers.telephones.forEach(item => {
                if (i <= response.pers.telephones.length - 2)
                    $("#pAjax").append(item + ",");
                else
                    $("#pAjax").append(item);
                i++;
            });
            $("#pAjax").append(response.arr.key1);
            $("#pAjax").append(response.arr.key2);
            $("#pAjax").append(response.arr.key3);
        },
        error: (error) => {
            console.log(error);
        }
    });

};