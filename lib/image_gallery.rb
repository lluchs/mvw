# Image gallery creation

# Returns the image gallery's year.
def gallery_year(gallery)
  gallery.identifier[8..11]
end

# Returns the thumbnail path for a given image item.
def thumbnail_path(image)
  image.path.sub %r#/(?=[^/]+$)#, '/thumbs/'
end

# Returns a gallery image by name for the given gallery.
def gallery_image(gallery, filename)
  gallery.children.find { |img| img.identifier.end_with? "/#{filename}/" }
end
