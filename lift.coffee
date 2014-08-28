unaryOps = ['+', '-', '~', '!']
binaryOps = ['+', '-', '*', '/', '%', '&', '|', '^', '>>', '<<', '>>>',
  '==', '!=', '===', '!==', '>', '>=', '<', '<=', '&&', '||']

unaryOpFunctions = _.zipObject unaryOps, _.map unaryOps, (op) ->
  eval "(function(a) {return #{op} a;})"
binaryOpFunctions = _.zipObject binaryOps, _.map binaryOps, (op) ->
  eval "(function(a, b) {return a #{op} b;})"

@lift = (f) -> (gs...) -> (x) ->
  f ((if typeof g is 'function' then g x else g) for g in gs)...
lift.op = (f) -> _.extend f, _.mapValues binaryOpFunctions, (v) ->
  (g) -> lift.op(lift(v)(f, g))
_.extend lift.op, _.mapValues unaryOpFunctions, lift

