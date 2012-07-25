Syntax.register('coffeescript', function(brush) {
  var keywords = ["->", "function", "break", "case", "catch", "finally", "continue", "default", "delete", "else", "for", "if", "in", "of", "by", "instanceof", "new", "return", "super", "switch", "throw", "true", "try", "typeof", "var", "while", "with", "prototype", "until", "loop", "unless"];

  var operators = ["is", "isnt", "not", "and", "or", "class", "extends", "super", "own", "do",  "+", "*", "/", "-", "&", "|", "~", "!", "%", "<", "=", ">"];
  var values = ["this", "true", "false", "null", "undefined", "@"];

  brush.push(values, {klass: 'constant'});
  brush.push(keywords, {klass: 'keyword'});
  brush.push(operators, {klass: 'operator'});

  // Regular expressions
  // brush.push(Syntax.lib.perlStyleRegularExpression);

  // Camel Case Types
  // brush.push(Syntax.lib.camelCaseType);

  // Comments
  // brush.push(Syntax.lib.cStyleComment);
  brush.push(Syntax.lib.cppStyleComment);
  brush.push(Syntax.lib.webLink);

  // Strings
  // brush.push(Syntax.lib.singleQuotedString);
  brush.push(Syntax.lib.doubleQuotedString);
  brush.push(Syntax.lib.stringEscape);

  // Numbers
  // brush.push(Syntax.lib.decimalNumber);
  brush.push(Syntax.lib.hexNumber);

  // Functions
  brush.push(Syntax.lib.cStyleFunction);
});
