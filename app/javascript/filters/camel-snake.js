import Vue from 'vue/dist/vue.esm';
Vue.filter('camelSnake', (string) => {
  return string.replace(/[\w]([A-Z])/g, (m) => {
      return m[0] + "_" + m[1];
  }).toLowerCase();
});