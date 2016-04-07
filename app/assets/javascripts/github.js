$(document).ready(function(){
  if ($("body").hasClass("users")) {
    renderUserData();
  }
  else {
    renderUserFeedData();
    renderFollowingFeedData();
  }
})

var renderUserData = function(){

  $.getJSON( "https://api.github.com/user/followers?access_token=" + userToken, function( data ) {
    $.each( data, function( key, follower ) {
      $('#follower-list').append("<div class='follower'>" + follower.login + "</div>")
    });
  });

  $.getJSON( "https://api.github.com/user/following?access_token=" + userToken, function( data ) {
    $.each( data, function( key, following ) {
      $('#following-list').append("<div class='following'>" + following.login + "</div>")
    });
  });

  $.getJSON( "https://api.github.com/user/starred?access_token=" + userToken, function( data ) {
    $.each( data, function( key, starred ) {
      $('#starred-list').append("<div class='starred'>" + starred.full_name + "</div>")
    });
  });

  $.getJSON( "https://api.github.com/user/repos?access_token=" + userToken, function( data ) {
    $.each( data, function( key, repo ) {
      $('#repo-list').append("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>" + repo.name + "</div>")
    });
  });

  $.getJSON( "https://api.github.com/users/" + userNickname + "/orgs?access_token=" + userToken, function( data ) {
    $.each( data, function( key, org ) {
      $('#org-list').append("<div class='org'>" + org.login + "</div>")
    });
  });
}

var renderFollowingFeedData = function() {
  $.getJSON( "/events?type=following", function(data) {
    renderFeedTableRow("following", data)
  });
}
var renderUserFeedData = function() {
  $.getJSON( "/events?type=user", function(data) {
    renderFeedTableRow("user", data)
  });
}

var renderFeedTableRow = function(className, data) {
  html = ""
  $.each( data, function( key, event ) {
    html += "<tr>";
    html += "<td>" + event.table.repo.name + "</td>"
    html += "<td class = 'text-left'>"
    $.each (event.table.payload.commits, function(key, commit) {
      html += commit.message
    });
    html += "</td> </tr>"
  })
  $('#' + className + '-body').append(html)
}
