/**
 * Splines.
 *
 * Here we use the interpolator.keyFrames() nodes
 * as control points to render different splines.
 *
 * Press ' ' to change the spline mode.
 * Press 'g' to toggle grid drawing.
 * Press 'c' to toggle the interpolator path drawing.
 
REFERENCIAS:
caso 2:Bezier cubico

http://soft.vub.ac.be/~tvcutsem/teaching/wpo/grafsys/ex9/les9.html

caso 0:Bezier(Grado 7)
http://mathworld.wolfram.com/BezierCurve.html

caso1 :Hermite
https://en.wikipedia.org/wiki/Cubic_Hermite_spline

caso 3:cubicas naturales
http://www.inf-cr.uclm.es/www/cglez/downloads/docencia/AC/splines.pdf
 
 */

import frames.input.*;
import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

import java.util.List;
import java.util.ArrayList;
import java.lang.Math;

// global variables
// modes: 0 natural cubic spline; 1 Hermite;
// 2 (degree 7) Bezier; 3 Cubic Bezier
int mode;

Functions bezier, hermite, bezier3, natural;

Scene scene;
Interpolator interpolator;
OrbitNode eye;
boolean drawGrid = true, drawCtrl = true;

//Choose P3D for a 3D scene, or P2D or JAVA2D for a 2D scene
String renderer = P3D;

void setup() {
  size(800, 800, renderer);
  scene = new Scene(this);
  eye = new OrbitNode(scene);
  eye.setDamping(0);
  scene.setEye(eye);
  scene.setFieldOfView(PI / 3);
  //interactivity defaults to the eye
  scene.setDefaultGrabber(eye);
  scene.setRadius(150);
  scene.fitBallInterpolation();
  interpolator = new Interpolator(scene, new Frame());
  // framesjs next version, simply go:
  //interpolator = new Interpolator(scene);
  
  bezier = new Functions();
  hermite = new Functions();
  bezier3 = new Functions();
  natural = new Functions();

  // Using OrbitNodes makes path editable
  for (int i = 0; i < 8; i++) {
    Node ctrlPoint = new OrbitNode(scene);
    ctrlPoint.randomize();
    //System.out.println(ctrlPoint);
    interpolator.addKeyFrame(ctrlPoint);
    //System.out.println(interpolator);
  }
  
}

void draw() {
  background(175);
  if (drawGrid) {
    stroke(255, 255, 0);
    scene.drawGrid(200, 50);
  }
  if (drawCtrl) {
    fill(255, 0, 0);
    stroke(255, 0, 255);
    for (Frame frame : interpolator.keyFrames())
      scene.drawPickingTarget((Node)frame);
  } else {
    fill(255, 0, 0);
    stroke(255, 0, 255);
    scene.drawPath(interpolator);
  }
  // implement me
  // draw curve according to control polygon an mode
  // To retrieve the positions of the control points do:
  // for(Frame frame : interpolator.keyFrames())
  //   frame.position();
  
  //Vector punto = new Vector();
  List<Vector> puntos = new ArrayList<Vector>();
  
  for(Frame frame : interpolator.keyFrames()){
    puntos.add(frame.position());
    //puntos.add(punto);
  }
  //System.out.println(puntos);
  
  //Vector primer_punto = puntos.get(0);
  //Vector punto_actual = puntos.get(0);
  textSize(22);
  fill(122, 0, 153);
  switch (mode) {
    case 0:
      bezier.setPoints(puntos);
      bezier.bezier();
      text("Bezier", -100, 0);
      break;
    case 1:
      hermite.setPoints(puntos);
      hermite.hermite();
      text("Hermite", -100, 0);
      break;
    case 2:
      bezier3.setPoints(puntos);
      bezier3.Bezier3();
      text("Bezier cúbico", -100, 0);
      break;
    case 3:
      natural.setPoints(puntos);
      natural.splineCubicaNatural();
      text("Cubicas Naturales", -100, 0);
      break;
      

  }
}

void keyPressed() {
  if (key == ' ')
    mode = mode <= 4 ? mode+1 : 0;
  if (key == 'g')
    drawGrid = !drawGrid;
  if (key == 'c')
    drawCtrl = !drawCtrl;
 
}