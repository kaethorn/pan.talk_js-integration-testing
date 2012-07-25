{wd,Wd} = require 'wd-sync'
browser = wd.remote()

Wd with:browser, ->
  @init browserName: 'firefox'

  @get "http://google.com"

  queryField = @elementByName 'q'
  @type queryField, "Hello World"
  @type queryField, "\n"

  @setWaitTimeout 3000
  @elementByCss '#ires'
  console.log @title()

  @quit()
