Anoside.angular.config ($translateProvider) ->
  $translateProvider.translations 'ja',
    titles:
      discover: '見つける'
      following_tags: 'フォローしているタグ'
      home: 'ホーム'
      me: '自分の投稿'
      popular_tags: '人気のタグ'
      posts_i_dislike: '嫌いな投稿'
      posts_i_like: '好きな投稿'
      settings: '設定'

  $translateProvider.preferredLanguage('ja')

