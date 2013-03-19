<a href="#" id="headerMenuButton">Menu</a>
<ul id="headerMenu" style="display:none;" class="popup">
  <li><g:link controller="user" action="editCurrentProfile">Account Settings</g:link></li>
  <li class="ui-state-disabled"><a href="#">Ask Dream Manager</a></li>
  <li><g:link controller="Auth" action="signOut">Log Out</g:link></li>
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