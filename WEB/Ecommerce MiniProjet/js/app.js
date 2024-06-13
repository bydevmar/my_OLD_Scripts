
let achats = [];
let total = 0;

let clsProduitsAchetes = document.querySelector(".cls-produits-achetes");

const acheterProduit = (event) => {
	let qte = Number(event.target.parentNode.previousElementSibling.value);
	let lastParent = event.target.parentNode.parentNode.parentNode.parentNode.parentNode;
	let produitName = lastParent.firstElementChild.textContent;
	let produit = catalog.find(p => p.name === produitName);
	
	let x = null;
	x = achats.find(a => {
		return a.p.name === produitName;
	});
	console.log(x);
	if(x == undefined) {
		achats.push({
			q: qte,
			p: produit
		});

		let clsProduitsAchete = document.createElement("div");
		clsProduitsAchete.classList.add("cls-produits-achete");
		clsProduitsAchete.id = produit.name;

		let produitImgDiv = document.createElement("div");
		let produitImg = document.createElement("img");
		produitImg.src = produit.image;
		produitImgDiv.appendChild(produitImg);
		clsProduitsAchete.appendChild(produitImgDiv);

		let produitnameP = document.createElement("p");
		produitnameP.textContent = produit.name;
		clsProduitsAchete.appendChild(produitnameP);

		let produitqteP = document.createElement("p");
		produitqteP.textContent = qte + "x";
		clsProduitsAchete.appendChild(produitqteP);

		let produitprixP = document.createElement("p");
		produitprixP.textContent = produit.price + " $";
		clsProduitsAchete.appendChild(produitprixP);

		let produitSousTotalP = document.createElement("p");
		produitSousTotalP.classList.add("cls-sous-total");
		produitSousTotalP.textContent = (produit.price * qte) + " $";
		clsProduitsAchete.appendChild(produitSousTotalP);

		clsProduitsAchetes.appendChild(clsProduitsAchete);
	} else {
		x.q += qte;

		let div = document.getElementById(produit.name);
		div.children[2].textContent = x.q + "x";
		div.children[4].textContent = (x.q * x.p.price) + " $";
	}

	

	total = 0;
	achats.forEach(a => {
		total += a.p.price * a.q;
	});

	document.querySelector(".cls-total-panier > span").textContent = total + "$";
}

const EditQte = (event) => {
	if(event.target.value <= "0") {
		event.target.value = "0";
	}
	let divImg = event.target.nextElementSibling;
	if(event.target.value <= "0") {
		divImg.children[0].style.opacity = "0.25";
		divImg.style.cursor = "auto";	
		divImg.removeEventListener("click", acheterProduit);
	} else {
		divImg.children[0].style.opacity = "1";
		divImg.style.cursor = "pointer";
		divImg.addEventListener("click", acheterProduit);
	}


}

let catalogDiv = document.getElementById("catalog");

catalog.forEach(produit => {
	let produitDiv = document.createElement("div");
	produitDiv.classList.add("cls-div-produit");

	let produitNameH4 = document.createElement("h4");
	produitNameH4.textContent = produit.name;

	let produitImgDiv = document.createElement("div");
	produitImgDiv.classList.add("cls-div-img-produit");
	let produitImg = document.createElement("img");
	produitImg.src = produit.image;
	let produitImgP = document.createElement("p");
	produitImgP.textContent = produit.price + " $";
	produitImgDiv.appendChild(produitImg);
	produitImgDiv.appendChild(produitImgP);

	let produitInfosDiv = document.createElement("div");
	produitInfosDiv.classList.add("cls-div-infos-produit");
	let produitDescriptionP = document.createElement("p");
	produitDescriptionP.textContent = produit.description;
	produitDescriptionP.classList.add("cls-p-description-produit");
	produitInfosDiv.appendChild(produitDescriptionP);
	let produitQuantiteDiv = document.createElement("div");
	produitInfosDiv.appendChild(produitQuantiteDiv);
	let produitAddToCartBtn = document.createElement("div");
	produitQuantiteDiv.appendChild(produitAddToCartBtn);
	let quantiteInputText = document.createElement("input");
	quantiteInputText.type = "number";
	quantiteInputText.min = 0;
	quantiteInputText.value = 0;
	quantiteInputText.addEventListener('change', EditQte);
	produitAddToCartBtn.appendChild(quantiteInputText);
	let addToCartBtn = document.createElement("div");
	addToCartBtn.classList.add("cls-div-btn");
	let produitImgPanier = document.createElement("img");
	produitImgPanier.src = "css/images/panier.jpg";
	addToCartBtn.appendChild(produitImgPanier);
	produitAddToCartBtn.appendChild(addToCartBtn);

	produitDiv.appendChild(produitNameH4);
	produitDiv.appendChild(produitImgDiv);
	produitDiv.appendChild(produitInfosDiv);


	catalogDiv.appendChild(produitDiv);
});

