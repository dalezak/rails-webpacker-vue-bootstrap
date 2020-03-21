<template>
  <div class="card mb-4" :key="data.id">
    <div class="card-body">
      <h5 class="card-title">{{data.name || data.name}}</h5>
      <p class="card-text">{{data.description || data.created_at}}</p>
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
