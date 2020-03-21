<template>
  <div>
    <div role="alert" class="alert alert-dismissible fade show" :class="data.color" :key="index" v-for="(data, index) in messages">
      <div>{{data.message}}</div>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
  },
  data() {
    return {
      messages: []
    };
  },
  created() {
  },
  mounted() {
    Event.$on('alert', message => {
      this.messages.push({color: "alert-primary", message: message});
    });
    Event.$on('success', message => {
      this.messages.push({color: "alert-success", message: message});
    });
    Event.$on('notice', message => {
      this.messages.push({color: "alert-info", message: message});
    });
    Event.$on('warning', message => {
      this.messages.push({color: "alert-warning", message: message});
    });
    Event.$on('error', message => {
      this.messages.push({color: "alert-danger", message: message});
    });
  }, 
  destroyed() {
  },
  methods: {

  }
};
</script>

<style scoped>
</style>
