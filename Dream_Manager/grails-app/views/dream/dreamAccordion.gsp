<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
		<h3 style="position:relative;">${dream.name} <span class="progressbar" style="position:absolute;right:0;width:15em;height:.8em;margin-right:1em;margin-top:-1em">${dream.percentComplete}</span></h3>
		<div>
			<div style="height: 10em; position: relative;">
				<p>${dream.notes}</p>
				<div>
					<ul class="sortable">
					  <g:each in="${dream.tasks}" var="task">
					  	<li class="ui-state-default task-draggable">${task.name} <span class="progressbar" style="position:absolute;right:0;width:15em;height:.8em;margin-right:1em;margin-top:-1em">${task.percentComplete}</span></li>
					  </g:each>
					</ul>
				</div>
				<g:link controller="dream" action="edit" id="${dream.id}" style="position:absolute; right: 0; bottom: 0;">Edit Dream</g:link>
			</div>
		</div>
	</g:each>
</div>
	