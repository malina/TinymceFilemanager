imageUploader.controller "imagesCtrl", [
  "$scope"
  "$http"
  "$filter"
  "$location"
  ($scope, $http, $filter, $location) ->
    $scope.url = "/filemanager/images"
    $scope.images = []
    $scope.inserted_images = []
    $scope.tileView = true
    $scope.loading = []

    $scope.query = ->
      queryURL = "/filemanager/images?" + jQuery.param(format: "json")
      $http.get(queryURL).success (data) ->
        $scope.images = data
        return

      return

    $scope.query()
    
    $scope.sendFile = (element) ->

      _.each element.files, (file, i) ->
        $scope.loading.push i
        form = new FormData()

        form.append "picture", file
        $http.post("/filemanager/images", form,
          transformRequest: angular.identity
          headers: "Content-Type": `undefined`
          ).success((data) ->
            $scope.images = _.union($scope.images, data)
            $scope.loading.shift()
            return
          ).error (data) ->

        return

      return

    $scope.delete = (item) ->
      $http.delete($scope.url+'/'+item._id.$oid, {picture: item}, {format: 'json'})
        .success((data) ->
          $scope.images = _.without($scope.images, item)
        )

    $scope.single_insert = (url, alt_text, thumb_url) ->
      $scope.inserted_images = []
      $scope.inserted_images.push
        url: url
        alt: alt_text
        thumb: thumb_url

      $scope.insert()
      return

    $scope.to_inserted_images = (url, state, thumb_url) ->
      if state
        $scope.inserted_images = _.union($scope.inserted_images,
          url: url
          thumb: thumb_url
        )
      else
        $scope.inserted_images = _.difference($scope.inserted_images,
          url: url
          thumb: thumb_url
        )
        $scope.inserted_images = _.reject($scope.inserted_images, (obj) ->
          obj.url is url
        )
      return

    $scope.insert = ->
      UploadImageDialog.insert $scope.inserted_images, "image"
      $scope.inserted_images = []
      return
]