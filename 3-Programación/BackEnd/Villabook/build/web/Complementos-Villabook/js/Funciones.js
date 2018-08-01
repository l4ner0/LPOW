function cambiarPagina(ruta,controlador,parametro){
    document.form.action=ruta+"/"+controlador+parametro;
    document.form.method="POST";
    document.form.submit();
}