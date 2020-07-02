

function gestoreLoad (){

	// aggiungo collegamento google Font 
	var linkfont=document.createElement('link');
	linkfont.rel="stylesheet";
	linkfont.href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Noto+Serif+KR:wght@500;700&display=swap";
	document.head.appendChild(linkfont);

	//scroll to crediti e bibliografia
	$('.scroll-down').click (function() {
      $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
      return false;
    });
}

window.onload=gestoreLoad;


