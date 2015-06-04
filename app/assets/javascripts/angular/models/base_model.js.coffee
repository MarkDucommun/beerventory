@beerventory.factory 'BaseModel', (
  BeerventoryApi,
  LocalCollection,
  $q
) ->

  class BaseModel
    # README STUFFS
    # Anything that extends base model ought to have the following stuff:
    # 1. An ID
    # 2. A constructor method
    # 3. A getPacket method that defines the data packet to be sent to the server
    #
    # OPTIONAL
    # 4. Overridden type_plural method that returns plural form of the model

    constructor: (args) ->

    save: ->
      id = this.id
      type_plural = this.constructor.type_plural()
      packet = {}
      packet[this.constructor.type_single()] = this.getPacket()

      return this.constructor.getRecordPromise ->
        if id
          BeerventoryApi.put([type_plural, id], packet)
        else
          BeerventoryApi.post([type_plural], packet)

    delete: ->
      id = this.id
      type_plural = this.constructor.type_plural()
      # LocalCollection.delete(this)
      return this.constructor.getRecordPromise ->
        BeerventoryApi.delete([type_plural, id])

    @index: (queryParams, useCache = true) ->
      type_plural = this.type_plural()
      # if useCache && local_promise = LocalCollection.getCollection(type_plural)
      #   return local_promise
      # else
      packet = {}
      packet[this.type_single()] = queryParams
      return this.getCollectionPromise ->
        if queryParams
          BeerventoryApi.get([type_plural], packet)
        else
          BeerventoryApi.get([type_plural])

    @find: (id, useCache = true) ->
      type_plural = this.type_plural()
      # if useCache && local_promise = LocalCollection.get(id, type_plural)
      #   return local_promise
      # else
      return this.getRecordPromise ->
        BeerventoryApi.get([type_plural, id])

    @new: (args) -> new this(args)

    @create: (args) -> this.new(args).save()

    @newCollection: (collectionData) ->
      constructor = this
      _.map collectionData, (recordData) ->
        constructor.new(recordData)

    @getRecordPromise: (fn) ->
      constructor = this
      deferred = $q.defer()
      success = (response) ->
        instance = constructor.new(response.data[constructor.type_single()])
        # LocalCollection.add(instance)
        deferred.resolve(instance)
      failure = (response) ->
        deferred.reject(response.data)
      fn().then(success, failure)
      deferred.promise

    @getCollectionPromise: (fn) ->
      constructor = this
      deferred = $q.defer()
      success = (response) ->
        collection = constructor.newCollection(response.data[constructor.type_plural()])
        # LocalCollection.addCollection(collection)
        deferred.resolve(collection)
      failure = (response) -> deferred.reject(response.data)
      fn().then(success, failure)
      deferred.promise

    @type_single: -> this.name.toLowerCase()

    @type_plural: -> "#{this.type_single()}s"
