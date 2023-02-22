import r from"is-arrayish";var a={};var t=r;var o=Array.prototype.concat;var n=Array.prototype.slice;var e=a=function swizzle(r){var a=[];for(var e=0,v=r.length;e<v;e++){var c=r[e];t(c)?a=o.call(a,n.call(c)):a.push(c)}return a};e.wrap=function(r){return function(){return r(e(arguments))}};var v=a;export default v;

