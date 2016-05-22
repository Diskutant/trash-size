command: "du -ch ~/.Trash | grep total | cut -c 1-5"

refreshFrequency: 30000

render: (output) -> """
  <div class="trashWidget">
    <img src="trash-size.widget/icon.png">
    <a class="size">#{output}</a>
  </div>
"""

style: """
  bottom: 10px
  right: 10px
  font-size: 24px
  font-family: Helvetica Neue
  font-weight: 100
  color: #fff
  background-color: rgba(#000, 0.5)
  padding: 4px 6px 4px 6px
  border-radius: 5px

  img
    height: 26px
    margin-bottom: -3px
    margin-left: -3px
"""

update: (output, domEl) ->
  if (output.indexOf(" 0B") > -1)
    $(domEl).find('.trashWidget').parent().attr("style", "display:none;")
  else
    $(domEl).find('.trashWidget').parent().attr("style", "display:block;")
    $(domEl).find('.size').html(output)