Ember.Handlebars.helper 'timeAgoInWords', (date) ->
  console.log(date)
  moment(date).fromNow()

# Rails' TextHelper#simple_format for JavaScript
# https://makandracards.com/makandra/1395-simple_format-helper-for-javascript
Ember.Handlebars.helper 'simpleFormat', (string) ->
  str = string.replace(/¥r¥n?/, '¥n')
  str = $.trim(str)

  if str.length > 0
    str = str.replace(/¥n¥n+/g, '</p><p>')
    str = str.replace(/¥n/g, '<br />')
    str = "<p>#{str}</p>"

  new Handlebars.SafeString(str)
