json.comments @comments do |comment|
  json.partial! 'comment', comment: comment
end
