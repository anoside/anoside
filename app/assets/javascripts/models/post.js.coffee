Anoside.Post = DS.Model.extend
  viewpoint: DS.belongsTo('viewpoint')
  body: DS.attr()
  created_at: DS.attr('date')
