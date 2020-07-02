var indice=1;
var indiceT=1;
var indiceO=1;
var indiceB=1;
var indiceP=1;
var testoPerson=document.getElementsByClassName("notaPersona");
var testoTerms=document.getElementsByClassName("descrizione");
var org=document.getElementsByClassName("org");



function gestoreload(){
	assegnahref();

	$('.eliminasettlement').remove();
	$('.elimina').remove();
	
	//aggiungo collegamento in head a google font
	var linkfont=document.createElement('link');
	linkfont.rel="stylesheet";
	linkfont.href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Noto+Serif+KR:wght@500;700&display=swap";
	document.head.appendChild(linkfont);
	
	var persone=document.getElementsByClassName("persona");
	persone[23].remove();
	//richiamo funzioni slideshow con indici
	showSlides(indice);
	showSlidesTerm(indiceT);
	showSlidesOrg(indiceO);
	showSlidesBibl(indiceB);
	showSlidesPers(indiceP);
}

//funzioni per slideshow BELLINI BIOGRAFIA
function plusSlides(n) {
	showSlides(indice += n); }
function showSlides(n){
	var i;
	var slides = document.getElementsByClassName("Bellini");
	if ( n > slides.length) {
		indice = 1 }
	if (n < 1) {
		indice = slides.length }
	for (i=0; i<slides.length; i++){
		slides[i].style.display="none"; }
	slides[indice-1].style.display=" block"; }

//fuzioni per slideshow VOCABOLARIO 
function plusSlidesTerm(n) {
	showSlidesTerm(indiceT += n); }
function showSlidesTerm(n){
	var i;
	var slides = document.getElementsByClassName("termine");
		if ( n > slides.length) {
		indiceT = 1}
	if (n < 1) {
		indiceT = slides.length}
	for (i=0; i<slides.length; i++){
		slides[i].style.display="none";}
	slides[indiceT-1].style.display="block";}

//fuzioni per slideshow PERSONE
function plusSlidesPers(n) {
	showSlidesPers(indiceP += n);}
function showSlidesPers(n){
	var i;
	var slides = document.getElementsByClassName("persona");
		if ( n > slides.length) {
		indiceP = 1}
	if (n < 1) {
		indiceP = slides.length}
	for (i=0; i<slides.length; i++){
		slides[i].style.display="none";}
	slides[indiceP-1].style.display="block";}

//fuzioni per slideshow TEATRI 
function plusSlidesOrg(n) {
	showSlidesOrg(indiceO += n);}
function showSlidesOrg(n){
	var i;
	var slides = document.getElementsByClassName("org");
	if ( n > slides.length) {
		indiceO = 1}
	if (n < 1) {
		indiceO = slides.length}
	for (i=0; i<slides.length; i++){
		slides[i].style.display="none";}
	slides[indiceO-1].style.display="block";}

//fuzioni per slideshow OPERE 
function plusSlidesBibl(n) {
	showSlidesBibl(indiceB += n);}
function showSlidesBibl(n){
	var i;
	var slides = document.getElementsByClassName("bibl");
	if ( n > slides.length) {
		indiceB = 1}
	if (n < 1) {
		indiceB = slides.length}
	for (i=0; i<slides.length; i++){
		slides[i].style.display="none";}
	slides[indiceB-1].style.display="block"; }

//assegna href
function assegnahref (){
	var links=document.getElementsByClassName('linkfonte');
	console.log(links);
	var i=0;
	for(i=1; i<links.length; i++){
		var ref=links[i];
		var refvalue=ref.textContent;
		links[i].setAttribute('href', refvalue);}
}

//richiamo funzioni al caricamento della pagina 
window.onload=gestoreload;