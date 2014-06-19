$ ->
  $input = $ 'textarea[name="input"]'
  $func = $ 'textarea[name="func"]'
  $output = $ 'textarea[name="output"]'
  $errorMessage = $ 'header div#errorMessage'
  $validMessage = $ 'header div#validMessage'

  prettifyJson = (json) ->
    JSON.stringify json, undefined, 2

  showError = (error) ->
    $validMessage.hide();
    $errorMessage.fadeIn()

    ($errorMessage.find '.message').html error

  showValid = ->
    $errorMessage.hide();
    $validMessage.fadeIn();

  doConvert = ($input, $func, $output) ->
    func = $func.val()
    input = $input.val()

    try  
      json = JSON.parse input

      f = eval "(function(json) { #{func} return json; })"
      result = (f json)
      
      $output.val prettifyJson result
      showValid()
    catch e
      showError e.message

  ($ '#run').click ->
    doConvert $input, $func, $output

  ($ '#prettify-input').click ->
    inputJson = JSON.parse $input.val()
    $input.val prettifyJson inputJson