// JavaScript Document
  function swapClass(id,dest,classe){
            window.id=id;
            window.dest=dest;
            window.classe=classe;
        	troca(id,dest,classe);
	}
	function troca(id,dest,classe){
	try{
         id=window.id;
         dest=window.dest;
         classe=window.classe;
  	var numPag=dest;
	  numPag=numPag.substr(numPag.indexOf('pagina')+'pagina'.length);

  	numPag=numPag.replace('pagina','');
	  numPag=numPag.replace('.htm','');

  	if(numPag.indexOf('index')>-1){
	    numPag=0;
	  }
	  document.getElementById(id).getElementsByTagName('a')[numPag].className=classe;
	}
	catch(ee){
          try{
            document.getElementById(id).getElementsByTagName('a')[0].className=classe; 
	  }
          catch(ee){
            setTimeout(troca,'100',id,dest,classe);
	  }
	}
}//swapClass

 function swapClassNew(id,orig,dest,classe){
            window.id=id;
            window.orig=orig;
            window.dest=dest;
            window.classe=classe;
        	trocaNew(id,orig,dest,classe);
	}
	function trocaNew(id,orig,dest,classe){
	try{
         id=window.id;
         dest=window.dest;
         classe=window.classe;
         orig=window.orig;
  	var numPag=dest;
	  numPag=numPag.substr(numPag.indexOf('pagina')+'pagina'.length);

  	numPag=numPag.replace('pagina','');
	  numPag=numPag.replace('.htm','');

  	if(numPag.indexOf('index')>-1){
	    numPag=0;
	  }
	  document.getElementById(id).getElementsByTagName(orig)[numPag].className=classe;
	}
	catch(ee){
          try{
            document.getElementById(id).getElementsByTagName(orig)[0].className=classe; 
	  }
          catch(ee){
            setTimeout(trocaNew,'100',id,orig,dest,classe);
	  }
	}
}//swapClass


	



