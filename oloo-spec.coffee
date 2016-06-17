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

  akon = oloo isA(Person)
  t.ok Object.prototype.isPrototypeOf akon
  t.is akon.getName(), name, "created object has delegated behavior"
  t.end()

test 'isA function links an object to multiple prototypes', (t) ->
  Person = { getName: -> @name }
  Coder = { getGitHubId: -> @githubId }

  akon = oloo { name: 'akon', githubId: 'akonwi' }, isA(Person, Coder)

  t.ok Person.isPrototypeOf akon, "Person is prototype of akon"
  t.ok Coder.isPrototypeOf akon, "Coder is prototype of akon"
  t.is akon.getName(), akon.name, "created object has getName behavior"
  t.is akon.getGitHubId(), akon.githubId, "created object has getGitHubId behavior"
  t.end()
