prettifyJson = (json) ->
  JSON.stringify json, undefined, 2

doConvert = ($input, $func, $output) ->
  func = $func.val()
  input = $input.val()

  try  
    json = JSON.parse input

    f = eval "(function(json) { #{func} return json; })"
    result = (f json)
    
    $output.val prettifyJson result
  catch e
    #do nothing

$ ->
  $input = $ 'textarea[name="input"]'
  $func = $ 'textarea[name="func"]'
  $output = $ 'textarea[name="output"]'

  ($ '#run').click ->
    doConvert $input, $func, $output

  ($ '#prettify-input').click ->
    $input.val ((prettifyJson $input.val()).replace /\\n/g, "<br>")