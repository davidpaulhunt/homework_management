# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".list-item").hover ->
    li = $(this).parents("li")
    target = $(li).children(".btn-list")
    $(target).toggleClass "delete-me"