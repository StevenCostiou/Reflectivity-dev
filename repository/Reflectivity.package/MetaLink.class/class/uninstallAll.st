cleanup
uninstallAll
	<script>
	self allInstances do: #uninstall.
	self linkInstaller unsubscribeFromAnnouncers.
	linkInstaller := nil