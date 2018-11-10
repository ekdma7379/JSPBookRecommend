var heart = document.querySelector('.ion-ios-heart');
var recommend = document.querySelector('.recommend');
var ed = document.querySelector('.ed');
var span = document.querySelector('.counter');
var boo = document.querySelector('.boo');

function toggleThem() {
	heart.classList.toggle("red");
	span.classList.toggle("show");
	boo.classList.toggle("big");
	ed.classList.toggle("show");
}
heart.addEventListener("click", toggleThem, false);
recommend.addEventListener("click", toggleThem, false);

function addIt() {
	heart.classList.add("hover");
}

function removeIt() {
	heart.classList.remove("hover");
}
heart.addEventListener("mouseover", addIt, false);
heart.addEventListener("mouseout", removeIt, false);
recommend.addEventListener("mouseover", addIt, false);
recommend.addEventListener("mouseout", removeIt, false);