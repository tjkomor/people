$(document).ready ->

  container = $('.mod-students')

  if container.length == 0
    return

  students = container.find('.main article')
  tags = container.find('aside input')

  # Reset-link
  init_reset_links = ->
    container.find('.reset').click (e) ->
      tags.prop('checked', false)
      students.show()
      e.preventDefault()
  init_reset_links()

  # Watch for changes on tags
  tags.change ->

    # Show all if no tags are set
    if tags.filter(':checked').length == 0
      students.show()
      return

    # Hide students and construct array to add students-to-be-shown to
    students.hide()
    selected_students = students

    # Filter matches for 'class'
    checked = tags.filter('[data-class]:checked')
    if checked.length > 0
      checked.each ->
        classof = $(this).data('class')
        selected_students = selected_students.filter("[data-class='#{classof}']")

    # Filter matches for 'what'
    checked = tags.filter('[data-what]:checked')
    if checked.length > 0
      checked.each ->
        what = $(this).data('what')
        selected_students = selected_students.filter("[data-what*='#{what}']")

    # Filter matches for 'location'
    checked = tags.filter('[data-location]:checked')
    if checked.length > 0
      checked.each ->
        location = $(this).data('location')
        selected_students = selected_students.filter("[data-location*='#{location}']")

    # Filter matches for 'stack'
    checked = tags.filter('[data-stack]:checked')
    if checked.length > 0
      checked.each ->
        stack = $(this).data('stack')
        selected_students = selected_students.filter("[data-stack*='#{stack}']")

    # Filter matches for 'language'
    checked = tags.filter('[data-language]:checked')
    if checked.length > 0
      checked.each ->
        language = $(this).data('language')
        selected_students = selected_students.filter("[data-language*='#{language}']")

    # Show students that match _all_ of the criteria
    container.find('.no-match').remove()
    selected_students.show()

    # Show message if no results
    if selected_students.length == 0
      container.find('.main').append('<p class="no-match">We couldn\'t find any students matching your criteria. You may want to alter your criteria or <a href="#" class="reset">reset all filters</a>.</p>')
      init_reset_links()
