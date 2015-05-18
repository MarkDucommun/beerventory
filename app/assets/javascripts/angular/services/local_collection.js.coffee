@beer.service 'LocalCollection', (
  $q
) ->

  locals: {}

  add: (object) ->
    type = object.constructor.type_single()
    this.locals[type] ||= []
    this.delete(object)
    this.locals[type].push(object)

  addCollection: (collection) ->
    that = this
    _.each collection, (object) -> that.add(object)

  get: (id, type) ->
    id = parseInt(id)
    deferred = $q.defer()
    if local_object = _.findWhere(this.locals[type], id: id)
      deferred.resolve(local_object)
      return deferred.promise
    else
      return null

  delete: (object) ->
    type = object.constructor.type_single()
    collection = this.locals[type]
    this.locals[type] = _.without(collection, _.findWhere(collection, id: object.id))
