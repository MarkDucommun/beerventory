@beerventory.factory 'Container', (
  BaseModel
) ->

  class Container extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.type = args.type
      this.volume = args.volume
      this.volume_unit = args.volume_unit
      this.name = args.name
      this.normalizeVolume()
      super(args)

    getPacket: ->
      type: this.type
      volume: this.volume
      volume_unit: this.volume_unit
      name: this.name

    description: -> "#{this.volume}#{this.volume_unit} #{this.type}"

    label: ->
      if this.name
        "#{this.name} (#{this.description()})"
      else
        this.description()

    normalizeVolume: ->
      if this.volume_unit == 'ml'
        this.volume_in_ml = this.volume
      else
        this.volume_in_ml = this.ouncesToMls(this.volume)

    ouncesToMls: (ounces) -> ounces * 29.5735
