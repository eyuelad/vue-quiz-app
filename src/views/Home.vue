<template>
  <div class="home">
    <Header 
      :numCorrect="numCorrect"
      :numTotal="numTotal"
    />

    <b-container>
      <b-row>
        <b-col sm="6" offset="3">
          <QuestionBox
            v-if="questions.length"
            :currentQuestion="questions[index]"
            :nextQuestion="nextQuestion"
            :increment="increment"
          />
        </b-col>
      </b-row>
    </b-container>
    
  </div>
</template>

<script>
import Header from '@/components/Header.vue'
import QuestionBox from '@/components/QuestionBox.vue'

export default {
  name: 'home',
  components: {
    Header,
    QuestionBox
  },
  data() {
    return {
      questions: [],
      index: 0,
      numCorrect: 0,
      numTotal: 0
    }
  },
  methods: {
    nextQuestion() {
      this.index++;
    },
    increment(isCorrect) {
      if(isCorrect) {
        this.numCorrect++;
      }
      this.numTotal++;
    }
  },
  mounted: function() {
    fetch('https://opentdb.com/api.php?amount=10&category=9&type=multiple', {
      method: 'get'
    })
      .then( (response) => {
        return response.json();
      })
      .then( (jsonData) => {
        this.questions = jsonData.results;
      });
  }
}
</script>
