/**
 * Created by USER on 5/31/2017.
 */

function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
        // Logged into your app and Facebook.
        testAPI();
    } else {
        // The person is not logged into your app or we are unable to tell.
        document.getElementById('status').innerHTML = 'Please log ' +
            'into this app.';
    }
}

function checkLoginState() {
    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function () {
    FB.init({
        appId: '300195257082047',
        cookie: true,  // enable cookies to allow the server to access
                       // the session
        xfbml: true,  // parse social plugins on this page
        version: 'v2.9' // use graph api version 2.8
    });

    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });
};

// Load the SDK asynchronously
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function (response) {
        console.log('Successful login for: ' + response.name);
        document.getElementById('ourDiv').innerHTML ="Name: " + response.name + "<br>" +  "Id: " +
            response.id;

        document.getElementById('see').setAttribute("href","/seemybeers?status=" +response.id
            +"&name=" + response.name);
        document.getElementById('add').setAttribute("href","/addabeer?status=" + response.id
            +"&name=" + response.name);
        document.getElementById('find').setAttribute("href","/findabeer?status=" + response.id
            +"&name=" + response.name);
        document.getElementById('review').setAttribute("href","/reviewabeer?status=" +response.id
            +"&name=" + response.name);
    });
}

