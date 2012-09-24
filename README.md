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

Dependencies
============

Harmony Proxies,
you can turn this on in node by starting your app with
`node --harmony_proxies app.js`