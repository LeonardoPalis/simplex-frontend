var datatablesEmp;
var Products = {
  init: function(){
    Products.setupEvents();
    Products.setupDatatables();
  },
setupDatatables: function () {
    console.log("Setup Datatables");

    // Setup DataTables and configuration options
    // The table's data-source attribute contains the AJAX source url
    // NOTE: Default settings can be changed in datatables_settings.js file
    datatablesEmp = $('#pro-table').DataTable({
      "ajax": $('#pro-table').data('source'),
      "dom": '<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
      "caseInsensitive": false,
      "pagingType": "simple_numbers",
      "bProcessing": true,
      "serverSide": true,
      "lengthMenu": [ 10, 25, 50, 75, 100 ],
      "order": [[ 0, 'asc' ]],
      "columns": [
      { data: '0', sortable: true, searchable: true },
      { data: '1', sortable: false, searchable: false },
      { data: '2', sortable: false, searchable: false },
      { data: '3', sortable: false, searchable: false }
      ],
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.9/i18n/Portuguese-Brasil.json"
      },
      "iDisplayLength": 10,
      "drawCallback" : function() {
    // Executed every time DataTable is drawn (after all data is loaded in table)

    // Set row click event (edit)
    Products.setRowAction();
    }
    });

    

    $(".multiple").select2();


},
setRowAction: function () {
// Set action on click on DataTable row
$('.dataTable tbody').on('click', 'tr', function (e) {
if(e.target.nodeName != "A") { // if clicked element is not another link in the row
var link = $(this).find('.row-action').first().attr('href'); // look for row action link and use the href field

// Go to link
// Go to link
if (typeof link != "undefined") {
window.location.href = link;
}
}
});
},
setupEvents: function(){
    

}
}
jQuery(document).ready(function () {
  Products.init();
});