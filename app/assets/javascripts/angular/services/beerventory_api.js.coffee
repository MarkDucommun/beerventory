@beerventory.service 'BeerventoryApi', (
  $http
) ->

  baseUrl: 'api/v1'

  get: (urlList, data) ->
    url = this.createUrlFromList(urlList)
    url += this.appendQueryString(data) unless typeof(data) == 'undefined'
    $http.get(url)

  post: (urlList, data) ->
    $http.post(this.createUrlFromList(urlList), data)

  put: (urlList, data) ->
    $http.put(this.createUrlFromList(urlList), data)

  delete: (urlList, data) ->
    $http.delete(this.createUrlFromList(urlList), data)

  createUrlFromList: (urlList) ->
    listClone = urlList.slice(0)
    listClone.unshift(this.baseUrl)
    listClone.join('/')

  appendQueryString: (data) ->
    queryString = '?'
    angular.forEach data, (value, param) ->
      queryString += "#{param}=#{value}&"
    queryString.substring(0, queryString.length - 1)
