@beerventory.factory 'DirectiveState', ->
  class DirectiveState
    constructor: ->
      this.editing = false
      this.notEditing = true

    startEditing: ->
      this.editing = true
      this.notEditing = false

    stopEditing: ->
      this.editing = false
      this.notEditing = true

    @new: -> new this()
