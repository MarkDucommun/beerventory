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
      identifier: this.identifier

    label: ->
      if this.identifier
        "#{this.sticker_color} #{this.identifier} - #{this.container}, #{this.room}"
      else
        "#{this.container}, #{this.room}"
