<%@ page import="dream_manager.Dream" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<div id="createDreamAjaxResponse" style="display:hidden"></div>
		<div id="create-dream" class="content scaffold-create" role="main">
			<div id="inline_create_dream_toggle" style="float:right">
				<g:img file="add.png" width="15" height="15" />
			</div>
			<div id="inline_create_dream_form" style="display:none;border:.1em solid grey;" class="popup" >
				<g:formRemote name="createDreamByAjax" url="[controller: 'dream', action:'createAjax']">
					<fieldset>
						<g:render template="form"/>
						<input type="submit" value="Save" />
					</fieldset>
				</g:formRemote>
			</div>
			<script type="text/javascript">
				$(function(){
					$("#inline_create_dream_toggle").click(function(){
						$("#inline_create_dream_form").toggle();
					}).button();
					$("#createDreamByAjax").submit(function(){
						$("#createDreamByAjax").reset();
					});
				});
			</script>
		</div>
	</body>
</html>
