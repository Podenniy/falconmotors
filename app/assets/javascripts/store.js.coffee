$(document).ready ->
  $("#nav-shadow a").hover (->
    $(this).css "fontSize", "100px"
    $(this).css "color", "blue"
    
  ), ->
    $(this).css "fontSize", "1em"
    $(this).css "color", "black"
    $(this).html "Я обычный параграф."