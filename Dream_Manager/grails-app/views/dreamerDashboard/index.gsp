<html>
	<head>
		<title>Dream Manager - Dashboard</title>

		<!-- Fix tabs not being rendered on first page load, with fallback if no JavaScript availible -->
		<style type="text/css">
			.delayedVisibility { visibility: hidden; }
		</style>
		<noscript>
			<style type="text/css">
				.delayedVisibility { visibility: inherit; }
			</style>
		</noscript>	
		<script type="text/javascript">
			$(function(){
				$(".delayedVisibility").css("visibility","inherit")
			});
		</script>

	</head>
	<body>							
		<div class="grid_12 alpha delayedVisibility">
						
			<div class="tabs">
				<ul>
				    <li><a href="#tabs-1">Your Progress</a></li>
				    <li><a href="#tabs-2">Search Dreams</a></li>
				    <shiro:hasAnyRole in="['ROLE_MANAGER','ROLE_ADMIN']">
			    	<li><a href="#tabs-3">Manage Dreamers</a></li>
			    </shiro:hasAnyRole>
			</ul>
			<div id="tabs-1">
				<g:include controller="dream" action="showCreateAjax" />
				<h2>Dream Progress</h2>
					<!-- Shorterm Dreams -->
					<div>
					<h1>Short Term</h1>
				
					<div class="accordion"> 
						<h3>Dream 1</h3>
						<div>
							<p>Task Name</p>
						  	<p>Size</p>
						  	<p>Completed</p>
						</div>
						<h3>Dream 2</h3>
						<div>
						  	<p>Task Name</p>
						  	<p>Size</p>
						  	<p>Completed</p>
						</div>
 						<h3>Dream 3</h3>
 						<div>
							<p>Task Name</p>
						  	<p>Size</p>
							<p>Completed</p>
						</div>
					</div>

					<!-- Longterm Dreams -->
					<h1>Long Term</h1>
					<div class="accordion">
						<h3>Dream 1</h3>
						<div>
							<p>Task Name</p>
						  	<p>Size</p>
						  	<p>Completed</p>
						</div>
						<h3>Dream 2</h3>
						<div>
						  	<p>Task Name</p>
						  	<p>Size</p>
						  	<p>Completed</p>
						</div>
 						<h3>Dream 3</h3>
 						<div>
							<p>Task Name</p>
						  	<p>Size</p>
							<p>Completed</p>
						</div>
 					</div>
					
					<!-- Upcoming Dreams -->
					<h1>Upcoming Dreams</h1>
					
					<div class='ui-widget' style="margin-bottom:1em;">
						<g:include controller="dream" action="ajaxUpcomingDreams"/>							
					</div>
				</div>
			</div>
			<div id="tabs-2">
				<!-- Search Dreams -->
				
				<div class='ui-widget' style="margin-bottom:1em;">
				<g:formRemote name="ajaxSearchDreams" on404="alert('not found!')" update="searchDreamsResults"
           					url="[controller: 'dream', action:'ajaxSearchDreams']">
					<label for="ajaxSearchDreamsTerm">Search Dreams: </label>
					<input type="text" name="ajaxSearchDreamsTerm" id="ajaxSearchDreamsTerm"/>
					<input type="submit"/>
				</g:formRemote>								
				</div>
				<div id="searchDreamsResults"></div>
				
				<script type="text/javascript">
					$(function(){
						$('#ajaxSearchDreams').autocomplete({
               				source: '<g:createLink controller='dream' action='ajaxSearchDreamsAutocomplete'/>'
             				});
					}); 
				</script>
			</div>
			<shiro:hasAnyRole in="['ROLE_MANAGER','ROLE_ADMIN']">
				<div id="tabs-3">
					<!-- Search Users -->
					
					<g:link controller="user" action="create"> 
						<div style="float:right" id="buttonCreateUserLink">
							<g:img file="add.png" width="15" height="15" />
						</div>	
					</g:link>
					<script type="text/javascript">
						$("#buttonCreateUserLink").button();
					</script>
					
					<div class='ui-widget' style="margin-bottom:1em;">
					<g:formRemote name="ajaxSearchUsers" on404="alert('not found!')" update="searchUsersResults"
	           					url="[controller: 'user', action:'ajaxSearchUsers']">
						<label for="ajaxSearchUsersTerm">Search Users: </label>
						<input type="text" name="ajaxSearchUsersTerm" id="ajaxSearchUsersTerm"/>
						<input type="submit"/>
					</g:formRemote>								
					</div>
					<div id="searchUsersResults"></div>
					<script type="text/javascript">
						$(function(){
							$("#ajaxSearchUsers").submit();
						});
					</script>
					
				</div>
			</shiro:hasAnyRole>
		</div>
	</div>
	
	<div class="grid_4 omega">
	<div style="margin-top:.5em">
		<div class="grid_2 alpha">
			Welcome back, <g:include controller="user" action="getCurrentUserFirstName"/>!
		</div>
		<div class="grid_2 omega">
			<div style="margin-left:3em;">
				<g:render template="/common/menu" />
			</div>
		</div>
		<div class="clear"></div>

		<div class="grid_4 alpha omega" class="social">
			<div style="margin-top:1em;padding:1em;border:2px solid gray;">Share Accomplishments</div>
		</div>
	</div>
	</div>	
	</body>
</html>			