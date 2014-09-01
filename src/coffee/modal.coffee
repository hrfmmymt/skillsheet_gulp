ModalEffects = (->
  init = ->
    overlay = document.querySelector('.md-overlay')
    [].slice.call(document.querySelectorAll('.md-trigger')).forEach (el, i) ->
      removeModal = (hasPerspective) ->
        classie.remove modal, 'md-show'
        classie.remove document.documentElement,
          'md-perspective' if hasPerspective
        return
      removeModalHandler = ->
        removeModal classie.has(el, 'md-setperspective')
        return
      modal = document.querySelector('#' + el.getAttribute('data-modal'))
      close = modal.querySelector('.md-close')
      el.addEventListener 'click', (ev) ->
        classie.add modal, 'md-show'
        overlay.removeEventListener 'click', removeModalHandler
        overlay.addEventListener 'click', removeModalHandler
        if classie.has(el, 'md-setperspective')
          setTimeout (->
            classie.add document.documentElement, 'md-perspective'
            return
          ), 25
        return

      close.addEventListener 'click', (ev) ->
        ev.stopPropagation()
        removeModalHandler()
        return

      return

    return
  init()
  return
)()