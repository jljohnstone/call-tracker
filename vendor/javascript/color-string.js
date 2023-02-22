import*as r from"color-name";import*as a from"simple-swizzle";var t="default"in r?r.default:r;var e="default"in a?a.default:a;var n={};var s=t;var l=e;var o=Object.hasOwnProperty;var u=Object.create(null);for(var h in s)o.call(s,h)&&(u[s[h]]=h);var d=n={to:{},get:{}};d.get=function(r){var a=r.substring(0,3).toLowerCase();var t;var e;switch(a){case"hsl":t=d.get.hsl(r);e="hsl";break;case"hwb":t=d.get.hwb(r);e="hwb";break;default:t=d.get.rgb(r);e="rgb";break}return t?{model:e,value:t}:null};d.get.rgb=function(r){if(!r)return null;var a=/^#([a-f0-9]{3,4})$/i;var t=/^#([a-f0-9]{6})([a-f0-9]{2})?$/i;var e=/^rgba?\(\s*([+-]?\d+)(?=[\s,])\s*(?:,\s*)?([+-]?\d+)(?=[\s,])\s*(?:,\s*)?([+-]?\d+)\s*(?:[,|\/]\s*([+-]?[\d\.]+)(%?)\s*)?\)$/;var n=/^rgba?\(\s*([+-]?[\d\.]+)\%\s*,?\s*([+-]?[\d\.]+)\%\s*,?\s*([+-]?[\d\.]+)\%\s*(?:[,|\/]\s*([+-]?[\d\.]+)(%?)\s*)?\)$/;var l=/^(\w+)$/;var u=[0,0,0,1];var h;var d;var v;if(h=r.match(t)){v=h[2];h=h[1];for(d=0;d<3;d++){var f=2*d;u[d]=parseInt(h.slice(f,f+2),16)}v&&(u[3]=parseInt(v,16)/255)}else if(h=r.match(a)){h=h[1];v=h[3];for(d=0;d<3;d++)u[d]=parseInt(h[d]+h[d],16);v&&(u[3]=parseInt(v+v,16)/255)}else if(h=r.match(e)){for(d=0;d<3;d++)u[d]=parseInt(h[d+1],0);h[4]&&(h[5]?u[3]=.01*parseFloat(h[4]):u[3]=parseFloat(h[4]))}else{if(!(h=r.match(n))){if(h=r.match(l)){if("transparent"===h[1])return[0,0,0,0];if(!o.call(s,h[1]))return null;u=s[h[1]];u[3]=1;return u}return null}for(d=0;d<3;d++)u[d]=Math.round(2.55*parseFloat(h[d+1]));h[4]&&(h[5]?u[3]=.01*parseFloat(h[4]):u[3]=parseFloat(h[4]))}for(d=0;d<3;d++)u[d]=clamp(u[d],0,255);u[3]=clamp(u[3],0,1);return u};d.get.hsl=function(r){if(!r)return null;var a=/^hsla?\(\s*([+-]?(?:\d{0,3}\.)?\d+)(?:deg)?\s*,?\s*([+-]?[\d\.]+)%\s*,?\s*([+-]?[\d\.]+)%\s*(?:[,|\/]\s*([+-]?(?=\.\d|\d)(?:0|[1-9]\d*)?(?:\.\d*)?(?:[eE][+-]?\d+)?)\s*)?\)$/;var t=r.match(a);if(t){var e=parseFloat(t[4]);var n=(parseFloat(t[1])%360+360)%360;var s=clamp(parseFloat(t[2]),0,100);var l=clamp(parseFloat(t[3]),0,100);var o=clamp(isNaN(e)?1:e,0,1);return[n,s,l,o]}return null};d.get.hwb=function(r){if(!r)return null;var a=/^hwb\(\s*([+-]?\d{0,3}(?:\.\d+)?)(?:deg)?\s*,\s*([+-]?[\d\.]+)%\s*,\s*([+-]?[\d\.]+)%\s*(?:,\s*([+-]?(?=\.\d|\d)(?:0|[1-9]\d*)?(?:\.\d*)?(?:[eE][+-]?\d+)?)\s*)?\)$/;var t=r.match(a);if(t){var e=parseFloat(t[4]);var n=(parseFloat(t[1])%360+360)%360;var s=clamp(parseFloat(t[2]),0,100);var l=clamp(parseFloat(t[3]),0,100);var o=clamp(isNaN(e)?1:e,0,1);return[n,s,l,o]}return null};d.to.hex=function(){var r=l(arguments);return"#"+hexDouble(r[0])+hexDouble(r[1])+hexDouble(r[2])+(r[3]<1?hexDouble(Math.round(255*r[3])):"")};d.to.rgb=function(){var r=l(arguments);return r.length<4||1===r[3]?"rgb("+Math.round(r[0])+", "+Math.round(r[1])+", "+Math.round(r[2])+")":"rgba("+Math.round(r[0])+", "+Math.round(r[1])+", "+Math.round(r[2])+", "+r[3]+")"};d.to.rgb.percent=function(){var r=l(arguments);var a=Math.round(r[0]/255*100);var t=Math.round(r[1]/255*100);var e=Math.round(r[2]/255*100);return r.length<4||1===r[3]?"rgb("+a+"%, "+t+"%, "+e+"%)":"rgba("+a+"%, "+t+"%, "+e+"%, "+r[3]+")"};d.to.hsl=function(){var r=l(arguments);return r.length<4||1===r[3]?"hsl("+r[0]+", "+r[1]+"%, "+r[2]+"%)":"hsla("+r[0]+", "+r[1]+"%, "+r[2]+"%, "+r[3]+")"};d.to.hwb=function(){var r=l(arguments);var a="";r.length>=4&&1!==r[3]&&(a=", "+r[3]);return"hwb("+r[0]+", "+r[1]+"%, "+r[2]+"%"+a+")"};d.to.keyword=function(r){return u[r.slice(0,3)]};function clamp(r,a,t){return Math.min(Math.max(a,r),t)}function hexDouble(r){var a=Math.round(r).toString(16).toUpperCase();return a.length<2?"0"+a:a}var v=n;export{v as default};

