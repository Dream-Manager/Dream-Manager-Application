<html>
	<head>
		<title>Dream Manager - Dashboard</title>
	</head>
	<body>							
		<div class="grid_12 alpha">	
			<div id="tabs">
				<ul>
				    <li><a href="#tabs-1">Your Progress</a></li>
				    <li><a href="#tabs-2">Search Dreams</a></li>
				    <shiro:hasAnyRole in="['ROLE_MANAGER','ROLE_ADMIN']">
			    	<li><a href="#tabs-3">Manage Dreamers</a></li>
			    </shiro:hasAnyRole>
			</ul>
			<div id="tabs-1">
				<g:include controller="dream" action="showCreateAjax" />
				Dream Progress
					<!-- Shorterm Dreams -->
					<div>Short Term</div>
					<div>
					<table id="shorterm" border=1 cellspacing=0 cellpadding=0>
					<tr>
						<td>Dream 1</td>
						<td>% Completed 1</td>
					</tr>
					<tr>
						<td>Dream 2</td>
						<td>% Completed 2</td>
					</tr>
					<tr>
						<td>Dream 3</td>
						<td>% Completed 3</td>
					</tr>
					</table>

					</div>
					<br>

					<!-- Longterm Dreams -->
					<div>Long Term</div>
					<table id="longterm" border=1 cellspacing=0 cellpadding=0>
					<tr>
						<td>Dream 1</td>
						<td>% Completed 1</td>
					</tr>
					<tr>
						<td>Dream 2</td>
						<td>% Completed 2</td>
					</tr>
					<tr>
						<td>Dream 3</td>
						<td>% Completed 3</td>
					</tr>
					</table>
			</div>
			<div id="tabs-2">
				<!-- Search Dreams -->
				
				<div class='ui-widget'" style="margin-bottom:1em;">
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
					
					<div class='ui-widget'" style="margin-bottom:1em;">
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