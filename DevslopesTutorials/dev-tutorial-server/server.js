var express = require('express');
var bodyParser = require('body-parser');
var app = express();

// all intercepts all requests
app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [
  {
    id: 1,
    title: "Android Studio Tutorial For Beginners",
    description: "Learn how to install Android Studio and then go through this tutorial to build your very first app",
    iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/F-k5gwz_91o" frameborder="0" allowfullscreen></iframe>',
    thumbnail: "https://s3-us-west-2.amazonaws.com/devslopesvideo/androidwhite-learn.png"
  },
  {
    id: 2,
    title: "How to Support High Resolution on iOS - @1x @2x @3x",
    description: "Learn how to support multiple screen resolutions and devices such as iPhone 4, iPhone 5, iPhone 6, iPhone 6 Plus",
    thumbnail: "https://s3-us-west-2.amazonaws.com/devslopesvideo/ios-image-sizes.png",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/WOnczJSsMqk" frameborder="0" allowfullscreen></iframe></div>'
  }
];

app.get('/tutorials', function(req, res) {
  console.log("GET from server");
  res.send(tutorials);
});

app.listen(6069);
