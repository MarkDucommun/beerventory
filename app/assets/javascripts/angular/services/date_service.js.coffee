@beerventory.service 'DateService', ->
  fiveMinsAgo: -> this.subtractMinutes(Date.now(), 5)

  subtractMinutes: (time, minutes) -> time - (minutes * 60000)
