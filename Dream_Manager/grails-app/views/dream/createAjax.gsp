<%@ page import="dream_manager.Dream" %>
<!DOCTYPE html>
<html>
	<body>
		<div id="create-dream" class="content scaffold-create" role="main">
			<div id="inline_create_dream_toggle" style="float:right">
				<g:img file="add.png" width="15" height="15" />
			</div>
			<div id="inline_create_dream_form" >
				<g:formRemote name="createAjax" update="results" url="[controller: 'dream', action:'create']">
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>						
					<fieldset class="buttons">
						<input type="submit" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:formRemote>
			</div>
			<g:javascript>
				$(function(){
					$("#inline_create_dream_toggle").click(function(){
						$("#inline_create_dream_form").toggle()
					})
				})
			</g:javascript>
		</div>
	</body>
</html>
