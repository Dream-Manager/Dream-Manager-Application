<script>
	$(function() {
		$("#dialog-confirmNagDreamer")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 350,
							modal : true,
							buttons : {
								"Yes" : function() {
									location.href = "<dreamManager:linkToAction controller="managerToDreamer" action="displayManagers"/>";
								},
								"Not Now" : function() {
									$(this).dialog("close");
								},
								"Don't Ask Again" : function() {
									$
											.ajax("<dreamManager:linkToAction controller="managerToDreamer" action="stopNagging"/>");
									$(this).dialog("close");
								}
							}
						});
	});
</script>

<div id="dialog-confirmNagDreamer" title="Dream Manager">
	<p>
		<span class="ui-icon ui-icon-alert"
			style="float: left; margin: 0 7px 50px 0;"></span>
		${userInstance.firstName },
		do you want to get a Dream Manager to help with your dreams?
	</p>
</div>