import Vue from 'vue/dist/vue.esm';
var pluralize = require('pluralize');
Vue.filter('titlePluralize', (string) => {
  let sentence = pluralize(string.replace(/[\w]([A-Z])/g, (m) => {
    return m[0] + " " + m[1];
  }));
  let words = sentence.split(' ');
  words = words.map((word) => {
    return word.charAt(0).toUpperCase() + word.slice(1);
  });
  return words.join(' ');
});