window.Anoside =
  render: (templateId, data = {}) ->
    Handlebars.compile($(templateId).html())(data)
