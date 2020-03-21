<template>
  <div>
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">No {{model | lowerPluralize}}</h4>
        <p class="card-text">There are currently no {{model | lowerPluralize}} <span v-if="search.length > 0"> for {{search}}</span></p>
      </div>
    </div>
    <a :href="url" class="btn btn-block btn-outline-primary btn-add mt-3" v-if="$can('add', model)">Add {{model}}</a>
  </div>  
</template>

<script>
export default {
  props: {
    model: {
      type: String,
      required: false,
      default: "Item"
    },
    search: {
      type: String,
      required: false,
      default: ""
    },
    url: {
      type: String,
      required: false
    }
	},
  data() {
    return {
    };
  },
  created() {
  },
  mounted() {
  }, 
  destroyed() {
  },
  methods: {
  }
};
</script>

<style scoped>
</style>
