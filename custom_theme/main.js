$(document).ready(function() {
  var KEY = '?peer_id=';
  var idx = window.location.href.indexOf(KEY);
  if (idx > -1) {
    var peerId = window.location.href.slice(window.location.href.indexOf(KEY) + KEY.length);
    $('.cjdns-peer-id').text(peerId);
    $('.cjdns-peer-id-missing').css({ display: 'none' });
    $('.cjdns-peer-id-has').css({ display: 'inline' });
  }
});