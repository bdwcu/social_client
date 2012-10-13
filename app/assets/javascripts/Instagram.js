(function(){

	var Instagram = Backbone.Model.extend({
		formTweet:function(){
			var domElement = document.createElement("div");

		}
	})


	var Instagrams = new Backbone.Collection;
	Instagrams.url = "/instagram"
	Instagrams.fetch();



	window.Instagram = Instagram;
	window.Instagrams = Instagrams;

})(window);



$(document).ready(function(){



})