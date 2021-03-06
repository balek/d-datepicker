moment = require "moment/min/moment-with-langs.min"

exports.ViewHelpers = class ViewHelpers

  getMonth: (currentDate) ->
    moment(currentDate).lang(@lang).format "MMMM"

  getYear: (currentDate) ->
    moment(currentDate).format "YYYY"

  getDecadeRange: (currentDate) ->
    currentYear = moment(currentDate).year()
    yearInDecade = currentYear % 10
    firstYearInDecade = currentYear - yearInDecade
    lastYearInDecade = firstYearInDecade + 9
    firstYearInDecade + " - " + lastYearInDecade

  activeDate: (active, date) ->
    active = @model.get("active")
    active is date

  activeMonth: (active, date) ->
    # check if active is the same year and month as monthDate
    activeDate = moment(active)
    date = moment(date)
    activeDate.year() is date.year() and activeDate.month() is date.month()

  activeYear: (active, year) ->
    activeDate = moment(active)
    yearDate = moment(year: year)
    activeDate.year() is yearDate.year()

  weekDays: ->
    days = []
    moment.lang @lang
    for i in [0..6]
      days.push moment.weekdaysMin(i)
    days