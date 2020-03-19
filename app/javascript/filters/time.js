import Vue from 'vue/dist/vue.esm';
Vue.filter('time', (string) => {
  if (string) {
    return moment(String(string)).format('h:mm a');
  }
});