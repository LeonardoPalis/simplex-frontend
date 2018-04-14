/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,
 * or any plugin's vendor/assets/stylesheets directory can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any styles
 * defined in the other CSS/SCSS files in this directory. It is generally better to create a new
 * file per style scope.
 *
 * ---
 * NOTE: The AbsoluteAdmin theme CSS files that are referenced below are located in the folder
 * vendor/assets/theme located in the root (and can be referenced using a relative path).
 * ---
 *= require jquery
 *= require jquery_ujs
 *= require jquery-ui
 *= require plugins/migrate/jquery-migrate-1.3.0.min
 *= require jquery.turbolinks
 *= require js/utility/utility
 *= require js/main
 *= require sweetalert/dist/sweetalert.min
 *= require sweet-alert-confirm
 *= require jquery.inputmask
 *= require admin-tools/admin-forms/js/jquery.validate.min
 *= require plugins/datatables/media/js/jquery.dataTables
 *= require plugins/datatables/media/js/dataTables.bootstrap.js
 *= require plugins/select2/select2.full.min
 *= require plugins/select2/i18n/pt-BR
 *= require geocomplete 
*/

$(document).ready(function () {
  var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });  
});