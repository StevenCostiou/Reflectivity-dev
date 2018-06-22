benchmarking
benchmarkPerObjectWithCondition
	<script>
	| reference instrumented |
	reference := self new run.
	instrumented := self new runPerObjectWithCondition.
	{ reference. instrumented. } inspect.
	^ ((instrumented - reference) / reference) asFloat inspect