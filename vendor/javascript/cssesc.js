var e={};var r={};var t=r.hasOwnProperty;var a=function merge(e,r){if(!e)return r;var a={};for(var s in r)a[s]=t.call(e,s)?e[s]:r[s];return a};var s=/[ -,\.\/:-@\[-\^`\{-~]/;var i=/[ -,\.\/:-@\[\]\^`\{-~]/;var n=/['"\\]/;var o=/(^|\\+)?(\\[A-F0-9]{1,6})\x20(?![a-fA-F0-9\x20])/g;var v=function cssesc(e,r){r=a(r,cssesc.options);"single"!=r.quotes&&"double"!=r.quotes&&(r.quotes="single");var t="double"==r.quotes?'"':"'";var n=r.isIdentifier;var v=e.charAt(0);var l="";var c=0;var f=e.length;while(c<f){var p=e.charAt(c++);var u=p.charCodeAt();var g=void 0;if(u<32||u>126){if(u>=55296&&u<=56319&&c<f){var d=e.charCodeAt(c++);56320==(64512&d)?u=((1023&u)<<10)+(1023&d)+65536:c--}g="\\"+u.toString(16).toUpperCase()+" "}else g=r.escapeEverything?s.test(p)?"\\"+p:"\\"+u.toString(16).toUpperCase()+" ":/[\t\n\f\r\x0B]/.test(p)?"\\"+u.toString(16).toUpperCase()+" ":"\\"==p||!n&&('"'==p&&t==p||"'"==p&&t==p)||n&&i.test(p)?"\\"+p:p;l+=g}n&&(/^-[-\d]/.test(l)?l="\\-"+l.slice(1):/\d/.test(v)&&(l="\\3"+v+" "+l.slice(1)));l=l.replace(o,(function(e,r,t){return r&&r.length%2?e:(r||"")+t}));return!n&&r.wrap?t+l+t:l};v.options={escapeEverything:false,isIdentifier:false,quotes:"single",wrap:false};v.version="3.0.0";e=v;var l=e;export default l;

