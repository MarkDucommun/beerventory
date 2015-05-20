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

    label: ->
      if this.city && this.state
        "#{this.name} - #{this.city}, #{this.state}"
      else if this.state
        "#{this.name} - #{this.state}"
      else
        this.name
