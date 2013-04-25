<%@ page import="dream_manager.Dream" %>
<div id="createDreamAjaxResponse" style="display:none;position:absolute;top:0px;left:0px;width:100%;text-align:center;"></div>

<div id="create-dream" class="content scaffold-create" role="main" title="Click to toggle add dream form.">
	<div id="inline_create_dream_toggle" style="float:right">
		<g:img file="add.png" width="15" height="15" />
		<g:img file="remove.png" width="15" height="15" style="display:none;"/>
	</div>
	<div id="inline_create_dream_form" style="display:none;border:.2em solid grey;background:white;" class="popup" >
		<g:formRemote update="createDreamAjaxResponse" name="createDreamByAjax" url="[controller: 'dream', action:'createAjax']" onSuccess="createDreamByAjaxResponseHandler()">
			<fieldset>
				<div style="margin-bottom:2em;">
					<h1>Add New Dream</h1>
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
				var category = $("#createDreamByAjax [name='category']").val();
				$("#createDreamByAjax")[0].reset();
				$("#createDreamByAjax [name='category']").val(category);
				$("#createDreamByAjax [name='name']").focus()
			});
		});
		function createDreamByAjaxResponseHandler(){
			
			$.ajax("<dreamManager:linkToAction controller="dream" action="ajaxUpcomingDreams"/>")
				.done(function(data){
					$("#ajaxUpcomingDreamsResults").html(data);
				});
			
			$("#createDreamAjaxResponse")
				.fadeIn({duration:800,complete:function(){
					$("#createDreamAjaxResponse").fadeOut({duration:800});
				}});
		};
	</script>
</div>
