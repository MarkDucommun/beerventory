@beerventory.factory 'Beer', (
  BaseModel,
  Brewery
) ->

  class Beer extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.name = args.name
      this.brewery = Brewery.new(args.brewery)

    getPacket: ->
      name: this.name
      brewery_id: this.brewery.id
