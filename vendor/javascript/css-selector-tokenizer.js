import*as e from"fastparse";import*as t from"cssesc";var a={};a={typeMatchClass:"\\.((?:\\\\(?:[\\0-\\t\\x0B\\f\\x0E-\\u2027\\u202A-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF])|(?:[\\x2DA-Z_a-z\\xA0-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF]))(?:\\\\(?:[\\0-\\t\\x0B\\f\\x0E-\\u2027\\u202A-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF])|(?:[\\x2D0-9A-Z_a-z\\xA0-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF]))*)",typeMatchId:"#((?:\\\\(?:[\\0-\\t\\x0B\\f\\x0E-\\u2027\\u202A-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF])|(?:[\\x2DA-Z_a-z\\xA0-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF]))(?:\\\\(?:[\\0-\\t\\x0B\\f\\x0E-\\u2027\\u202A-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF])|(?:[\\x2D0-9A-Z_a-z\\xA0-\\uD7FF\\uE000-\\uFFFF]|[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[\\uD800-\\uDBFF](?![\\uDC00-\\uDFFF])|(?:[^\\uD800-\\uDBFF]|^)[\\uDC00-\\uDFFF]))*)",identifierEscapeRegexp:"(^[\\0-,\\.-@\\[-\\^`\\{-\\x9F]|^\\x2D\\x2D|[\\0-,\\.\\/:-@\\[-\\^`\\{-\\x9F])"};var s=a;var n="default"in e?e.default:e;var r={};var u=n;var c=s;function unescape(e){return e.replace(/\\(.)/g,"$1")}function commentMatch$1(e,t){this.selector.nodes.push({type:"comment",content:t})}function typeMatch(e){return function(t,a){this.selector.nodes.push({type:e,name:unescape(a)})}}function pseudoClassStartMatch(e,t){var a={type:"pseudo-class",name:unescape(t),content:""};this.selector.nodes.push(a);this.token=a;this.brackets=1;return"inBrackets"}function nestedPseudoClassStartMatch(e,t,a){var s={type:"selector",nodes:[]};var n={type:"nested-pseudo-class",name:unescape(t),nodes:[s]};a&&(s.before=a);this.selector.nodes.push(n);this.stack.push(this.root);this.root=n;this.selector=s}function nestedEnd(e,t){if(this.stack.length>0){t&&(this.selector.after=t);this.root=this.stack.pop();this.selector=this.root.nodes[this.root.nodes.length-1]}else this.selector.nodes.push({type:"invalid",value:e})}function operatorMatch(e,t,a,s){var n={type:"operator",operator:a};t&&(n.before=t);s&&(n.after=s);this.selector.nodes.push(n)}function spacingMatch$1(e){this.selector.nodes.push({type:"spacing",value:e})}function elementMatch(e,t,a){var s={type:"element",name:unescape(a)};t&&(s.namespace=unescape(t.substr(0,t.length-1)));this.selector.nodes.push(s)}function universalMatch(e,t){var a={type:"universal"};t&&(a.namespace=unescape(t.substr(0,t.length-1)));this.selector.nodes.push(a)}function attributeMatch(e,t){this.selector.nodes.push({type:"attribute",content:t})}function invalidMatch(e){this.selector.nodes.push({type:"invalid",value:e})}function irrelevantSpacingStartMatch(e){this.selector.before=e}function irrelevantSpacingEndMatch(e){this.selector.after=e}function nextSelectorMatch(e,t,a){var s={type:"selector",nodes:[]};t&&(this.selector.after=t);a&&(s.before=a);this.root.nodes.push(s);this.selector=s}function addToCurrent(e){this.token.content+=e}function bracketStart(e){this.token.content+=e;this.brackets++}function bracketEnd(e){if(0===--this.brackets)return"selector";this.token.content+=e}function getSelectors(){var e={"/\\*([\\s\\S]*?)\\*/":commentMatch$1};e[c.typeMatchClass]=typeMatch("class");e[c.typeMatchId]=typeMatch("id");var t={":(not|any|-\\w+?-any|matches|is|where|has|local|global)\\((\\s*)":nestedPseudoClassStartMatch,":((?:\\\\.|[A-Za-z_\\-0-9])+)\\(":pseudoClassStartMatch,":((?:\\\\.|[A-Za-z_\\-0-9])+)":typeMatch("pseudo-class"),"::((?:\\\\.|[A-Za-z_\\-0-9])+)":typeMatch("pseudo-element"),"(\\*\\|)((?:\\\\.|[A-Za-z_\\-0-9])+)":elementMatch,"(\\*\\|)\\*":universalMatch,"((?:\\\\.|[A-Za-z_\\-0-9])*\\|)?\\*":universalMatch,"((?:\\\\.|[A-Za-z_\\-0-9])*\\|)?((?:\\\\.|[A-Za-z_\\-])(?:\\\\.|[A-Za-z_\\-0-9])*)":elementMatch,"\\[([^\\]]+)\\]":attributeMatch,"(\\s*)\\)":nestedEnd,"(\\s*)((?:\\|\\|)|(?:>>)|[>+~])(\\s*)":operatorMatch,"(\\s*),(\\s*)":nextSelectorMatch,"\\s+$":irrelevantSpacingEndMatch,"^\\s+":irrelevantSpacingStartMatch,"\\s+":spacingMatch$1,".":invalidMatch};var a;for(a in t)Object.prototype.hasOwnProperty.call(t,a)&&(e[a]=t[a]);return e}var o=new u({selector:getSelectors(),inBrackets:{"/\\*[\\s\\S]*?\\*/":addToCurrent,'"([^\\\\"]|\\\\.)*"':addToCurrent,"'([^\\\\']|\\\\.)*'":addToCurrent,"[^()'\"/]+":addToCurrent,"\\(":bracketStart,"\\)":bracketEnd,".":addToCurrent}});function parse$1(e){var t={type:"selector",nodes:[]};var a={type:"selectors",nodes:[t]};o.parse("selector",e,{stack:[],root:a,selector:t});return a}r=parse$1;var i=r;var p={};var F=s;var h=new RegExp(F.identifierEscapeRegexp,"g");function escape$1(e,t){return"*"===e?"*":t?e.replace(h,"\\$1"):e.replace(/(^[^A-Za-z_\\-]|^--|[^A-Za-z_0-9\\-])/g,"\\$1")}function stringifyWithoutBeforeAfter$1(e){switch(e.type){case"selectors":return e.nodes.map(stringify$2).join(",");case"selector":return e.nodes.map(stringify$2).join("");case"element":return("string"===typeof e.namespace?escape$1(e.namespace)+"|":"")+escape$1(e.name);case"class":return"."+escape$1(e.name,true);case"id":return"#"+escape$1(e.name,true);case"attribute":return"["+e.content+"]";case"spacing":return e.value;case"pseudo-class":return":"+escape$1(e.name)+("string"===typeof e.content?"("+e.content+")":"");case"nested-pseudo-class":return":"+escape$1(e.name)+"("+e.nodes.map(stringify$2).join(",")+")";case"pseudo-element":return"::"+escape$1(e.name);case"universal":return("string"===typeof e.namespace?escape$1(e.namespace)+"|":"")+"*";case"operator":return e.operator;case"comment":return"/*"+e.content+"*/";case"invalid":return e.value}}function stringify$2(e){var t=stringifyWithoutBeforeAfter$1(e);e.before&&(t=e.before+t);e.after&&(t+=e.after);return t}p=stringify$2;var l=p;var f="default"in e?e.default:e;var d={};var D=f;function commentMatch(e,t){this.value.nodes.push({type:"comment",content:t})}function spacingMatch(e){var t=this.value.nodes[this.value.nodes.length-1];t.after=(t.after||"")+e}function initialSpacingMatch(e){this.value.before=e}function endSpacingMatch(e){this.value.after=e}function unescapeString(e){return e.replace(/\\(?:([a-fA-F0-9]{1,6})|(.))/g,(function(e,t,a){if(a)return a;var s=parseInt(t,16);return s<65536?String.fromCharCode(s):String.fromCharCode(Math.floor((s-65536)/1024)+55296)+String.fromCharCode((s-65536)%1024+56320)}))}function stringMatch(e,t){var a=unescapeString(t);this.value.nodes.push({type:"string",value:a,stringType:e[0]})}function commaMatch(e,t){var a={type:"value",nodes:[]};t&&(a.before=t);this.root.nodes.push(a);this.value=a}function itemMatch(e){this.value.nodes.push({type:"item",name:e})}function nestedItemMatch(e,t,a){this.stack.push(this.root);this.root={type:"nested-item",name:t,nodes:[{type:"value",nodes:[]}]};a&&(this.root.nodes[0].before=a);this.value.nodes.push(this.root);this.value=this.root.nodes[0]}function nestedItemEndMatch(e,t,a){if(0===this.stack.length){if(t){var s=this.value.nodes[this.value.nodes.length-1];s.after=(s.after||"")+t}this.value.nodes.push({type:"invalid",value:a})}else{t&&(this.value.after=t);this.root=this.stack.pop();this.value=this.root.nodes[this.root.nodes.length-1]}}function urlMatch(e,t,a,s){var n={type:"url"};t&&(n.innerSpacingBefore=t);s&&(n.innerSpacingAfter=s);switch(a[0]){case'"':n.stringType='"';n.url=unescapeString(a.substr(1,a.length-2));break;case"'":n.stringType="'";n.url=unescapeString(a.substr(1,a.length-2));break;default:n.url=unescapeString(a);break}this.value.nodes.push(n)}var v=new D({decl:{"^\\s+":initialSpacingMatch,"/\\*([\\s\\S]*?)\\*/":commentMatch,'"((?:[^\\\\"]|\\\\.)*)"':stringMatch,"'((?:[^\\\\']|\\\\.)*)'":stringMatch,'url\\((\\s*)("(?:[^\\\\"]|\\\\.)*")(\\s*)\\)':urlMatch,"url\\((\\s*)('(?:[^\\\\']|\\\\.)*')(\\s*)\\)":urlMatch,"url\\((\\s*)((?:[^\\\\)'\"]|\\\\.)*)(\\s*)\\)":urlMatch,"([\\w-]+)\\((\\s*)":nestedItemMatch,"(\\s*)(\\))":nestedItemEndMatch,",(\\s*)":commaMatch,"\\s+$":endSpacingMatch,"\\s+":spacingMatch,"[^\\s,)]+":itemMatch}});function parseValues$1(e){var t={type:"value",nodes:[]};var a={type:"values",nodes:[t]};v.parse("decl",e,{stack:[],root:a,value:t});return a}d=parseValues$1;var g=d;var m="default"in t?t.default:t;var y={};var M=m;var C;function escape(e,t){return M(e,{quotes:'"'===t?"double":"single"})}function stringifyWithoutBeforeAfter(e){switch(e.type){case"values":return e.nodes.map(C).join(",");case"value":return e.nodes.map(C).join("");case"item":return e.name;case"nested-item":return e.name+"("+e.nodes.map(C).join(",")+")";case"invalid":return e.value;case"comment":return"/*"+e.content+"*/";case"string":switch(e.stringType){case"'":return"'"+escape(e.value,"'")+"'";case'"':return'"'+escape(e.value,'"')+'"'}throw new Error("Invalid stringType");case"url":var t="url("+(e.innerSpacingBefore||"");var a=(e.innerSpacingAfter||"")+")";switch(e.stringType){case"'":return t+"'"+e.url.replace(/(\\)/g,"\\$1").replace(/'/g,"\\'")+"'"+a;case'"':return t+'"'+e.url.replace(/(\\)/g,"\\$1").replace(/"/g,'\\"')+'"'+a;default:return t+e.url.replace(/("|'|\)|\\)/g,"\\$1")+a}}}C=function stringify(e){var t=stringifyWithoutBeforeAfter(e);e.before&&(t=e.before+t);e.after&&(t+=e.after);return t};y=C;var B=y;var S={};S.parse=i;S.stringify=l;S.parseValues=g;S.stringifyValues=B;const b=S.parse,$=S.stringify,A=S.parseValues,x=S.stringifyValues;export default S;export{b as parse,A as parseValues,$ as stringify,x as stringifyValues};
