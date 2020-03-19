import Vue from 'vue/dist/vue.esm';
var pluralize = require('pluralize');
Vue.filter('pluralize', (string, count=0, inclusive=false) => {
  return pluralize(string, count, inclusive);
});