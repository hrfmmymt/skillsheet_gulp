#!
# * classie - class helper functions
# * from bonzo https://github.com/ded/bonzo
# *
# * classie.has( elem, 'my-class' ) -> true/false
# * classie.add( elem, 'my-new-class' )
# * classie.toggle( elem, 'my-class' )
#

#jshint browser: true, strict: true, undef: true

#global define: false
((window) ->
  
  # class helper functions from bonzo https://github.com/ded/bonzo
  classReg = (className) ->
    new RegExp('(^|\\s+)' + className + '(\\s+|$)')

  # classList support for class management
  toggleClass = (elem, c) ->
    fn = (if hasClass(elem, c) then removeClass else addClass)
    fn elem, c
    return
  'use strict'
  hasClass = undefined
  addClass = undefined
  removeClass = undefined
  if 'classList' of document.documentElement
    hasClass = (elem, c) ->
      elem.classList.contains c

    addClass = (elem, c) ->
      elem.classList.add c
      return

    removeClass = (elem, c) ->
      elem.classList.remove c
      return
  else
    hasClass = (elem, c) ->
      classReg(c).test elem.className

    addClass = (elem, c) ->
      elem.className = elem.className + ' ' + c  unless hasClass(elem, c)
      return

    removeClass = (elem, c) ->
      elem.className = elem.className.replace(classReg(c), ' ')
      return
  classie =
    
    # full names
    hasClass: hasClass
    addClass: addClass
    removeClass: removeClass
    toggleClass: toggleClass
    
    # short names
    has: hasClass
    add: addClass
    remove: removeClass
    toggle: toggleClass

  
  # transport
  if typeof define is 'function' and define.amd
    
    # AMD
    define classie
  else
    
    # browser global
    window.classie = classie
  return
) window