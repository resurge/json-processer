$ ->
  $input = $ 'textarea[name="input"]'
  $func = $ 'textarea[name="func"]'
  $output = $ 'textarea[name="output"]'
  $errorMessage = $ 'div#errorMessage'
  $validMessage = $ 'div#validMessage'
  $defaultMessage = $ 'div#defaultMessage'

  prettifyJson = (json) ->
    JSON.stringify json, undefined, 2

  showInfo = ->
    $validMessage.hide()
    $errorMessage.hide()
    $defaultMessage.fadeIn()

  showError = (error) ->
    $defaultMessage.hide()
    $validMessage.hide()
    $errorMessage.fadeIn()

    ($errorMessage.find '.message').html error

  showValid = ->
    $defaultMessage.hide()
    $errorMessage.hide()
    $validMessage.fadeIn()

  doConvert = ($input, $func, $output, suppressMessage) ->
    func = $func.val()
    input = $input.val()

    try  
      json = JSON.parse input

      f = eval "(function(json) { #{func} return json; })"
      result = (f json)
      
      $output.val prettifyJson result
      if not suppressMessage
        showValid()
    catch e
      showError e.message

  ($ '#run').click ->
    doConvert $input, $func, $output

  ($ '#prettify-input').click ->
    inputJson = JSON.parse $input.val()
    $input.val prettifyJson inputJson

  ($ '#show-example').click ->
    $func.val """
json = json.map(function(kingdom) {
  kingdom.species = kingdom.species.map(function(species) {
    species.breeds = species.breeds.map(function(breed) {
      breed.name = breed.name.toUpperCase();

      return breed;
    });

    return species;
  });

  return kingdom; 
});

var mammals = json[0];
mammals.species.push({
  name: 'Whale',
  breeds: [
    {
      name: 'Orca'
    }
  ]
});
    """

    $input.val prettifyJson [
      (
        name: 'Mammal'
        species: [
          (
            name: 'Dog'
            breeds: [
              (
                name: 'Bulldog'
              )
              (
                name: 'Terrier'
              )
              (
                name: 'Spaniel'
              )
            ]
          )
          (
            name: 'Cat'
            breeds: [
              (
                name: 'Balinese'
              ),
              (
                name: 'Persian'
              )
            ]
          )
        ]
      ),

      (
        name: 'Fish'
        species: [
          (
            name: 'Bony'
            breeds: [
              (
                name: 'Lamprey'
              )
              (
                name: 'Hagfish'
              )
            ]
          )
          (
            name: 'Jawless'
            breeds: [
              (
                name: 'Sturgeon'
              )
              (
                name: 'Salmon'
              )
            ]
          )
        ]
      )
    ]

    doConvert $input, $func, $output, true
    showInfo()