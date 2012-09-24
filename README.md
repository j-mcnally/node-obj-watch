node-obj-watch
==============

Watches an object for changes and fires an event for notification

Sample Usage
============

```
ObjWatcher = require('node-obj-watch')
appWatch = new ObjWatcher("App")

appWatch.watch "Post", "load", ->
  console.log("Posts loaded and called back")
```
-or-

if you want to easily add this to your module/framework

```
Tower.Support.on_load = require('node-obj-watch').on_load

Tower.Support.on_load "App", "Post", ->
  console.log("Posts loaded and called back")
```

Hints
=====

This has only been tested with NodeJS 0.8.2
Its advised that you turn harmony-proxies on but it does sue node-proxy as a fallback.
The code should be easy to port to browsers but again only ones that have implemented harmony proxies.