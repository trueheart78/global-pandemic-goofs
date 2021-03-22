function copyPandemicGoof() {
  var r = document.createRange();
  
  r.selectNode(document.getElementById('pandemicGoof'));
  window.getSelection().removeAllRanges();
  window.getSelection().addRange(r);
  document.execCommand('copy');
  window.getSelection().removeAllRanges();

  document.getElementById('goofCopier').innerText = 'Goof Copied!';
}
