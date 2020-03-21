<template>
  <div :id="'card-' + data.id" class="card mb-4">
    <div class="card-body">
      <h5 class="card-title"><a :href="path">{{data.name}}</a></h5>
      <p class="card-text">{{data.description}}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    data: {
      type: Object,
      required: true
    }
	},
  data() {
    return {
      path: Routes.step_path(this.data.id)
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
