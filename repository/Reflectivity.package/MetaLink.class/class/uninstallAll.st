cleanup
uninstallAll
	<script>
	self linkInstaller uninstallSuperJumpLinks.
	self allInstances do: #uninstall.
	self linkInstaller unsubscribeFromAnnouncers.
	linkInstaller := nil