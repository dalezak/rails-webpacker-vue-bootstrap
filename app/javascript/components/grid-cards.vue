<template>
  <div class="grid-cards">
    <div id="cards" class="row cards">
      <div class="col col-sm-12 col-md-6 col-lg-4 d-block"></div>
      <div class="col col-md-6 col-lg-4 d-none d-sm-none d-md-block"></div>
      <div class="col col-lg-4 d-none d-sm-none d-md-none d-lg-block"></div>
      <component :is="card" :key="data.id" :data="data" v-for="data in local.cards"></component>
    </div>
    <div class="btn btn-block btn-outline-primary btn-more" v-if="local.more" @click="loadMore">Load More</div>
  </div>
</template>

<script>
export default {
  props: {
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
    url: {
      type: String,
      required: true
    },
    card: {
      type: String,
      required: true
    },
    cards: {
      type: Array,
      required: true,
      default: () => []
    }
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
  created() {
  },
  mounted() {
    this.$colcade.create({
      name: 'cards',  
      el: '#cards',  
      config: {  
        columns: '.col',
        items: '.card',
      },
    });
  }, 
  updated() {
    this.$colcade.update('cards');
  },
  destroyed() {
    this.$colcade.destroy("cards");
  },
  methods: {
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
    }
  }
};
</script>

<style scoped>
</style>
