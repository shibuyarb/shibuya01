pickUp = ->
  randomContent = []
  counter = 0

  $(".pickup").each ->
    randomContent.push $(this).html()
  randomContent.sort ->
    Math.random() - Math.random()
  $(".pickup").empty()
  i = 0
  $(".pickup").each ->
    $(this).append randomContent[i]
    i++
$ ->
  setInterval pickUp, 10000
