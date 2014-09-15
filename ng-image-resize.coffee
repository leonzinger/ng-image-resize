app.directive "imageResize",["$parse", ($parse) ->
  link: (scope,elm,attrs) ->
    imagePercent = $parse(attrs.imagePercent)(scope)
    elm.one "load", ->
      neededHeight = elm[0].height*imagePercent/100
      neededWidth = elm[0].width*imagePercent/100
      canvas = document.createElement "canvas"
      canvas.width = neededWidth
      canvas.height = neededHeight
      ctx = canvas.getContext "2d"
      ctx.drawImage elm[0],0,0,neededWidth,neededHeight
      elm.attr 'src',canvas.toDataURL "image/jpeg"
]
