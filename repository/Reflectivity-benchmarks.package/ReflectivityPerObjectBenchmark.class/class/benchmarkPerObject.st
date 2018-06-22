benchmarking
benchmarkPerObject
	<script>
	|reference instrumented|
	
	reference := self new run.
	instrumented := self new runPerObject.
	{ reference. instrumented. } inspect.
	
	^ ((instrumented - reference) / reference) asFloat inspect