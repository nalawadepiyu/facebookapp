<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '158912474642702',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();   
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
 
  
  </script>

<div class="fb-login-button" 
	data-max-rows="1"
	data-size="large"
	data-button-type="continue_with"
	data-show-faces="false"
	data-scope="public_profile,email,publish_actions"
	data-onlogin="checkLoginState()"
	data-auto-logout-link="false"
	data-use-continue-as="false"
	>
</div>

<script>
	function checkLoginState() {
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	}

	
	
	function testAPI() {
    FB.api('/me', function(response) {
      var uid = response.id;
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';  
      document.getElementById('display_photo').src =
    	  'http://graph.facebook.com/'+uid+'/picture?type=square';    	  
    })
	}
	

 	function statusChangeCallback(response) {
	FB.login(function(response) {
	    if (response.status === 'connected') {
	    	testAPI();
	    	
	    }
	    else {
		      // The person is not logged into your app or we are unable to tell.
		      document.getElementById('status').innerHTML = 'Please log ' +
		        'into this app.';
		    }
	      
     },{scope: 'public_profile,email'});
	      
	}
	
 	
 	
	function publish_message(){
		var msg = document.getElementById('textid').value;
		console.log(msg);
		FB.login(function(){
			FB.api('/me/feed', 'post', {message: msg }, function(resp){
				if(resp.error){
					document.getElementById('succcess').innerHTML = resp.error.error_user_msg ;
				}
				else
					{
					document.getElementById('succcess').innerHTML = 'success!';
					}
			}); 
			}, {scope: 'publish_actions'});
		
	}
	

</script>


<div id="status">
</div>

<br>
<br>
<br>
<br>

<div>
<input type="text" id ="textid" />
<button onclick="publish_message()">Publish on Facebook</button>
</div>


<br>
<br>
<br>
<br>

<div id= "succcess">
</div>



<div>
<img src=""  id= "display_photo">
</div>


</body>
</html>