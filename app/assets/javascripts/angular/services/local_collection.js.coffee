@beerventory.service 'LocalCollection', (
  $q,
  DateService
) ->

  locals: {}
  lastCached: {}

  add: (object) ->
    type = object.constructor.type_plural()
    this.locals[type] ||= []
    this.delete(object)
    this.locals[type].push(object)

  addCollection: (collection) ->
    that = this
    type = collection[0].constructor.type_plural()
    that.lastCached[type] = Date.now()
    _.each collection, (object) -> that.add(object)

  get: (id, type) ->
    id = parseInt(id)
    deferred = $q.defer()
    if local_object = _.findWhere(this.locals[type], id: id)
      deferred.resolve(local_object)
      return deferred.promise
    else
      return null

  getCollection: (type) ->
    that = this
    id = parseInt(id)
    deferred = $q.defer()
    if this.lastCached[type] && this.lastCached[type] > DateService.fiveMinsAgo()
      deferred.resolve(that.locals[type])
      return deferred.promise
    else
      return null

  delete: (object) ->
    type = object.constructor.type_single()
    collection = this.locals[type]
    this.locals[type] = _.without(collection, _.findWhere(collection, id: object.id))
