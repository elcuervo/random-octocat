require "cuba"
require "open-uri"
require "nokogiri"

Cuba.define do
  on default do
    octocats_url = "http://feeds.feedburner.com/Octocats"

    open(octocats_url) do |feed|
      xml = Nokogiri::XML(feed.read)
      octocats = xml.css("entry content div a:first-child img").map { |img| img["src"] }
      random_cat = octocats.sample

      res.redirect random_cat
    end
  end
end

run Cuba
