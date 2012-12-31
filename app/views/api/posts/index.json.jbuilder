json.array!(@posts) do |post|
  json.body post.body
end
