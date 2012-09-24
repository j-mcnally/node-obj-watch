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
