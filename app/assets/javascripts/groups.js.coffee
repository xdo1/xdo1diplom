# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("[data-tokeninput]").each ->
    url=$(this).attr('data-tokeninput')
    prepopulate=$(this).data('pre')
    attributes=
      crossDomain: false
      prePopulate: prepopulate
      theme: 'bootstrap'
      hintText: "Начните ввод для поиска"
      noResultsText: "Ничего не найдено"
      searchingText: "Поиск"
      propertyToSearch: "name"
    if $(this).attr('data-limit')!=undefined
      attributes['tokenLimit']=$(this).attr('data-limit')
    $(this).tokenInput url, attributes
