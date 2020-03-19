import Vue from 'vue/dist/vue.esm';
var pluralize = require('pluralize');
Vue.filter('singularize', (string, inclusive=false) => {
  return pluralize(string, 1, inclusive);
});