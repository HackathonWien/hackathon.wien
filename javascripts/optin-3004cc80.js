(function() {
  window.Optin = (function() {
    function Optin() {}

    Optin.init = function() {
      var checkbox, textField;
      checkbox = document.getElementById("wirsing-newsletter");
      textField = document.getElementById("mce-NEWSWIRSIN");
      return checkbox.addEventListener("change", function(e) {
        var checked;
        checked = e.target.checked.toString();
        return textField.value = checked;
      });
    };

    return Optin;

  })();

}).call(this);
