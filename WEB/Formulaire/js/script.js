
$(function() {

	$("#form_inscription").on("submit", validationForm);

});


const validationForm = (event) => {

	let cls_errors_msg = $(".cls-errors-msg");
	$(".cls-errors, .cls-errors2").remove();
	$(".cls-errors3").removeClass("cls-errors3");
	$(".cls-errors4").removeClass("cls-errors4");

	let haseNoErrors = true;

	let error = null;

	let select_civilite = $("#select_civilite");
	if(select_civilite.val() === "") {
		error = $("<label>");	
		error.addClass("cls-errors")
			 .text("Civilité Obligatoire.");
		cls_errors_msg.append(error);
        //return false;
		haseNoErrors = false;
	}

	let text_nom = $("#text_nom");
	if(text_nom.val() === "") {
		error = $("<label>");
		error.addClass("cls-errors")
			 .text("Nom Obligatoire.");
		cls_errors_msg.append(error);
        //return false;
		haseNoErrors = false;
	}

	let text_prenom = $("#text_prenom");
	if(text_prenom.val() === "") {
		error = $("<label>");
		error.addClass("cls-errors2")
			 .text("Prénom Obligatoire.");
		text_prenom.parent()
		           .append(error);
        //return false;
		haseNoErrors = false;
	}

	let email_email = $("#email_email");
	if(email_email.val() === "") {
		email_email.addClass("cls-errors3");
        //return false;
		haseNoErrors = false;
	}

	let password_confirmation = $("#password_confirmation");
	if(password_confirmation.val() === "") {
		password_confirmation.prev().addClass("cls-errors4");
        //return false;
		haseNoErrors = false;
	}



	//return true;
	return haseNoErrors;
}
