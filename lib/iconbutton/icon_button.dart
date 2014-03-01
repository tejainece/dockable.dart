library iconbutton;

import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'dart:html';
import 'dart:async';

/*
 * TODO:
 * 1) Two modes: Toggle mode and Click mode
 * 2) onClick() stream
 * 3) onSelect() stream
 * 
 * Show border on mouse over
 */

/**
 * dockable-ui-icon-button enables you to place an image centered in a button.
 *
 * Example:
 *
 *     <dockable-button src="star.png"></dockable-icon-button>
 *
 * @class dockable-icon-button
 */
@CustomTag('dockable-icon-button')
class DockableIconButton extends PolymerElement {
  DockableIconButton.created() : super.created();
  
  @override 
  void polymerCreated() {
    super.polymerCreated();
    sizeChanged();
    
    onClick.listen((e) {
      if(togglable) {
        toggleSelection();
      }
    });
  }

  /**
   * The URL of an image for the icon.
   */
  @published String src = '';
  
  /**
   * The size of the icon button.
   */
  @published int size = 24;
  
  void sizeChanged() {    
    this.style.width =  '${this.size}px';
    this.style.height = '${this.size}px';
  }
  
  /**
   * Sets if the icon button is togglable 
   */
  @published bool togglable = false;
  
  void togglableChange() {
    //TODO: debug to see if the value of toggable is updated?
    print('${togglable}');
    if(togglable) {
      
    } else {
      deselect();
    }
  }

  /**
   * If true, border is placed around the button to indicate
   * active state.
   */
  bool _selected = false;
  bool get selected => _selected;
  select() {
    if(togglable && _selected != true) {
      _selected = true;
      //TODO: return a event object?
      _selectionEC.add(this);
      this.classes.add('active');
    }
  }
  deselect() {
    if(togglable && _selected != false) {
      _selected = false;
      //TODO: return a event object?
      _deselectionEC.add(this);
      this.classes.remove('active');
    }
  }
  toggleSelection() {
    if(_selected) {
      deselect();
    } else {
      select();
    }
  }
  
  //events
  StreamController _selectionEC = new StreamController.broadcast();
  Stream get onButtonSelected => _selectionEC.stream;
  
  StreamController _deselectionEC = new StreamController.broadcast();
  Stream get onButtonDeselected => _deselectionEC.stream;
}
