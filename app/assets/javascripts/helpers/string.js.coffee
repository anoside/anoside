# Rails' TextHelper#simple_format for JavaScript
# https://makandracards.com/makandra/1395-simple_format-helper-for-javascript
Handlebars.registerHelper 'simpleFormat', (string) ->
  str = string.replace(/\r\n?/, '\n')
  str = $.trim(str)

  if str.length > 0
    str = str.replace(/\n\n+/g, '</p><p>')
    str = str.replace(/\n/g, '<br />')
    str = "<p>#{str}</p>"

  str
