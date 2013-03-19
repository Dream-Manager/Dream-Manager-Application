<%@ page import="dream_manager.Dream" %>
<div id="createDreamAjaxResponse" style="display:hidden"></div>
<div id="create-dream" class="content scaffold-create" role="main">
	<div id="inline_create_dream_toggle" style="float:right">
		<g:img file="add.png" width="15" height="15" />
		<g:img file="remove.png" width="15" height="15" style="display:none;"/>
	</div>
	<div id="inline_create_dream_form" style="display:none;border:.2em solid grey;background:white;" class="popup" >
		<g:formRemote name="createDreamByAjax" url="[controller: 'dream', action:'createAjax']">
			<fieldset>
				<div style="margin-bottom:2em;">
					<g:render template="form"/>
				</div>
				<input type="submit" value="Save" style="float:right"/>
			</fieldset>
		</g:formRemote>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#inline_create_dream_toggle").click(function(){
				$("#inline_create_dream_form").toggle('fade');
				$("#inline_create_dream_toggle IMG").toggle();
			}).button();
			$("#createDreamByAjax").submit(function(){
				$("#createDreamByAjax")[0].reset();
			});
		});
	</script>
</div>
