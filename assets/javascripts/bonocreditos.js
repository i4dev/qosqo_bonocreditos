// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require datatables.min.js
//= require moment.min.js
//= require datetime-moment.js
//= require dataTables.buttons.min.js
//= require buttons.flash.min.js
//= require jszip.min.js
//= require pdfmake.min.js
//= require vfs_fonts.js
//= require buttons.html5.min.js
//= require buttons.print.min.js




$(function() {
	$("table.dataTable").DataTable({
		colReorder: true,
		keys: true,
		responsive: true,
		"order": [[ 0, "asc" ], [ 1, "asc" ]],
		columnDefs: [
			  { targets: 'no-sort', orderable: false },
			],
    dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ],
		"language": {
		    "sProcessing":     "Procesando...",
		    "sLengthMenu":     "Mostrar _MENU_ registros",
		    "sZeroRecords":    "No se encontraron resultados",
		    "sEmptyTable":     "Ningún dato disponible en esta tabla",
		    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
		    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
		    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		    "sInfoPostFix":    "",
		    "sSearch":         "Buscar:",
		    "sUrl":            "",
		    "sInfoThousands":  ",",
		    "sLoadingRecords": "Cargando...",
		    "oPaginate": {
		        "sFirst":    "Primero",
		        "sLast":     "Último",
		        "sNext":     "Siguiente",
		        "sPrevious": "Anterior"
		    },
		    "oAria": {
		        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
		        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
		    }
		}
	});
});
