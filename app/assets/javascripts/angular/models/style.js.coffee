@beerventory.factory 'Style', (
  BaseModel
) ->

  class Style extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.name = args.name

    getPacket: ->
      name: this.name
