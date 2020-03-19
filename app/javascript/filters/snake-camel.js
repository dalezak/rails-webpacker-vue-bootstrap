import Vue from 'vue/dist/vue.esm';
Vue.filter('snakeCamel', (string) => {
  return string.replace(/(_\w)/g, (m) => {
      return m[1].toUpperCase();
  });
});