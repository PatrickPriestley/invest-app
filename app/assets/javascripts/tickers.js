var bloodhound = new Bloodhound({
  datumTokenizer: function (d) {
    return Bloodhound.tokenizers.whitespace(d.value);
  },
  queryTokenizer: Bloodhound.tokenizers.whitespace,

  remote: {
    url: '/api/tickers/typeahead?query=%QUERY',
    wildcard: "%QUERY",
  },
  limit: 10
});
bloodhound.initialize();

$(document).ready(function () {
  $(".ticker-typeahead").typeahead({
    source: function (query, process) {
      return bloodhound.search(query, process, process);
    },
  });
});
