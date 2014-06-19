(function() {
  $(function() {
    var $errorMessage, $func, $input, $output, $validMessage, doConvert, prettifyJson, showError, showValid;
    $input = $('textarea[name="input"]');
    $func = $('textarea[name="func"]');
    $output = $('textarea[name="output"]');
    $errorMessage = $('header div#errorMessage');
    $validMessage = $('header div#validMessage');
    prettifyJson = function(json) {
      return JSON.stringify(json, void 0, 2);
    };
    showError = function(error) {
      $validMessage.hide();
      $errorMessage.fadeIn();
      return ($errorMessage.find('.message')).html(error);
    };
    showValid = function() {
      $errorMessage.hide();
      return $validMessage.fadeIn();
    };
    doConvert = function($input, $func, $output) {
      var e, f, func, input, json, result;
      func = $func.val();
      input = $input.val();
      try {
        json = JSON.parse(input);
        f = eval("(function(json) { " + func + " return json; })");
        result = f(json);
        $output.val(prettifyJson(result));
        return showValid();
      } catch (_error) {
        e = _error;
        return showError(e.message);
      }
    };
    ($('#run')).click(function() {
      return doConvert($input, $func, $output);
    });
    ($('#prettify-input')).click(function() {
      var inputJson;
      inputJson = JSON.parse($input.val());
      return $input.val(prettifyJson(inputJson));
    });
    return ($('#show-example')).click(function() {
      $func.val("json = json.map(function(kingdom) {\n  kingdom.species = kingdom.species.map(function(species) {\n    species.breeds = species.breeds.map(function(breed) {\n      breed.name = breed.name.toUpperCase();\n\n      return breed;\n    });\n\n    return species;\n  });\n\n  return kingdom; \n});\n\nvar mammals = json[0];\nmammals.species.push({\n  name: 'Whale',\n  breeds: [\n    {\n      name: 'Orca'\n    }\n  ]\n});");
      $input.val(prettifyJson([
        {
          name: 'Mammal',
          species: [
            {
              name: 'Dog',
              breeds: [
                {
                  name: 'Bulldog'
                }, {
                  name: 'Terrier'
                }, {
                  name: 'Spaniel'
                }
              ]
            }, {
              name: 'Cat',
              breeds: [
                {
                  name: 'Balinese'
                }, {
                  name: 'Persian'
                }
              ]
            }
          ]
        }, {
          name: 'Fish',
          species: [
            {
              name: 'Bony',
              breeds: [
                {
                  name: 'Lamprey'
                }, {
                  name: 'Hagfish'
                }
              ]
            }, {
              name: 'Jawless',
              breeds: [
                {
                  name: 'Sturgeon'
                }, {
                  name: 'Salmon'
                }
              ]
            }
          ]
        }
      ]));
      return ($('#run')).click();
    });
  });

}).call(this);
