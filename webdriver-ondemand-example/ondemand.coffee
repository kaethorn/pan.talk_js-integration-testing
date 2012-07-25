util = require './util'
should = require 'should'
{browser, WdWrap, profile} = util.WebDriverSetup()

describe 'Google', ->

  for desired in profile.desiredBrowsers
    do (desired) ->

      describe "in #{desired.browserName}", ->

        before WdWrap ->
          @init desired
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

  return
