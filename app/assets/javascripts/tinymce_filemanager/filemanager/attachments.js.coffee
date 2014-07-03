imageUploader.controller "attachmentsCtrl", [
  "$scope"
  "$http"
  "$filter"
  "$location"
  ($scope, $http, $filter, $location) ->
    $scope.url = "/filemanager/files"
    $scope.attachments = []
    $scope.inserted_attachments = []
    $scope.tileView = true
    $scope.loading = false
    $scope.query = ->
      queryURL = "/filemanager/files?" + jQuery.param(format: "json")
      $http.get(queryURL).success (data) ->
        $scope.attachments = data
        return

      return

    $scope.query()
    $scope.sendFile = (element) ->

      _.each element.files, (file, i) ->
        form = new FormData()
        form.append "file", file
        $http.post("/filemanager/files", form,
          transformRequest: angular.identity
          headers: "Content-Type": `undefined`
          ).success((data) ->
            $scope.attachments = _.union($scope.attachments, data)
            return
          ).error (data) ->

        return
      return

    $scope.delete = (item) ->
      $http.delete($scope.url+'/'+item._id.$oid, {file: item}, {format: 'json'})
        .success((data) ->
          $scope.attachments = _.without($scope.attachments, item)
        )

    $scope.single_insert = (url, link_text) ->
      $scope.inserted_attachments = []
      $scope.inserted_attachments.push
        url: url
        link: link_text

      $scope.insert()
      return

    $scope.insert = ->
      UploadImageDialog.insert $scope.inserted_attachments, "file"
      $scope.inserted_attachments = []
      return
]