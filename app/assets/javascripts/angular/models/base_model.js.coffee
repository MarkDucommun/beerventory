@beer.factory 'BaseModel', (
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

      this.constructor.getRecordPromise ->
        if id
          BeerventoryApi.put([type_plural, id], packet)
        else
          BeerventoryApi.post([type_plural], packet)

    delete: ->
      id = this.id
      type_plural = this.constructor.type_plural()
      LocalCollection.delete(this)
      this.constructor.getRecordPromise ->
        BeerventoryApi.delete([type_plural, id])

    @index: (queryParams) ->
      type_plural = this.type_plural()
      this.getCollectionPromise ->
        BeerventoryApi.get([type_plural], queryParams)

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
        instance = constructor.new(response.data['beer'])
        LocalCollection.add(instance)
        deferred.resolve(instance)
      failure = (response) ->
        deferred.reject(response.data)
      fn().then(success, failure)
      deferred.promise

    @getCollectionPromise: (fn) ->
      constructor = this
      deferred = $q.defer()
      success = (response) ->
        collection = constructor.newCollection(response.data['beers'])
        LocalCollection.addCollection(collection)
        deferred.resolve(collection)
      failure = (response) -> deferred.reject(response.data)
      fn().then(success, failure)
      deferred.promise

    @type_single: -> this.name.toLowerCase()

    @type_plural: -> "#{this.type_single()}s"
