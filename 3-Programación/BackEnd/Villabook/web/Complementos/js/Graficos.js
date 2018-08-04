function cargarGraficas(ruta,controlador,op){
    
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

            var months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];

            Morris.Area({
              element: 'area-example',
              data: [{
                m: '2015-01-09',
                a: 3,
                b: 5
               }, {
                m: '2015-02-09',
                a: 3,
                b: 5
              }, {
                m: '2015-03',
                a: 3,
                b: 5
              }, {
                m: '2015-04',
                a: 2,
                b: 3
              }, {
                m: '2015-05',
                a: 5,
                b: 8
              }, {
                m: '2015-06',
                a: 3,
                b: 1
              }, {
                m: '2015-07',
                a: 7,
                b: 9
              }, {
                m: '2015-08',
                a: 12,
                b: 4
              }, {
                m: '2015-09',
                a: 7,
                b: 6
              }, {
                m: '2015-10',
                a: 8,
                b: 2
              }, {
                m: '2015-11',
                a: 12,
                b: 2
              }, {
                m: '2015-12',
                a: 5,
                b: 2
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