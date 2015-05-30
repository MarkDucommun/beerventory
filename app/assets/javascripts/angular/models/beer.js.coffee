@beerventory.factory 'Beer', (
  BaseModel,
  Brewery
) ->

  class Beer extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.name = args.name
      this.brewery = Brewery.new(args.brewery) if args.brewery
      this.style = Style.new(args.style) if args.style

    getPacket: ->
      name: this.name
      brewery_id: this.brewery.id if this.brewery
      style_id: this.style.id if this.style

    label: -> "#{this.name} - #{this.brewery.name}"
