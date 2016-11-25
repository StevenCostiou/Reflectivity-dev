cleanup
uninstallAll
	<script>
	self allInstances do: #uninstall.
	linkInstaller := nil