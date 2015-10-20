// Begin Header JS 
var captionLength = 0;
var caption = '';


function type() {
    captionEl.html(caption.substr(0, captionLength++));
    if(captionLength <= caption.length) {
        setTimeout('type()', 25);
    } 
}

function ErasingEffect() {
    caption = captionEl.html();
    captionLength = caption.length;
    if (captionLength>0) {
        erase();
    }
}

function erase() {
    captionEl.html(caption.substr(0, captionLength--));
    if(captionLength >= 0) {
        setTimeout('erase()', 25);
    } else {
        captionLength = 0;
        caption = '';
    }	
}

function cursorAnimation() {
    $('#cursor').animate({
        opacity: 0
    }, 'fast', 'swing').animate({
        opacity: 1
    }, 'fast', 'swing');
}

$(document).ready(function(){

	  setTimeout(function(){
	    $('#anim-logo-bronx').addClass("active")
	  }, 1000);
	  
	 setTimeout(function(){
	    $('#anim-logo-our').addClass("active")
	  }, 2500);
	  
	 setTimeout(function(){
	    $('#anim-logo-emphasis').addClass("active")
	  }, 3000);


	setInterval (cursorAnimation, 600);
    captionEl = $('#caption');
    
    
    var time = 6000;

    $("#transition-text li").each(function(txtIndex, text) {
    	// debugger;
    	var me = $(this);
    	setTimeout(function(){
          caption = me.text();
          if(!(txtIndex == 5)) {
	      	setTimeout('ErasingEffect()', 4000);
	      } else {   
	      	setTimeout(function() {
			$('#cursor').fadeOut();
	        }, 5000);
	      }
          type();
    	}, time);
        
	    time += 6000
	
    })
	 
});





// End Header JS 