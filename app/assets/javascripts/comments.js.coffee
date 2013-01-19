Anoside.CommentsCtrl = ($scope, $http) ->
  $scope.create = (comment, postId) ->
    $http.post("/api/posts/#{postId}/comments.json", comment).success (data) ->
      comments = $scope.$parent.post.comments
      comments.shift()
      comments.push(data)

      $scope.$parent.post.comments = comments
      $scope.comment = ''

  $scope.expand = ($event) ->
    $($event.target).height(100)



Anoside.CommentsCtrl.$inject = ['$scope', '$http']


# class Comment
#   constructor: (@$form) ->
#     @$comments = @$form.siblings('ul')

#   render: (comment) ->
#     @$comments.append(Anoside.render('#comment', comment))

# class Form
#   constructor: (@$form) ->
#     @$form.on
#       click: =>
#         @expand()
#         @showButton()

#       'ajax:success': (event, data) =>
#         @renderComment(data)
#         @clearForm()

#   expand: ->
#     @$form.find('textarea').height(60)

#   showButton: ->
#     @$form.children('input[type="submit"]').show()

#   renderComment: (comment) ->
#     new Comment(@$form).render(comment)

#   clearForm: ->
#     @$form.find('textarea').val('')

# $ ->
#   if $('.posts-index').length
#     $('ul.posts form.new_comment').each ->
#       new Form($(@))

#   if $('.posts-show').length
#     $('form.new_comment.new_comment').each ->
#       new Form($(@))
