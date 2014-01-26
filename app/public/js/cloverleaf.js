/**
 *
 * CloverLeaf JS
 *
 **/
 
;(function($, undefined){

// @todo remove global LEAF object if possible
var LEAF = window.LEAF = $.extend(window.LEAF||{}, {

  version: 1.0,
  debug: !!window.location.href.match('dev'),
  preventRedirects: false,
  init: function init(){
    log('Initializing');

    // Selectively initialize functionality
    if ($('.dashboard').length) LEAF.dashboard.init();
  },
  
  dashboard: {
    init: function init() {
      // Setup the action for the on/off buttons
      $('.dashboard button').on('click', LEAF.dashboard.button);
    },
    
    // The on/off action
    button: function button() {
      var button = $(this);
      var uri    = button.data('switch-uri'); 
      if (uri) {
        $.ajax({
          url: uri,
          type: 'GET',
          cache: false,
          success: function(resp, txt) {
            log('Switch for '+uri+' returned '+txt);
          }
        }); 
      }
    },
    
    end: 'dashboard'
  },


  end: 'LEAF'
});

// Debug logger
function log(msg, error) {
  if (LEAF.debug || error) {
    console.log(msg);
  }
}

// Redirect unless anti-redirect flag is set
function redirect( url ) {
  if (!LEAF.preventRedirects) {
    window.location.href = url;
  }
}

// Deserialize the results of serializeArray
// overwrites duplicate keys
function deserialize( fields ) {
  var hash = {};
  $.each(fields, function(i, obj){
    hash[obj.name] = obj.value;
  });
  return hash;
}


// Cookie functions
function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else var expires = "";
  document.cookie = name+"="+value+expires+";domain=.cloverleaf;path=/";
}

function readCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}

function eraseCookie(name) {
  createCookie(name,"",-1);
}

$(document).ready(function(){
  LEAF.init();
$.fn.editable.defaults.mode = 'inline';
$('#key').editable();
$('#value').editable();
});

})(window.jQuery);


// make it safe to use console.log always
(function(b){function c(){}for(var d="assert,clear,count,debug,dir,dirxml,error,exception,firebug,group,groupCollapsed,groupEnd,info,log,memoryProfile,memoryProfileEnd,profile,profileEnd,table,time,timeEnd,timeStamp,trace,warn".split(","),a;a=d.pop();){b[a]=b[a]||c}})((function(){try
{console.log();return window.console;}catch(err){return window.console={};}})());

/**
 * Polyfills
 */
/* - could be useful
Modernizr.load({
  test: Modernizr.input.placeholder,
  nope: '/js/jquery.html5support.min.js',
});
*/
