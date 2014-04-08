$document = $(document)

$document.on 'click', '.video', (e) ->
  id = e.target.href.split("#")[1]
  $("#player").attr("src":"/player/"+id)
  return false
