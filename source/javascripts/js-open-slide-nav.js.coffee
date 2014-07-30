$ ->
  $('.js-open-slide-nav').click ->
    $('body').toggleClass('is-slided')
    $('.js-slide-nav').toggleClass('is-slided')

  $(".highlight").click ->
    leftSpase = $('.wrapper').width() - $('.article__body').width()
    if $(this).hasClass("is-expanded")
      $(this).css('margin-left', '0')
      $(this).removeClass "is-expanded"
    else
      $(this).css('margin-left', leftSpase * -1)
      $(this).addClass "is-expanded"
    return
