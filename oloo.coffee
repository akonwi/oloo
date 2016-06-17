oloo = (attrs={}, prototype=Object.prototype) ->
  Object.assign Object.create(prototype), attrs

reducer = (previous, current) -> Object.setPrototypeOf current, previous

isA = (prototypes...) ->
  prototypes.reduce reducer, Object.prototype

module.exports = {oloo, isA}
