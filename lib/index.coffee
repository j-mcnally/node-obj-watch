ObjWatcher = class ObjWatcher extends require('events').EventEmitter
  proxy: null
  obj: null
  children: []
  watch: (prop, event, cb) ->
    @.on event, (eprop) ->
      if (eprop == prop)
        cb(event)
      
  constructor: (namespace) ->
    if ObjWatcher.instances[namespace]? #singleton safety
      return instances[namespace]
    else
      ObjWatcher.instances[namespace] = this
    (new Function( "with(this) { this.obj = #{namespace} }")).call(@)
    context = @
    if !Proxy
      Proxy = require('node-proxy')
    
    @proxy = Proxy.create
      get: (proxy, name) ->
        return context.obj[name]
      set: (proxy, name, value) ->
        if !context.obj[name]?
          context.emit("load", name)
        else
          context.emit("change", name)
        context.obj[name] = value
        
    eval("#{namespace} = this.proxy;")

ObjWatcher.instances = []
ObjWatcher.on_load = (ns, prop, cb) ->
    instance = new ObjWatcher(ns)
    instance.watch(prop, "load", cb)
    
module.exports = ObjWatcher