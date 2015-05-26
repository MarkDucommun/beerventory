@beerventory.factory 'Location', (
  BaseModel
) ->

  class Location extends BaseModel
    constructor: (args = {identifier: true}) ->
      this.id = args.id
      this.container = args.container
      this.room = args.room
      this.identifier = args.identifier
      this.sticker_color = args.sticker_color

    getPacket: ->
      container: this.container
      room: this.room

    description: -> "#{this.container}, #{this.room}"

    label: ->
      if this.identifier
        "#{this.sticker_color} #{this.identifier} - #{this.description()}"
      else
        this.description()
