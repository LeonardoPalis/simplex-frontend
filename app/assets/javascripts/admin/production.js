var datatablesRes;
var Production = {
  init: function(){
    Production.setupEvents();
    Production.setupDatatables();
  },
setupDatatables: function () {
    console.log("Setup Datatables"); 

    datatablesRes = $('#rest-table').DataTable({
      "ajax": $('#rest-table').data('source'),
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
      { data: '2', sortable: false, searchable: false }
      ],
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.9/i18n/Portuguese-Brasil.json"
      },
      "iDisplayLength": 10,
      "drawCallback" : function() {
    // Executed every time DataTable is drawn (after all data is loaded in table)

    // Set row click event (edit)
    Production.setRowAction();
    }
    });
    


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

  $('.multiple-select').select2();
  $(".js_error").addClass("hidden");
  $( ".btn-submit" ).click(function() {
    console.log($(this).parent().parent().parent().parent().parent().parent().find(".js_error"));
    var error;
    var j_error = false;
    var i = 0;
    $(this).parent().parent().parent().find("input[type='text']").each(function(){
      console.log($(this).val());
      if($(this).val() == "" ||  (parseInt($(this).val(), 10) < 0) ){
        $(this).attr("style","border-color:red");
        j_error = true;
      }
      if(i == 1){
        error = $(this).val();
      }
      i++;
      if(j_error){
        $("#js_error-"+error).removeClass("hidden");
      }else{
        $("#js_error-"+error).addClass("hidden");
        $(this).removeAttr("style");
      }
      //$(this).attr("disabled",true);
    });

    //alert($(this).parent().parent().parent().find("input[type='text']").find(".work_hour_per_unit").val());
    if(!j_error){
      $("#"+error).submit();
      $("#js_success-"+error).removeClass("hidden");
    }


  });

  $(".opt-func").click(function(){
    if($(this).html() == "Adicionar funcionários"){
      $(this).parent().find(".box-func").removeClass("hidden");
      $(this).html("Cancelar");
      $(this).addClass("btn-production-danger");
      $(this).parent().find(".salvar-func").removeClass("hidden");
    }
    else{
      $(this).parent().find(".box-func").addClass("hidden");
      $(this).html("Adicionar funcionários");
      $(this).removeClass("btn-production-danger");
      $(this).parent().find(".salvar-func").addClass("hidden");
    }
  });

   $(".opt-rec").click(function(){
    if($(this).html() == "Adicionar restrições"){
      $(this).parent().find(".box-rec").removeClass("hidden");
      $(this).html("Cancelar");
      $(this).addClass("btn-production-danger");
      $(this).parent().find(".salvar-rec").removeClass("hidden");
    }
    else{
      $(this).parent().find(".box-rec").addClass("hidden");
      $(this).html("Adicionar restrições");
      $(this).removeClass("btn-production-danger");
      $(this).parent().find(".salvar-rec").addClass("hidden");
    }
  });

  $( ".btn-show" ).click(function() {
    swal($(this).parent().parent().parent().html());
  });

  $(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-show-green").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(this).removeClass("btn-default").addClass("btn-show-green");   
});

}
}
jQuery(document).ready(function () {
  Production.init();
});