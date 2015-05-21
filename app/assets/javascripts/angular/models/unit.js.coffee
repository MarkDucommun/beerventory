@beerventory.factory 'Unit', (
  BaseModel,
  Beer,
  Container,
  Location
)  ->

  class Unit extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.identifier = args.identifier
      this.sticker_color = args.sticker_color
      this.bottling_date = new Date(args.bottling_date) if args.bottling_date
      this.purchase_date = new Date(args.purchase_date) if args.purchase_date
      this.best_by_date = new Date(args.best_by_date) if args.best_by_date
      this.beer = Beer.new(args.beer)
      this.container = Container.new(args.container)
      this.location = Location.new(args.location)
      super(args)

    getPacket: ->
      bottling_date: this.bottling_date
      purchase_date: this.purchase_date
      best_by_date: this.best_by_date
      beer_id: this.beer.id
      container_id: this.container.id
      location_id: this.location.id

    identifierLabel: -> "#{this.sticker_color} #{this.identifier}"
