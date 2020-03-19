import "tempusdominus-bootstrap-4";
$(function () {
  let icons = {
    time: 'fa far fa-clock',
    date: 'fa far fa-calendar',
    up: 'fa far fa-arrow-up',
    down: 'fa far fa-arrow-down',
    previous: 'fa far fa-chevron-left',
    next: 'fa far fa-chevron-right',
    today: 'fa far fa-calendar-check',
    clear: 'fa far fa-trash',
    close: 'fa far fa-times'
  }
  if ($(".timepicker").length > 0) {
    $(".timepicker").datetimepicker({
      format: 'h:mm a',
      icons: icons,
      focusOnShow: true,
      allowInputToggle: true
    });
  }
  if ($(".datepicker").length > 0) {
    $(".datepicker").datetimepicker({
      format: 'YYYY-MM-DD',
      icons: icons,
      focusOnShow: true,
      allowInputToggle: true
    });
  }
  if ($(".datetimepicker").length > 0) {
    $(".datetimepicker").datetimepicker({
      format: 'YYYY-MM-DD h:mm a',
      icons: icons,
      focusOnShow: true,
      allowInputToggle: true
    });
  }
});