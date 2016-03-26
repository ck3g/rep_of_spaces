# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  hintsUsed = 0
  hintsCount = 0
  availableHints = {}
  for hintName of $("#available_hints").data()
    availableHints[hintsCount] = "##{hintName}"
    hintsCount += 1

  availableHints[hintsCount] = "#translation"

  showResultButtons = () ->
    $("a.hint").remove()
    $("a.check").remove()
    $("#was_wrong").removeClass("hidden-xs-up")
    $("#was_right").removeClass("hidden-xs-up")

  $(document).on "click", "a.hint", (e) ->
    e.preventDefault()

    nextHintSelector = availableHints[hintsUsed]
    if nextHintSelector
      $(nextHintSelector).removeClass("hidden-xs-up")

    hintsUsed += 1
    hintsExists = availableHints[hintsUsed]
    unless hintsExists?
      showResultButtons()

  $(document).on "click", "a.check", (e) ->
    e.preventDefault()

    for hintName of $("#available_hints").data()
      $("##{hintName}").removeClass("hidden-xs-up")

    $("#translation").removeClass("hidden-xs-up")
    showResultButtons()
