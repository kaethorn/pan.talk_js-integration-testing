profiles = require './profile'

class Util
  # Setup a specific profile
  WebDriverSetup: ->
    profile = profiles.get()
    # Try to read the profile name from an evironment variable
    if process.env.WD_PROFILE
      profile = profiles.get process.env.WD_PROFILE

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

    browser = wd.remote.apply @, profile.browserInitParams

    return browser: browser, WdWrap: WdWrap, profile: profile

  # Helper methods
  #
  # * Common
  waitForCssVisible: (wd, selector) ->
    wd.waitForCondition "$('.#{selector}:visible').length > 0", 2000, 200

  click: (wd, selector) ->
    el = wd.elementByCss selector
    wd.clickElement el

  # * str-specific
  setIndication: (wd, dialog, choice) ->
    @click wd, ".menu-items a.#{dialog}"
    @waitForCssVisible wd, '.selector-dialog'
    @click wd, ".selector-dialog ##{choice}"

  selectToothAndRidgeWidth: (wd, tooth, ridgeWidth) ->
    @click wd, '.menu-items a.tooth-position-edentulous'
    @waitForCssVisible wd, '.selector-dialog'
    @click wd, "##{tooth}"
    @waitForCssVisible wd, '.ridge-width-edentulous'
    @click wd, "[id='#{ridgeWidth}']"

module.exports = new Util()
