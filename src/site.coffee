
# site.coffee - Site-wide scripts
do ->

  # initialize fb like box plugin
  # REF: https://developers.facebook.com/docs/reference/plugins/like-box/
  do (d = document, s = 'script', id ='facebook-jssdk') ->
    fjs = d.getElementsByTagName(s)[0]
    return if d.getElementById id

    js = d.createElement s
    js.id = id
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=149335621892485"
    fjs.parentNode.insertBefore js, fjs

  do (d = document, s = 'script', id ='twitter-wjs') ->
    fjs = d.getElementsByTagName(s)[0]
    return if d.getElementById id
    js = d.createElement s
    js.id = id
    js.src = "//platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs

