<template>
  <div id="step-cards">
    <div id="cards" class="row cards">
      <div class="col col-sm-12 col-md-6 col-lg-4 d-block"></div>
      <div class="col col-md-6 col-lg-4 d-none d-sm-none d-md-block"></div>
      <div class="col col-lg-4 d-none d-sm-none d-md-none d-lg-block"></div>
      <div class="card mb-4" v-for="card in cards" :key="card.id">
        <div class="card-body">
          <h5 class="card-title">
            <a :href="showCard(card)">{{ card.name }}</a>
          </h5>
          <p class="card-text">{{ card.description }}</p>
        </div>
      </div>
    </div>
    <div class="card" v-if="cards.length == 0">
      <div class="card-body">
        <h4 class="card-title">No steps</h4>
        <p class="card-text">There are currently no steps <i v-if="search.length > 0"> for {{search}}</i></p>
      </div>
    </div>
    <div class="btn btn-block btn-outline-primary btn-more" v-if="local.more" @click="loadMore">Load More</div>
  </div>  
</template>

<script>
export default {
  props: {
    cards: {
      type: Array,
      required: true
    },
    limit: {
      type: Number,
      required: false,
      default: 24
    },
    offset: {
      type: Number,
      required: false,
      default: 0
    },
    search: {
      type: String,
      required: false,
      default: ""
    },
    more: {
      type: Boolean,
      required: false,
      default: false
    },
  },
  data() {
    return {
      local: {
        offset: this.offset,
        cards: this.cards.slice(0),
        more: this.more && this.cards.length == this.limit
      }
    };
  },
  created() {},
  mounted() {
    this.loadCards();
  },
  destroyed() {
    this.destroyCards();
  },
  methods: {
    showCard(step) {
      return Routes.step_path(step.id)
    },
    loadCards() {
      this.$colcade.create({
        name: "cards",
        el: "#cards",
        config: {
          columns: ".col",
          items: ".card"
        }
      });
    },
    async loadMore() {
      try {
        this.local.offset = this.local.cards.length;
        let response = await this.axios.get(this.url, {
          params: {
            limit: this.limit,
            offset: this.local.offset,
            search: this.search
          }
        });
        let cards = response.data;
        for (let card of cards) {
          this.local.cards.push(card);
        }
        this.local.more = cards.length >= this.limit;
      } 
      catch (error) {
        Event.$emit('error', error);
      }
    },
    destroyCards() {
      this.$colcade.destroy("cards");
    }
  }
};
</script>

<style scoped>
</style>
