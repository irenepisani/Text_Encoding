
function gestoreLoad (){
	//rimuovo tooltip da infobox
	$(".infolettera ").children('span').removeClass('tooltip');
	$(".infolettera ").children('span').removeClass('coloratoPerson');
	$(".infolettera ").children('span').removeClass('coloratoPlace');
	$(".infolettera ").children('span').removeClass('tooltiptext');
	$(".infolettera ").children('span').removeClass('descPerson');

	//nascondo di default forma espansa delle abbreviazioni
	$(".expan").css("display","none");
	
	//aggiungo collegamento google Font
	var linkfont=document.createElement('link');
	linkfont.rel="stylesheet";
	linkfont.href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Noto+Serif+KR:wght@500;700&display=swap";
	document.head.appendChild(linkfont);

	//richiamo funzioni utili
	assegnaIDnote();
	assegnahref();

	// jquery toogle - mostra nascondi abbbreviazioni
	$(".abbr").click(function(){
		toggleAbbr(this);
		});
	$(".expan").click(function(){
		toggleExpan(this);
		}); 
}

//assegno id alle note della lettera 
function assegnaIDnote (){
	var idnota=0;
	var notes=document.getElementsByClassName("notes");
	var i=0;
	for(i=0; i<notes.length; i++){
		notes[i].setAttribute('id', idnota);
		idnota=idnota+1;}
}

//toggle jquery su abbr - expan :mostra e nascondi
function toggleAbbr(span){
	var x=span.nextSibling;
	span.style.display="none";
	x.style.display="unset";
}
function toggleExpan(span){
	var x=span.previousSibling;
	span.style.display="none";
	x.style.display="unset";
}

//assegno attributo href ai link (tag a) presenti nei tooltip 
function assegnahref (){
	var links=document.getElementsByTagName('a');
	console.log(links);
	var i=0;
	for(i=1; i<links.length; i++){
		var ref=links[i];
		var refvalue=ref.textContent;
		links[i].setAttribute('href', refvalue);}
}

//richiamo funzioni al caricamento della pagina
window.onload=gestoreLoad;