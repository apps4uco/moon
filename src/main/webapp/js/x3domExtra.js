(function(){
	    'use strict';
	    function X3dElementFullscreenChange(evt) {
	        var button = document.getElementById('X3dElementToggler');
	        if (!document.fullscreenElement &&    // alternative standard method
	            !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
	            button.innerHTML = "FullScreen";
	        } else {
	            button.innerHTML = "Exit FullScreen";
	        }
	    }

	    function X3dElementFullscreenToggler(evt) {
	        var button = evt.target;
	        var x3d_element = button.parentElement;

	        if (!document.fullscreenElement &&    // alternative standard method
	            !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
	            if (x3d_element.requestFullscreen) {
	                x3d_element.requestFullscreen();
	            } else if (x3d_element.mozRequestFullScreen) {
	                x3d_element.mozRequestFullScreen();
	            } else if (x3d_element.webkitRequestFullscreen) {
	                x3d_element.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
	            }
	        } else {
	            if (document.cancelFullScreen) {
	                document.cancelFullScreen();
	            } else if (document.mozCancelFullScreen) {
	                document.mozCancelFullScreen();
	            } else if (document.webkitCancelFullScreen) {
	                document.webkitCancelFullScreen();
	            }
	        }
	    }

	    document.getElementById('X3dElementToggler').addEventListener("click", X3dElementFullscreenToggler, false);
	    // Only available on document, not the element !
	    document.addEventListener("fullscreenchange", X3dElementFullscreenChange, false);
	    document.addEventListener("mozfullscreenchange", X3dElementFullscreenChange, false);
	    document.addEventListener("webkitfullscreenchange", X3dElementFullscreenChange, false);
	    X3dElementFullscreenChange();
	})();
