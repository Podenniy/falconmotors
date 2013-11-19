$(".registr_box").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      $('#sign_up').modal('hide')
      $('#sign_up_button').hide()
      $('#submit_comment').slideToggle(1000, "easeOutBack" )
    else
      alert('failure!')