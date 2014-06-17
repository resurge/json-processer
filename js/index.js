(function() {
  var doConvert, prettifyJson;

  prettifyJson = function(json) {
    return JSON.stringify(json, void 0, 2);
  };

  doConvert = function($input, $func, $output) {
    var e, f, func, input, json, result;
    func = $func.val();
    input = $input.val();
    try {
      json = JSON.parse(input);
      f = eval("(function(json) { " + func + " return json; })");
      result = f(json);
      return $output.val(prettifyJson(result));
    } catch (_error) {
      e = _error;
    }
  };

  $(function() {
    var $func, $input, $output;
    $input = $('textarea[name="input"]');
    $func = $('textarea[name="func"]');
    $output = $('textarea[name="output"]');
    $input.keyup(function(e) {
      return doConvert($input, $func, $output);
    });
    $func.keyup(function(e) {
      return doConvert($input, $func, $output);
    });
    return ($('#prettify-input')).click(function() {
      return $input.val((prettifyJson($input.val())).replace(/\\n/g, "<br>"));
    });
  });

}).call(this);
