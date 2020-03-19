import Vue from 'vue/dist/vue.esm';
Vue.filter('date', (string) => {
  if (string) {
    return moment(String(string)).format('MMM D YYYY');
  }
});