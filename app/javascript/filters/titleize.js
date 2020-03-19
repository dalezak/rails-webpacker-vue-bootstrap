import Vue from 'vue/dist/vue.esm';
Vue.filter('titleize', (sentence) => {
  let words = sentence.split(' ');
  words = words.map((word) => {
    return word.charAt(0).toUpperCase() + word.slice(1);
  });
  return words.join(' ');
});