function Tipo_Documento(ruta,controlador,op){
    this.ruta=ruta;
    this.controlador=controlador;
    this.op=op;  
}

Tipo_Documento.prototype.listarTipoDocumento=function(){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op
        },
        success: function(response){
            var listaTipoDocumento=$.parseJSON(response);
            $('#cbTipoDocumentoAddLibro option').remove();
            $('#cbTipoDocumentoAddLibro').append($('<option>',{
                value:-1,
                text: "........."
            }));
            for(var i=0; i<listaTipoDocumento.length; i++){
                $('#cbTipoDocumentoAddLibro').append($('<option>', {
                    value: listaTipoDocumento[i].id_tipo_documento,
                    text: listaTipoDocumento[i].tipo
                }));
            }
            $('#cbTipoDocumentoEditLibro option').remove();
            $('#cbTipoDocumentoEditLibro').append($('<option>',{
                value:-1,
                text: "........."
            }));
            for(var i=0; i<listaTipoDocumento.length; i++){
                $('#cbTipoDocumentoEditLibro').append($('<option>', {
                    value: listaTipoDocumento[i].id_tipo_documento,
                    text: listaTipoDocumento[i].tipo
                }));
            }
        }
    });
}