<div class="container_16">
	<div class="prefix_12 grid_2 alpha ">
		Hello <g:include controller="user" action="getCurrentUserFirstName"/>
	</div>
	<div class="grid_2 omega">
		<a href="#" id="headerMenuButton">Menu</a>
		<ul id="headerMenu" style="display:none; position:relative; top:0px; left:0px;">
		  <li><g:link controller="user" action="editCurrentProfile">Account Settings</g:link></li>
		  <li class="ui-state-disabled"><a href="#">Ask Dream Manager</a></li>
		  <li><g:link controller="auth" action="signOut">Log Out</g:link></li>
		</ul>
		<script type="text/javascript">
			$(function(){
				$("#headerMenuButton")
					.button()
					.click(function(){
						$("#headerMenu").toggle();
					});
				$("#headerMenu").menu();
			});
		</script>
	</div>
	<div class="prefix_7 grid_3">
		<shiro:isLoggedIn>You are signed in as<tr>
				<shiro:principal></shiro:principal>
				<g:link controller="Auth" action="signOut">Logout</g:link>
		</shiro:isLoggedIn>

	</div>
</div>
<div class="clear"></div>