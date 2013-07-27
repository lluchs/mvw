# Rückblick - Presse Verbindung

# Tries to find media items (i.e. pictures) for the given retrospect item.
def get_media_items_for(retro_item)
  # Get the identifier starting at the year, excluding the trailing slash.
  id = retro_item.identifier[12..-2]
  # Find all relevant media items.
  items.select { |i| i.identifier.start_with? "/presse/#{id}" }
end
