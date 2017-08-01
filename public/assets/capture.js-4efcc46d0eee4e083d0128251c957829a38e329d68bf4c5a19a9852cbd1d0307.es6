(function() {
  // The width and height of the captured photo. We will set the
  // width to the value defined here, but the height will be
  // calculated based on the aspect ratio of the input stream.

  var width = 320    // We will scale the photo width to this
  var height = 0     // This will be computed based on the input stream

  // |streaming| indicates whether or not we're currently streaming
  // video from the camera. Obviously, we start at false.

  var streaming = false

  // The various HTML elements we need to configure or control. These
  // will be set by the startup() function.

  var video = null
  var canvas = null
  var photo = null
  var startbutton = null

  function startup() {
    video = document.getElementById('video')
    canvas = document.getElementById('canvas')
    photo = document.getElementById('photo')
    startbutton = document.getElementById('startbutton')

    navigator.getMedia = ( navigator.getUserMedia ||
                           navigator.webkitGetUserMedia ||
                           navigator.mozGetUserMedia ||
                           navigator.msGetUserMedia)

    navigator.getMedia(
      {
        video: true,
        audio: false
      },
      function(stream) {
        if (navigator.mozGetUserMedia) {
          video.mozSrcObject = stream
        } else {
          var vendorURL = window.URL || window.webkitURL
          video.src = vendorURL.createObjectURL(stream)
        }
        video.play()
      },
      function(err) {
        console.log("An error occured! " + err)
      }
    )

    video.addEventListener('canplay', function(ev){
      if (!streaming) {
        height = video.videoHeight / (video.videoWidth/width)
      
        // Firefox currently has a bug where the height can't be read from
        // the video, so we will make assumptions if this happens.
      
        if (isNaN(height)) {
          height = width / (4/3)
        }
      
        video.setAttribute('width', width)
        video.setAttribute('height', height)
        canvas.setAttribute('width', width)
        canvas.setAttribute('height', height)
        streaming = true
      }
    }, false)

    startbutton.addEventListener('click', function(ev){
      takepicture()
      ev.preventDefault()
    }, false)
    
    clearphoto()
  }

  // Fill the photo with an indication that none has been
  // captured.

  function clearphoto() {
    var context = canvas.getContext('2d')
    context.fillStyle = "#AAA"
    context.fillRect(0, 0, canvas.width, canvas.height)

    var data = canvas.toDataURL('image/png')
    photo.setAttribute('src', data)
  }
  
  // Capture a photo by fetching the current contents of the video
  // and drawing it into a canvas, then converting that to a PNG
  // format data URL. By drawing it on an offscreen canvas and then
  // drawing that to the screen, we can change its size and/or apply
  // other changes before drawing it.

  function takepicture() {
    var context = canvas.getContext('2d')
    if (width && height) {
      canvas.width = width
      canvas.height = height
      context.drawImage(video, 0, 0, width, height)
    debugger
      var data = canvas.toDataURL('image/png')
      photo.setAttribute('src', data)
      postToGvisionAPI(data)
    } else {
      clearphoto()
    }
  }
  
  function postToGvisionAPI(data) {
    const gvisionData = () => {
      {
        "requests": [
          {
            "image": {
              "content": `${data}`
            },
            "features": [
              {
                "type": "LABEL_DETECTION",
                "maxResults": 10,
              }
            ],
          }
        ]
      }
    }
    const google_key = ENV['GOOGLE_APPLICATION_CREDENTIALS']
    debugger
    return $.ajax({
      type: "POST",
      url: `https://vision.googleapis.com/v1/images:annotate?key=${google_key}`,
      data: gvisionData
    }).then(filterLabels(gvisionLabels))
      .then(plantFamily(filteredDescriptions))
      .then(postToHome(plantFamily))
  }
  
  function filterLabels(labels) {
    debugger
    const doNotInclude = [
      'Bud', 'Plant Stem', 'Computer Wallpaper', 'Spring',
      'Autumn', 'Winter', 'Summer', 'Sky', 'Blossom',
      'Flower', 'Wildflower', 'Flora', 'Flowering Plant',
      'Plant', 'Petal', 'Annual Plant', 'Perennial Plant',
      'Macro Photography', 'Close Up', 'Purple', 'Yellow',
      'Red', 'Orange', 'Yellow', 'Magenta', 'Pink', 'Blue',
      'Turquoise', 'Teal', 'Green', 'White', 'Brown'
    ]
    const labelDescriptions = labels['responses']['labelAnnotations'].map(function(label) {
      return label['description']
    })
    debugger
    return labelDescriptions.filter(function(description){
      return !doNotInclude.includes(description)
    })
  }
  
  function plantFamily(filteredDescriptions) {
    debugger
    return filteredDescriptions.filter(function(description) {
      return description.includes('Family')
    })
  }
  
  function postToHome(plantFamily) {
    debugger
    $('.output').prepend(plantFamily)
  }
    

  // Set up our event listener to run the startup process
  // once loading is complete.
  window.addEventListener('load', startup, false)
})()