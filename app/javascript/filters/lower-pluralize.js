import Vue from 'vue/dist/vue.esm';
var pluralize = require('pluralize');
Vue.filter('lowerPluralize', (string) => {
  return pluralize(string.replace(/[\w]([A-Z])/g, (m) => {
    return m[0] + " " + m[1];
  }).toLowerCase());
});