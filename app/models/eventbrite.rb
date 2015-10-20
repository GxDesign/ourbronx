class Eventbrite
  require 'json'
  require 'open-uri'
  require 'nokogiri'
  require 'pry'

  def create_event_stream
    url = "https://www.eventbrite.com/d/ny--bronx/bronx/?crt=regular&slat=40.837&slng=-73.8654&sort=best&view=list"
    events_url = open(url).read
    eventbrite = Nokogiri::HTML(events_url)

    events = eventbrite.css(".js-event-list-container").to_s
    
    events
  end
end