import Vue from 'vue/dist/vue.esm';
Vue.filter('dateTime', (string) => {
  if (string) {
    return moment(String(string)).format('MMM D YYYY, h:mm a');
  }
});