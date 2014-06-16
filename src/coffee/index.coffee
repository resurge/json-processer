doConvert = ($input, $func, $output) ->
  func = $func.val()
  input = $input.val()

  try  
    json = JSON.parse input

    f = eval "(function(json) { #{func} return json; })"
    result = (f json)
    
    $output.val JSON.stringify result, undefined, 2
  catch e
    #do nothing

$ ->
  $input = $ 'textarea[name="input"]'
  $func = $ 'textarea[name="func"]'
  $output = $ 'textarea[name="output"]'

  $input.keyup (e) ->
    doConvert $input, $func, $output

  $func.keyup (e) ->
    doConvert $input, $func, $output