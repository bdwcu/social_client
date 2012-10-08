(function(){

	//check for current user
	var token = localStorage.getItem("twitter-token");

	if((token === null)||(token === undefined)){
		//window.location = "https://api.twitter.com/oauth/access_token";
	}


})(window);