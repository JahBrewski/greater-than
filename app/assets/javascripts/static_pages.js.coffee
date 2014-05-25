# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  setInterval () ->
    power_nouns = [ "disease", "disablity", "cancer", "surgery", "vitals", "pills" ]
    random_noun = power_nouns[Math.floor(Math.random()*power_nouns.length)]
    $(".power-noun").fadeOut () ->
      $(this).text(random_noun).fadeIn()
  , 2000

  
