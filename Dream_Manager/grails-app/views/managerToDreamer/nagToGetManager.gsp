<!-- //TODO Finish View so it populates username in dialog and checks boolean also option to delay nag or remove -->

 <script>
  $(function() {
    $( "#dialog-confirm" ).dialog({
      resizable: false,
      height:140,
      modal: true,
      buttons: {
        "Yes": function() {
          $( this ).dialog( "close" );
        },
        "Ask me Later": function() {
          $( this ).dialog( "close" );
        }
      }
    });
  });
  </script> 
<div id="dialog-confirm" title="Dream Manager">
  <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>You currently do not have a Dream Manager, would you like to request one?</p>
</div>