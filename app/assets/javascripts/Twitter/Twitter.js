(function(){

	var Tweet = Backbone.Model.extend({
		tweet:null,
		formTweet:function(){
			var domElement = document.createElement("div");

		},	

		parseTweet:function(){
			var splitTweet = this.attributes.text.split(" ");
			
			var newTweet = [];
			for(var i = 0;i<splitTweet.length;i++){
				var part = splitTweet[i];

				if(part.search("@") !== -1){
					
					var replaceText = "<a href=\"http://www.twitter.com/"+part+"\">"+part+"</a>";
					part = part.replace(part,replaceText);

					
				}else if((part.search("http") !== -1) || (part.search("www") !== -1)){
					var replaceText = "<a href=\""+part+"\">"+part+"</a>";
					part = part.replace(part,replaceText);
				}
			
				

				newTweet.push(part);


			}
			newTweet = newTweet.join(" ");
			this.tweet = newTweet;

			//return for chaining
			return this;
		}
	})


	var Tweets = Backbone.Collection.extend({
		model:Tweet,
		url:"/twitter",
		tweets:[],
		initialize:function(callback){
			//keep a reference to the collection;
			this.parent = this;
			this.fetch({
				success:function(res){
					
					callback(res);
				},

				error:function(e){
					console.log("Error fetching models");
					console.log(e);
				}
			});

			//_.bindAll(this,"at");
		},

		parseTweets:function(){

			for(var i = 0;i<this.length;i++){
				this.at(i).parseTweet();
			}
		},

		displayTweets:function(anchor){
			for(var i = 0;i<this.length;i++){
				var div = document.createElement("div");
				div.className = "tweet";

				div.setAttribute("data-tweet",this.at(i).tweet);
				div.setAttribute("data-type","tweets");

				anchor.append(div)
			}
		}

	

		

	});




	window.Tweet = Tweet;
	window.Tweets = Tweets;

})(window);


