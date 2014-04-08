$document = $(document)

$document.on 'click', '.video', (e) ->
  $("#player").html('Now Loading...')
  id = e.target.href.split("#")[1]
  html = '<iframe src="/player/'+id+'" frameborder="yes"></iframe>'
  $("#player").html(html)
  return false

