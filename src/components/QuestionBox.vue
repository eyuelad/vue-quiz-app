<template>
	<div class="question-box">
    <b-jumbotron>
			<template slot="lead">
				{{ currentQuestion.question }}
			</template>

			<hr class="my-4">

			<b-list-group>
				<b-list-group-item
					:class="status(index)"
					v-for="(answer, index) in answers"
					:key="index"
					@click="selectAnswer(index)"
				>
					{{ answer }}
				</b-list-group-item>
			</b-list-group>

			<div class="mt-3">
				<b-button
					variant="primary" 
					@click="submitAnswer()"
					:disabled="selectedAnswer == null || isAnswered"
				>
					Submit
				</b-button>
				<b-button
					variant="success"
					@click="nextQuestion"
					:disabled="!isAnswered"
				>
					Next
				</b-button>
			</div>
    </b-jumbotron>
	</div>
</template>

<script>
import _ from 'lodash'

export default {
	props: {
		currentQuestion: Object,
		nextQuestion: Function,
		increment: Function
	},
	data() {
		return {
			shuffledAnswers: null,
			correctAnswer: null,
			selectedAnswer: null,
			isAnswered: false
		}
	},
	computed: {
		answers() {
			let answers = [...this.currentQuestion.incorrect_answers, this.currentQuestion.correct_answer]
			return answers
		}
	},
	watch: {
		currentQuestion: {
			immediate: true,
			handler() {
				this.selectedAnswer = null
				this.isAnswered = false;
				this.shuffleAnswers()
			}
		}
	},
	methods: {
		selectAnswer(index) {
			this.selectedAnswer = index;
		},
		shuffleAnswers() {
			let answers = [...this.currentQuestion.incorrect_answers, this.currentQuestion.correct_answer]
			this.shuffledAnswers = _.shuffle(answers);
			this.correctAnswer = this.shuffledAnswers.indexOf(this.currentQuestion.correct_answer);
		},
		submitAnswer() {
			let isCorrect = false;

			if(this.selectedAnswer == this.correctAnswer) {
				isCorrect = true;
			}
			this.isAnswered = true;
			this.increment(isCorrect);
		},
		status(index) {
			let status = '';
			if(!this.isAnswered && this.selectedAnswer === index) {
				status = 'selected';
			} else if(this.isAnswered && this.correctAnswer === index) {
				status = 'correct';
			} else if(this.isAnswered && this.selectedAnswer === index && this.correctAnswer !== index) {
				status = 'incorrect';
			}

			return status;
		}
	},
}
</script>

<style lang="scss" scoped>
	.question-box {
		text-align: center;
	}
	.list-group-item:hover {
		background: #eee;
		cursor: pointer;
	}
	.selected {
		background: #abf;
	}
	.correct {
		background: #afa;
	}
	.incorrect {
		background: #faa;
	}
	.btn {
		margin: 0 5px;
	}
</style>
