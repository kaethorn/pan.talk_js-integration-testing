should = require 'should'

# Setup
{wd,WdWrap}={}
try
  {wd,WdWrap} = require 'wd-sync'
catch err
  {wd,WdWrap} = require '../../index'

browser = null
WdWrap = WdWrap
  with: ->
    browser
  pre: ->
    @timeout 120000

browser = wd.remote()

describe 'Google', ->

  before WdWrap ->
    @init browserName: 'chrome'
    @get 'http://google.com'
    return

  after WdWrap ->
    @quit()
    return

  it 'has a query field', WdWrap ->
    queryField = @elementByName 'q'
    should.exist queryField
    queryField.should.be.a 'object'
    return

  describe 'when entering a search term', ->

    before WdWrap ->
      queryField = @elementByName 'q'
      @type queryField, 'Hello World'
      @type queryField, '\n'
      @setWaitTimeout 3000
      @elementByCss '#ires'
      return

    it 'redirects to the search results', WdWrap ->
      url = @url()
      url.should.match /Hello\+World/
      return

    it 'offers search result', WdWrap ->
      results = @elementsByCss '#ires li.g'
      results.length.should.be.above 5
      return

    return

  return
