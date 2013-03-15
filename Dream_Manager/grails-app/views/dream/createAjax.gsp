<%@ page import="dream_manager.Dream" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<div id="create-dream" class="content scaffold-create" role="main">
			<div id="inline_create_dream_toggle" style="float:right">
				<g:img file="add.png" width="15" height="15" />
			</div>
			<div id="inline_create_dream_form" style="display:none;float:left;position:relative;border:.1em solid grey" >
				<g:formRemote name="createDreamByAjax" update="results" url="[controller: 'dream', action:'create']">
					<fieldset>
						<g:render template="form"/>
						<input type="submit" value="Save" />
					</fieldset>
				</g:formRemote>
			</div>
			<script type="text/javascript">
				jQuery(function(){
					jQuery("#inline_create_dream_toggle").click(function(){
						jQuery("#inline_create_dream_form").toggle();
					});
					jQuery("#createDreamByAjax").submit(function(){
						jQuery("#createDreamByAjax").flash();
					});
				});
			</script>
		</div>
	</body>
</html>
