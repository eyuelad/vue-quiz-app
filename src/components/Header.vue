<template>
	<div>
		<b-nav tabs>
			<b-nav-item disabled class="font-weight-bold">Quiz App</b-nav-item>
			<b-nav-item disabled>
				Counter: <span class="text-success">{{ numCorrect }}</span> / {{ numTotal }}
			</b-nav-item>
		</b-nav>
	</div>
</template>

<script>
export default {
	props: {
		numCorrect: 0,
		numTotal: 0
	}
}
</script>

