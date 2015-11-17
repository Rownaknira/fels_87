@add_fields = (link, assoc, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + assoc, "g")
  $(link).before content.replace(regexp, new_id)

@remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val "1"
  $(link).closest(".form-group").hide()

ready = ->
  $(".check").on "change", ->
    $(".check").not(this).prop "checked", false

lessons = ->
  $(".result").hide()
  $(".result:first").show()
  $(".count").html "1/20"
  $num = 1
  $(".choose").click ->
    $num++
    $(".count").html $num + "/20"
    if $num <= 20
      $(".result:visible").hide().next().next().show()
      if $num is 20
        $(".choose").hide()
        $(".alert-submit").hide()
    false

$(document).ready ready
$(document).ready lessons
$(document).on "page:load", ready
$(document).on "page:update", ready
$(document).on "page:load", lessons
