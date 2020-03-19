import Vue from 'vue/dist/vue.esm';
Vue.filter('humanize', (string) => {
  return string.replace(/[\w]([A-Z])/g, (m) => {
      return m[0] + " " + m[1];
  }).replace(/-/g, ' ').replace(/_/g, ' ');
});