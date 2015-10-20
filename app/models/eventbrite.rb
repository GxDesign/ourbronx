class Eventbrite
  require 'json'
  require 'open-uri'
  require 'nokogiri'
  require 'pry'

  def create_event_hash
    url = "https://www.eventbrite.com/d/ny--bronx/bronx/?crt=regular&slat=40.837&slng=-73.8654&sort=best&view=list"
    events_url = open(url).read
    eventbrite = Nokogiri::HTML(events_url)

    events = eventbrite.css(".js-event-list-container").to_s
    
    # .each do |project|
    #   title = project.css("h2.bbcard_name strong a").text
    #   projects[title] = {
    #     :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
    #     :description => project.css("p.bbcard_blurb").text,
    #     :location => project.css("ul.project-meta span.location-name").text,
    #     :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    #   }
    # end

    # return the projects hash
    events
  end
end