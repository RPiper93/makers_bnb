$(document).ready(function() {
  // $( "#image" ).change(function() {
  // // var trashUI = function() {
  //   if($( "#image" ).val()) {
  //     $( ".image-upload-btn" ).text( "Image Ready!" );
  //     $( "#image-trash-btn" ).attr( "class", "image-trash-btn" );
  //   }
  //   else {
  //     $( ".image-upload-btn" ).text( "Upload Image" );
  //     $( "#image-trash-btn" ).attr( "class", "image-trash-btn hidden" );
  //   }
  // // }
  // // });

  // $( "#image-trash-btn" ).click(function() {
  //   $( "#image" ).val("");
  //   trashUI();
  // });

  $( ".unmask" ).on( "click", function() {
    var currentType = $( this ).prev( "input" ).attr( "type" );
    if (currentType == "password") {
      $( "#password" ).attr( "type", "text" );
      $( ".icon-password" ).children( "use" ).attr( "xlink:href", "#icon-eye-blocked" );
    }
    else if (currentType == "text") {
      $( "#password" ).attr( "type", "password" );
      $( ".icon-password" ).children( "use" ).attr( "xlink:href", "#icon-eye" );
    }
  });

  $( "#date_from" ).change(function() {
    var dateFrom = $( this ).val();
    var yyyy = Number(dateFrom.slice(0, 4));
    var mm = Number(dateFrom.slice(5, 7));
    var dd = Number(dateFrom.slice(8));
    var dateTo = String(new Date(yyyy, mm - 1, dd + 2).toISOString()).slice(0, 10);
    
    // console.log("Date From: " + String(dateFrom));
    // console.log("Date To (Unadjusted): " + String(new Date(yyyy, mm, dd).toISOString()).slice(0, 10) + " ... ಠ_ಠ");
    
    $( "#date_to" ).attr( "min", dateTo );
  });
});




