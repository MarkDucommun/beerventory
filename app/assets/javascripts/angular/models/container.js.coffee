@beer.factory 'Container', (
  BaseModel
) ->

  class Container extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.type = args.type
      this.volume = args.volume
      this.volume_unit = args.volume_unit
      this.name = args.name

    getPacket: ->
      type: this.type
      volume: this.volume
      volume_unit: this.volume_unit
      name: this.name
