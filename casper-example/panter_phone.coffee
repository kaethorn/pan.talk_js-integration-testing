casper = require('casper').create
  viewportSize:
    width: 1024
    height: 768

casper.start 'http://panter.ch', ->
  @test.assertTitle 'Panter llc - A', 'title is awsome'
  @test.assertTextExists '+41 (0)44 500 2904', 'phone number is ok'
  @click "img[alt='Software']"

casper.then ->
  @test.assertUrlMatch /^http:\/\/panter\.ch\/softwareentwicklung/, 'url is correct'
  @back()

casper.then ->
  @clickLabel 'management team', 'a'

casper.then ->
  @test.assertTextExists 'B. Seeliger', 'beat is mentioned'

casper.run ->
  @test.renderResults true

