@beerventory.factory 'Location', (
  BaseModel
) ->

  class Location extends BaseModel
    constructor: (args = {}) ->
      this.id = args.id
      this.container = args.container
      this.room = args.room

    getPacket: ->
      container: this.container
      room: this.room
