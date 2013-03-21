<html>
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
					Manage Dreamers
				</div>
			</shiro:hasAnyRole>
		</div>
	</div>
	
	<div class="grid_4 omega">
		<div style="width:100%;height:300px;border:1px solid darkblue;text-align:center;padding-top:1em;">Social</div>
		</div>	
	</body>
</html>			