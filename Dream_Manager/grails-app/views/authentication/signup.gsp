<g:if test="${flash.authenticationFailure}">
	Login failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
</g:if>
<auth:form authAction="signup" success="[controller:'portal', action:'newUser']" error="[controller:'portal', action:'signup']">
    User: <g:textField name="login"/><br/>
    Password: <input type="password" name="password"/><br/>
    Confirm Password: <input type="password" name="passwordConfirm"/><br/>
    <input type="submit" value="Create account"/>
</auth:form>