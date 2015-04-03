library main;

import 'dart:html';
import 'package:dockable/stage/stage.dart';
import 'package:polymer/polymer.dart';

DockStage cp;
DivElement preview;

int red_fontsize = 0;

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      cp = new Element.tag("dock-stage");
      cp.stagewidth = 200;
      cp.stageheight = 200;

      StageElement newel0 = new Element.tag("stage-element");
      newel0.left = 0;
      newel0.width = 50;
      newel0.height = 20;
      newel0.style.backgroundColor = "red";
      newel0.text = "red";
      cp.addElement(newel0);

      StageElement newel1 = new Element.tag("stage-element");
      newel1.left = 60;
      newel1.width = 50;
      newel1.height = 20;
      newel1.style.backgroundColor = "orange";
      cp.addElement(newel1);

      StageElement newel2 = new Element.tag("stage-element");
      newel2.left = 120;
      newel2.width = 50;
      newel2.height = 20;
      newel2.style.backgroundColor = "blue";
      cp.addElement(newel2);

      /*for(int i = 0; i <= 2; i++) {
        StageElement newel = new Element.tag("stage-element");
        newel.left = i * 20;
        newel.width = 20;
        newel.height = 20;
        cp.addElement(newel);
      }*/
      
      ButtonElement butRedFs = querySelector("#red-fontsize"); 
      butRedFs.onClick.listen((_) {
        List items = [8, 12, 16, 20, 24, 32, 36, 40];
        
        newel0.fontsize = items[red_fontsize];
        print("In app ${items[red_fontsize]}");
        
        red_fontsize = ++red_fontsize % items.length;
      });

      document.body.children.add(cp);
    });
  });
}