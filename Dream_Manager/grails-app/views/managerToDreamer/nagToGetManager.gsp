<!-- //TODO Finish View so it populates username in dialog and checks boolean also option to delay nag or remove -->
<script>
	$(function() {
		$("#dialog-confirmNagDreamer")
				.dialog(
						{
							resizable : false,
							height : 200,
							modal : true,
							buttons : {
								"Yes" : function() {
									location.href = "<dreamManager:linkToAction controller="managerToDreamer" action="displayManagers"/>";
								},
								"No" : function() {
									$(this).dialog("close");
								},
								"Ask Again Later" : function() {
									$(this).dialog("close");
								}
							}
						});
	});
</script>

<div id="dialog-confirmNagDreamer" title="Dream Manager">
	<p>
		<span class="ui-icon ui-icon-alert"
			style="float: left; margin: 0 7px 50px 0;"></span>You currently do
		not have a Dream Manager, would you like to request one?
	</p>
</div>