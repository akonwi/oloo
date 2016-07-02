test = require 'tape'
{oloo, isA} = require '../oloo'

test 'oloo function creates an object', (t) ->
  akon = oloo(name: 'akon')
  t.ok Object.prototype.isPrototypeOf akon
  t.is akon.name, 'akon', "created object has given properties"
  t.end()

test 'isA function links an object to prototype', (t) ->
  name = 'akon'
  Person = { getName: -> name }

  akon = oloo null, isA(Person)
  t.ok Person.isPrototypeOf akon
  t.is akon.getName(), name, "created object has delegated behavior"
  t.end()
