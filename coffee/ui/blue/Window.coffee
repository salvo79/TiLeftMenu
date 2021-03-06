# Shortcuts

dir =  'ui/blue'
mod =  "#{dir}/Window"

$$ = (require "#{dir}/style").style
trace = (mes)-> Ti.API.info  "#{mod}:#{mes}"
mix = (require 'helpers/util').mix

class Window        
  constructor: (tab)->
    trace "start constructor"


    # UI

    window = Ti.UI.createWindow mix $$.window,
      title: "Blue"
      backgroundColor: 'blue'

    menuBtn =  Ti.UI.createButton $$.menuBtn
    window.setLeftNavButton menuBtn

    label = Ti.UI.createLabel
      right: 20
      width: 100
      height: 200 
      font:{fontSize:128}
    window.add label
          

    # Functions      
 
    refresh = (option)->
      label.text = option.name
      return
     
    _bubble = (type, options, propagation, source)->
      window.fireEvent 'bubble',
        btype: type
        boptions: options || {}
        bpropagation: typeof propagation == 'undefined' && true || propagation
        bsource: source || mod
      return


    # Event Listeners
      
    menuBtn.addEventListener 'click', (e)->
      _bubble 'showMenu'
      return


    # Disclose
      
    window.refresh = refresh
    
    trace "end constructor"
    return window

trace "end load"
    
module.exports = Window

