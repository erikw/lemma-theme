---
---

correct_badge_position = () ->
    $('ul li span.badge').each (_, badge) ->
        parent = $(badge).parent()
        $(badge).detach().prependTo(parent)

list_toggle = (it) ->
    parent = $(it).parent()
    parent.find('span.glyphicon:first').toggleClass('glyphicon-chevron-down')
    parent.find('span.glyphicon:first').toggleClass('glyphicon-chevron-up')
    parent.find('ul:first').toggleClass('hidden')

rightbar_change_visible = () ->
    $('#rightbar').is(':visible') != $('#rightbar').data('prev-visible')

rightbar_make_position = () ->
    $('#rightbar').data('prev-visible', $('#rightbar').is(':visible'))
    dest = if $('#rightbar').is(':visible') then '#rightbar' else '#leftbar'
    $('#menubar-movable').detach().appendTo(dest)


$(document).ready ->
    $('table').addClass('table')
    $('#menubar').addClass('hidden-xs')
    rightbar_make_position()
    correct_badge_position()

    $('img').each (_, img) ->
        alt = $(img).attr('alt')
        if alt?.trim().length
            $(img).wrap($('<div>').addClass('figure'))
                  .after($('<p>').html($('<em>').html(alt)))
                  .wrap('<p>')

    $('.list-toggle').click ->
        list_toggle(this)

    $('#menu-toggle').click ->
        $('#menubar').toggleClass('hidden-xs')

    $(window).resize ->
        if rightbar_change_visible()
            rightbar_make_position()
