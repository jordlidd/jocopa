json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :host, :description, :location, :price
  json.url listing_url(listing, format: :json)
end
