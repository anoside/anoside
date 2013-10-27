json.tags tags do |tag|
  json.partial! 'api/tags/tag', tag: tag
end
