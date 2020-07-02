//dichiarazione variabili 
var maxwidth=1770;
var aree1=document.getElementsByClassName("classearea1");
var aree2=document.getElementsByClassName("classearea2");
var currentwidth1=document.getElementById("img1").width;
var currentwidth2=document.getElementById("img2").width;
var coordinate1=[];
var coordinate2=[];
var i;
var j;
var allspan=document.getElementsByTagName("span","#mostratesto");

function gestoreLoad(){

	//collegamento google Font<meta name="viewport" content="width=device-width,initial-scale=1">

	var metalink=document.createElement('meta');
	metalink.name="viewport";
	metalink.content="width=device-width,initial-scale=1";
	document.head.appendChild(metalink);
	var linkfont=document.createElement('link');
	linkfont.rel="stylesheet";
	linkfont.href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Noto+Serif+KR:wght@500;700&display=swap";
	document.head.appendChild(linkfont);

	//elimina informazioni non utili
	$(".nascosto").remove();
	$("#cancella").remove();

	//mostra testo di riga 
	$('#mostratesto').html($('#frasi').html().replace(/<br>\\*/g,"</span><span>"));
	$('span:empty').remove();//elimina span vuoti 
	var paragrafi = $('#mostratesto').children('span')
	//assegno id e class agli span contenenti righe di testo 
	var identifica=0;
	var classe="spantooltip";
	for (i=0;i<paragrafi.length;i++){
		paragrafi[i].setAttribute("id", identifica);
		paragrafi[i].setAttribute("class", classe);
		identifica=identifica + 1; }
	
	//richiamo funzioni per il resize dell'immagine interattiva
	assegnacoords1();
	assegnacoords2();
	correggicoords1();
	correggicoords2();

	// al mouse over sull'immagine segue la visualizzazione della riga di testo 
	$("area").mouseover(function(){
		var currentID=correctspan(this);
		var correctSpan;
		var id;
		var correctarea=selectarea(currentID);
		for(i=0;i<allspan.length;i++){
			id=allspan[i].getAttribute("id");
			if(id==currentID){
				correctSpan=allspan[i];}
		}
		var spantext=$(correctSpan).html();
		console.log(spantext);
		$("#contienitesto").html(spantext);
	});
}


//seleziona area
function selectarea(id){
	var allareas=document.getElementsByTagName("area");
	var area=allareas[id];
	return area;}

// funzioni per permettere il resize della imagemap senza perdere le coordinate
function assegnacoords1(){
	for(i=0;i<aree1.length;i++){
		var area1=aree1[i];
		coordinate1[i]=area1.coords.split(',');}
}
function assegnacoords2(){
	for(i=0;i<aree2.length;i++){
		var area2=aree2[i];
		coordinate2[i]=area2.coords.split(',');}
}
function correggicoords1(){
	if(currentwidth1<maxwidth){
		var ratio1=currentwidth1/maxwidth;
		for(i=0;i<aree1.length; i++){
			for(j=0;j<coordinate1[i].length;j++){
				coordinate1[i][j]*=ratio1;}
			aree1[i].coords=coordinate1[i].join(',');}
	}
}
function correggicoords2(){
	if(currentwidth2<maxwidth){
		var ratio2=currentwidth2/maxwidth;
		for(i=0;i<aree2.length; i++){
			for(j=0;j<coordinate2[i].length;j++){
				coordinate2[i][j]*=ratio2; }
			aree2[i].coords=coordinate2[i].join(',');}	
	}
}

//funzione associa area dell'immagine - testo riga (span)
function correctspan(area){
	var correctID;
	var currentclass=area.getAttribute("class");
	var idA=area.getAttribute("id");
	var idS;
	if (currentclass=="classearea1"){
		idA=area.getAttribute("id"); }
	else {
		idA=area.getAttribute("id");
		idA=Number(idA);
		idA=idA+22;	}
	for (i=0;i<allspan.length;i++){
		idS=allspan[i].getAttribute("id");
		if(idS==idA){
			correctID=idS;}
	} return(correctID);
}

// utilizzo della libreria maphilight
$(function(){
	$('.map').maphilight();
});

//richiamo funzioni al caricamento della pagina
window.onload=gestoreLoad;




