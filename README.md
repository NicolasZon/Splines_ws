# Taller de splines

## Propósito

Estudiar algunos tipos de curvas paramétricas y sus propiedades.

## Tarea

Implemente las curvas cúbicas naturales, de Hermite y Bezier (cúbica y de grado 7), de acuerdo a las indicaciones del sketch adjunto.

*Sugerencia:* Como las curvas de Hermite y cúbica de Bezier requieren varias secciones, reacomode los puntos de control para que su continuidad sea C<sup>1</sup>. Ver [acá](https://visualcomputing.github.io/Curves/#/5/5) y [propiedad 4 de acá](https://visualcomputing.github.io/Curves/#/6/4).

## Profundización

Represente los _boids_ del [FlockOfBoids](https://github.com/VisualComputing/framesjs/tree/processing/examples/Advanced/FlockOfBoids) mediante superficies de spline.

## Integrantes

Máximo 3.

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
 Juan Nicolás Sastoque Espinosa | [NicolasZon](https://github.com/NicolasZon/) |
| Liseth Briceño Albarracín | [ligibrial](https://github.com/ligibrial/) | 


## Implementacion

Para realizar la implementación de Bezier se tuvo en cuenta la sumatoria de todos los puntos con el polinomio de Bernstein, los polinomios de grado Bernstein n forman la base para los polinomios de grado n , para la implementación se tuvo en cuenta el tiempo para recorrer dicha curva.

Por otro lado para la curva de Bezier cubico se definió 4 puntos de control  P0, P1,P2,P3 . P0 y P3, definen los puntos del inicio y final de la curva. P1 y P2 la dirección de la curva, como resultado una aproximación de Bézier, con ventaja de que esta es más suave en los puntos de unión, para la implementación de este se tuvo en cuenta la fórmula matemática para una curva con los 4 puntos de control con (0<t<1).

En cuanto a la implementación de Hermite , se puede describir el polinomio como la suma de cada h00, h10, h01, h11, con su respectivo factor , para ellos se tuvo en cuenta dos situaciones el caso de Bernstein y el expandido, en cuanto al factor del termino expandido se veía mejor resultado de la curva que generaba que por Bernstein.


Finalmente para la implementación de cubicas naturales se toma como referencia la implementación del algoritmo que tiene como base el punto  inicial y  el punto final  como la segunda derivada dando como resultado 0, se toma además como referencia que los puntos de control es n y el número de segmentos es n-1. Se analiza una mayor precisión en cuanto al dibujo de los segmentos de líneas, este  algoritmo implica mayor complejidad en cuanto a cálculos se refiere. 


## Referencias

caso 0:Bezier(Grado 7)
http://mathworld.wolfram.com/BezierCurve.html
caso1 :Hermite
https://en.wikipedia.org/wiki/Cubic_Hermite_spline
caso 2:Bezier cubico
http://soft.vub.ac.be/~tvcutsem/teaching/wpo/grafsys/ex9/les9.html
caso 3:cubicas naturales
http://www.inf-cr.uclm.es/www/cglez/downloads/docencia/AC/splines.pdf



## Entrega

* Modo de entrega: Haga [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla e informe la url del repo en la hoja *urls* de la plantilla compartida (una sola vez por grupo). Plazo: 6/5/18 a las 24h.
