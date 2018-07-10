function ajax(ruta,controlador,parametro,id,tipo){
    var pagina=ruta+"/"+controlador+parametro;
    var xmlhttp;
    if(window.XMLHttpRequest){
        xmlhttp= new XMLHttpRequest();
    }else{
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.onreadystatechange=function (){
        if(xmlhttp.readyState===4 && xmlhttp.status=== 200){
            document.getElementById(id).innerHTML=xmlhttp.responseText;
        }
    }
    
    xmlhttp.open(tipo,pagina,true);
    xmlhttp.send(null);
}

function cambiarPagina(ruta,controlador,parametro,id,tipo)
{
    ajax(ruta,controlador,parametro,id,tipo);
}
