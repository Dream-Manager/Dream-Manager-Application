<g:if test="${dreams!=null}">
	<h1 title="Displays list of the 3 most complete ${length} dreams.">
		${length}
	</h1>
	<div>
		<div class="accordion">
			<g:each in="${dreams}" status="i" var="dream">
				<g:set var="dreamID" value="${dream.id}" />
				<h3 style="position: relative;"
					title="${dream.percentComplete}% complete">
					${dream.name}
					<span class="progressbar"
						style="position: absolute; right: 0; width: 15em; height: .8em; margin-right: 1em; margin-top: -1em">
						${dream.percentComplete}
					</span>
				</h3>
				<div>
					<div style="position: relative;">
						<h6>
							Dream Tasks:
							<g:link controller="task" action="create"
								params="[dreamID:dreamID]" title="Add a task to this dream."
								class="button">
								<g:img file="add.png" width="15" height="15" />
							</g:link>
						</h6>
						<div>
							<ul class="sortable">
								<g:each
									in="${dream.tasks.sort{a,b-> a.orderNumber.compareTo(b.orderNumber)}}"
									var="task">
									<li class="ui-state-default task-sortable"
										title="Drag around to sort tasks.">
										${task.name} <span class="progressbar"
										style="position: absolute; right: 0; width: 14em; height: .8em; margin-right: 5em; margin-top: -1em">
											${task.percentComplete}
									</span><g:if test="${task.percentComplete!=100 }">
									<g:link controller="task" action="markComplete" id="${task.id}"
											title="Mark this Dream Complete."
											onclick="return confirm('Are you sure you want to mark this task as complete?')"
											style="position: absolute; right: 0; margin-right: 3em;">
											<g:img file="complete.jpg" width="20" height="20" />
										</g:link></g:if> <g:link controller="task" action="edit" id="${task.id}"
											title="Edit this task."
											style="position: absolute; right: 0; margin-right: 2em;">
											<g:img file="skin/database_edit.png" width="15" height="15" />
										</g:link> <g:link controller="task" action="delete" id="${task.id}"
											title="Delete this task from this Dream."
											onclick="return confirm('Are you sure you want to delete this task?')"
											style="position: absolute; right: 0;">
											<g:img file="delete.png" width="20" height="20" />
										</g:link>
									</li>
									<script type="text/javascript">
										$(".sortable")
												.sortable(
														{
															stop : function(
																	event, ui) {
																var sortedIDs = $(
																		this)
																		.sortable(
																				"toArray");
																$
																		.ajax({
																			url : "<dreamManager:linkToAction controller="Task" action="reorderTasks" />",
																			data : "sortedIDs="
																					+ sortedIDs
																							.join(",")
																		});
															}
														});
									</script>
								</g:each>
							</ul>
							<h6>Dream Notes:</h6>
							<p>
								${dream.notes}
							</p>
						</div>
						<g:link controller="dream" action="edit" id="${dream.id}"
							style="position:absolute; right: 0; bottom: 0;"
							title="Edit this dream.">
							<g:img file="skin/database_edit.png" width="20" heigth="20" />
						</g:link>
					</div>
				</div>
			</g:each>
		</div>
	</div>
</g:if>

