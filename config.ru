require "cuba"
require "open-uri"
require "nokogiri"

Cuba.define do
  on default do
    octocats_url = "http://feeds.feedburner.com/Octocats"

    open(octocats_url) do |feed|
      xml = Nokogiri::XML(feed.read)
      random_cat = xml.css("img").map { |img| img["src"] }.sample
      res.write random_cat
    end
  end
end

run Cuba
