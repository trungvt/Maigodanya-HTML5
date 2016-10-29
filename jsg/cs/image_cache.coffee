jsg.imageCache = {}

# Loaded images are cached to save memory
jsg.loadImage = (src, onload, onerror) ->
  img = @imageCache[src]
  if img?
    jsg.setTimeout((=> onload(img)), 100) if onload?
    return img

  img = new Image
  @imageCache[src] = img

  img.onload = (event) =>
    #i = event.target
    #d = i.width * i.height * 4
    #@imageUsedMem ?= 0
    #@imageUsedMem += d
    #console.log("Memory used by images: #{d}/#{@imageUsedMem} #{src}")

    onload(event) if onload?

  if onerror?       
    img.onerror = (event) =>
      onerror(event) 

  img.src = src
  img

jsg.freeImage = (src) ->
  img = @imageCache[src]
  if img?
    #d              = img.width * img.height * 4
    #@imageUsedMem -= d
    #console.log("Memory used by images: -#{d}/#{@imageUsedMem} #{src}")
    delete @images[src]
