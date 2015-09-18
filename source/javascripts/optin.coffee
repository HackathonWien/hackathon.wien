class window.Optin
  @init: ->
    checkbox = document.getElementById("wirsing-newsletter")
    textField = document.getElementById("mce-NEWSWIRSIN")
    checkbox.addEventListener "change", (e) ->
      checked = e.target.checked.toString()
      textField.value = checked
