function cargarGraficasDonut(ruta,controlador,op){
    
    $.ajax({
        type: 'POST',
        url: ruta+"/"+controlador,
        data:{
            op:op
        },
        success:function(response){
            var valores=$.parseJSON(response);
            Morris.Donut({
                element: 'donut-example',
                data: [
                  {label: "Presencial", value: valores[0]},
                  {label: "Virtual", value: valores[1]}
                ]
              });
        }
    });
}

function cargarGraficasArea(ruta,controlador,op){

    $.ajax({
        type: 'POST',
        url: ruta+"/"+controlador,
        data:{
            op:op
        },
        success:function(response){
            var valores=$.parseJSON(response);
          var data=[
              ['2018/01',0,0],
              ['2018/02',0,0],
              ['2018/03',0,0],
              ['2018/04',0,0],
              ['2018/05',0,0],
              ['2018/06',0,0],
              ['2018/07',0,0],
              ['2018/08',0,0],
              ['2018/09',0,0],
              ['2018/10',0,0],
              ['2018/11',0,0],
              ['2018/12',0,0]
          ]
            
            for(var i=0; i<valores[0].length; i++){
                if(valores[0][i] === null){
                    break;
                }else{
                   for(var j=0 ; j<11; j++){
                       if(data[j][0] === valores[0][i].substr(0,7)){
                           data[j][1] =  data[j][1]+1;
                       }
                   }
                }
            }
            
            
            
            var valores=$.parseJSON(response);
            for(var i=0; i<valores[1].length; i++){
                if(valores[1][i] === null){
                    break;
                }else{
                   for(var j=0 ; j<11; j++){
                       if(data[j][0] === valores[1][i].substr(0,7)){
                           data[j][2] =  data[j][2]+1;
                       }
                   }
                }
            }
            var months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];

            Morris.Area({
              element: 'area-example',
              data: [{
                m:"2018-01",
                a: data[0][2],
                b: data[0][1]
               }, {
                m: "2018-02",
                a: data[1][2],
                b: data[1][1]
              }, {
                m: "2018-03",
               a: data[2][2],
                b: data[2][1]
              }, {
                m:"2018-04",
                a: data[3][2],
                b: data[3][1]
              }, {
                m: "2018-05",
               a: data[4][2],
                b: data[4][1]
              }, {
                m: "2018-06",
               a: data[5][2],
                b: data[5][1]
              }, {
                m: "2018-07",
                a: data[6][2],
                b: data[6][1]
              }, {
                m: "2018-08",
                a: data[7][2],
                b: data[7][1]
              }, {
                m: "2018-09",
               a: data[8][2],
                b: data[8][1]
              }, {
                m: "2018-10",
                a: data[9][2],
                b: data[9][1]
              }, {
                m:"2018-11",
               a: data[10][2],
                b: data[10][1]
              }, {
                m: "2018-12",
                a: data[11][2],
                b: data[11][1]
              }, ],
              xkey: 'm',
              ykeys: ['a', 'b'],
              labels: ['Presencial', 'Virtual'],
              xLabelFormat: function(x) { // <--- x.getMonth() returns valid index
                var month = months[x.getMonth()];
                return month;
              },
              dateFormat: function(x) {
                var month = months[new Date(x).getMonth()];
                return month;
              },
            });
        }
    });
}