oloo = (attrs={}, prototype=Object.prototype) ->
  Object.assign Object.create(prototype), attrs

isA = (prototype) -> prototype

module.exports = {oloo, isA}
