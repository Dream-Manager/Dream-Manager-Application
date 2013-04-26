<g:if test="${dreams!=null}">
<h1 title="Displays list of the 3 most complete ${length} dreams.">${length}</h1>
<div>
<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
	<g:set var="dreamID" value="${dream.id}"/>
		<h3 style="position:relative;" title="${dream.percentComplete}% complete">${dream.name} <span class="progressbar" style="position:absolute;right:0;width:15em;height:.8em;margin-right:1em;margin-top:-1em">${dream.percentComplete}</span></h3>
		<div>
			<div style="position: relative;">
				<h1>Dream Tasks: 
				<g:link controller="task" action="create" params="[dreamID:dreamID]" title="Add a task to this dream.">+</g:link>
				</h1>
				<div>
					<ul class="sortable">
					  <g:each in="${dream.tasks.sort{a,b-> a.orderNumber.compareTo(b.orderNumber)}}" var="task">
					  	<li class="ui-state-default task-sortable" title="Drag around to sort tasks."> <g:link controller="task" action = "edit" id="${task.id}">${task.name}</g:link> <span class="progressbar" style="position:absolute;right:0;width:15em;height:.8em;margin-right:10em;margin-top:-1em">${task.percentComplete}</span></li>
					 	<script type="text/javascript">
						$( ".sortable" ).sortable({
						  stop: function( event, ui ) {
							var sortedIDs = $(this).sortable( "toArray" );
							$.ajax({
							    url: "<dreamManager:linkToAction controller="Task" action="reorderTasks" />",
							    data: "sortedIDs="+sortedIDs.join(",")
							});
						  }
						});
						</script>
					  </g:each>
					</ul>
					<h1>Dream Notes:</h1>
				<p>${dream.notes}</p>
				</div>
				<g:link controller="dream" action="edit" id="${dream.id}" style="position:absolute; right: 0; bottom: 0;">Edit Dream</g:link>
			</div>
		</div>
	</g:each>
</div>
</div>
</g:if>

