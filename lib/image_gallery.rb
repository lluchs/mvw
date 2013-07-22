# Image gallery creation

# Returns the image gallery's year.
def gallery_year(gallery)
  gallery.identifier[8..11]
end

# Returns the thumbnail path for a given image item.
def thumbnail_path(image)
  image.path.sub %r#/(?=[^/]+$)#, '/thumbs/'
end
