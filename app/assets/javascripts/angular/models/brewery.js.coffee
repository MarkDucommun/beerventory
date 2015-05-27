@beerventory.factory 'Brewery', (
  BaseModel
) ->

  class Brewery extends BaseModel
    @type_plural = -> 'breweries'

    constructor: (args = {}) ->
      this.id = args.id
      this.name = args.name
      this.city = args.city
      this.state = args.state

    getPacket: ->
      name: this.name
      city: this.city
      state: this.state

    location: ->
      if this.city && this.state
        "#{this.city}, #{this.state}"
      else if this.state
        this.state
      else if this.city
        this.city
      else
        null

    label: ->
      if this.location()
        "#{this.name} - #{this.location()}"
      else
        this.name
