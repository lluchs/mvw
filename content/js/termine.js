/* Highlight the next date. */

(function() {
  var dates, date, now;
  dates = document.querySelectorAll('#dates tr');
  now = Date.now();

  for (var i = dates.length - 1; i >= 0; i--) {
    date = parseDate(dates[i].children[0].innerText);
    if (date > now) {
      dates[i].classList.add('pure-table-highlight');
      break;
    }
  }

  /* Parses a date of format `14.03.2014`. */
  function parseDate(dateString) {
    var isoString = dateString.split('.').reverse().join('-');
    return Date.parse(isoString);
  }
})()
