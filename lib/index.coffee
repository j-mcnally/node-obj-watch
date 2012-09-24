module.exports = class ObjWatcher extends require('events').EventEmitter
  proxy: null
  obj: null
  children: []
  
  watch: (prop, event, cb) ->
    @.on event, (eprop) ->
      if (eprop == prop)
        cb(event)
      
  constructor: (namespace) ->
    (new Function( "with(this) { this.obj = #{namespace} }")).call(@)
    context = @
    @proxy = Proxy.create
      get: (proxy, name) ->
        return context.obj[name]
      set: (proxy, name, value) ->
        console.log('write request to ' + name + ' property with ' + value + ' value');
        if !context.obj[name]?
          console.log('loading')
          context.emit("load", name)
        else
          console.log('changing')
          context.emit("change", name)
        context.obj[name] = value
        
    eval("#{namespace} = this.proxy;")