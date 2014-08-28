lift.js
=======
JavaScript function and operator lifting library for higher-level programming.

Requires [Lo-Dash](http://lodash.com/).

## Examples

Lifting `add` over two functions adds them together in the mathematical sense: (*f*+*g*)(*x*) = *f*(*x*) + *g*(*x*):
```javascript
var add = function(a, b) {return a + b;}  // add(a, b) = a + b
var f = function(x) {return 2*x;}         // f(x) = 2x
var g = function(x) {return x + 3;}       // g(x) = x + 3

// h = f + g, i.e. h(x) = f(x) + g(x) = 3x + 3
var h = lift(add)(f, g)
```
Using `lift.op` provides syntactic sugar for prefix and infix operators:
```javascript
var h = lift.op(f)['+'](g)       // equivalent to h above
var negativeF = lift.op['-'](f)  // gives -f, i.e. -f(x) = -2x
```
Infix operators can be chained:
```javascript
var id = function(x) {return x;}

// h = f + g + id, i.e. h(x) = f(x) + g(x) + x = 4x + 3
h = lift.op(f)['+'](g)['+'](id)
```
