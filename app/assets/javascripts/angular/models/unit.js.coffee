@beerventory.factory 'Unit', (
  BaseModel,
  Container
)  ->

  class Unit extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.bottling_date = new Date(args.bottling_date) if args.bottling_date
      this.purchase_date = new Date(args.purchase_date) if args.purchase_date
      this.best_by_date = new Date(args.best_by_date) if args.best_by_date
      this.container = Container.new(args.container)
      super(args)

    getPacket: ->
      bottling_date: this.bottling_date
      purchase_date: this.purchase_date
      best_by_date: this.best_by_date
      container_id: this.container.id
