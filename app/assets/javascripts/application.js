// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
/**
	Makes a new Tweets collection. Pass
	in the callback to get triggered after
	tweets are fetched from the server
*/


if(localStorage.getItem("twitterloggedin") === "true"){
	console.log("true");
	loadTweets();
}



function loadTweets(){
	var tweets = new Tweets(function(tweets){
		tweets.prepTweets($("#tweets"));
		render();
	});

	function render(){
		
		tweets.showTweets(".tweet");
		
	}


	$("#writetweet").on("click",function(){
		$("#tweetmodal").reveal();
	})
}


/*
	Deal with login
*/
$("#loginbutton").on("click",function(){
	$("#login").reveal()
})

function twitterLogin(page){
	window.location = "/auth/twitter?page=home";
}

function instagramLogin(page){
	window.location = "/instagram/auth";
}