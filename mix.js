// This doesn't provide prototype linking
Object.from = function(target) {
  var o = Object.create(target)
  return {
    with: function(mixins) {
      mixins.forEach(function(mixin) {
        Object.keys(mixin).forEach(function(key) {
          Object.defineProperty(o, key, {
            enumerable: true,
            configurable: false,
            writable: false,
            value: mixin[key]
          })
        })
      })
      return o
    }
  }
}

var Mixin1 = {
  foo: function() {
    console.log('foo from Mixin1')
  }
}

var Mixin2 = {
  bar: function() {
    console.log('bar from Mixin2')
  }
}

var MyObject = {
  baz: function() {
    console.log('baz from MyObject')
  }
}

var o = Object.from(MyObject).with([Mixin1, Mixin2])
o.foo()
o.bar()
o.baz()

console.log("MyObject.isPrototypeOf o", MyObject.isPrototypeOf(o))
console.log("Object.prototype.isPrototypeOf o", Object.prototype.isPrototypeOf(o))
console.log("Object.prototype.isPrototypeOf MyObject", Object.prototype.isPrototypeOf(MyObject))
console.log("Mixin1.isPrototypeOf o", Mixin1.isPrototypeOf(o))
