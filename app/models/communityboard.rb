class Communityboard 


CB_INFO =   {
    	"1" => {   
    		   agendas: "http://www.nyc.gov/html/bxcb1/html/agenda_minutes/agenda.shtml",
    		   minutes: "http://www.nyc.gov/html/bxcb1/html/agenda_minutes/minutes.shtml",
    		   telephone: "(718) 585-7117",
			   fax: "(718) 292-0558",
			   email: "brxcb1@optonline.net",
               office_hours: "9:00 AM to 5:00 PM",
               address: "3024 Third Avenue <br>New York 10455",
               pdf_path: "http://www.nyc.gov/html/bxcb1/"
            },

    	"4" => {   
    		   agendas: "http://www.nyc.gov/html/bxcb4/html/meetings/agendas.shtml",
    		   minutes: "http://www.nyc.gov/html/bxcb4/html/meetings/minutes.shtml",
    		   telephone: "(718) 884-3959",
			   fax: "(718) 796-2763",
			   email: "bx08@cb.nyc.gov",
               office_hours: "9:00 am to 5:00 pm",
               address: "5676 Riverdale Avenue, Suite 100 <br>New York 10471-2194",
               pdf_path: "http://www.nyc.gov/html/bxcb4/"
    		},

    	"8" => {  
    		   agendas: "http://www.nyc.gov/html/bxcb8/html/board/agendas.shtml",
    		   minutes: "http://www.nyc.gov/html/bxcb8/html/board/minutes.shtml",
    		   telephone: "(718) 299-0800",
			   fax: "(718) 294-7870",
			   email: "bx08@cb.nyc.gov",
               office_hours: "9:00 am to 5:00 pm",
               address: "1650 Selwyn Avenue, Suite 11A <br>New York 10457",
               pdf_path: "http://www.nyc.gov/html/bxcb8/"
    		}
    	}
    	

  def link_arr(cb, info, key)
  	results = []
  	valid = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "201"]
    url = open(info[key]).read
    page = Nokogiri::HTML(url)

	links = page.css('#main_content a').map do |link| 
		unless link.text.include? "Adobe"
			title = link.text.split().map {|w| w if valid.include? w[0..2]}.compact.join(" ")
	    	results << {title: title, url: link.attribute("href").value.gsub("../../", info[:pdf_path])}
		end
	end
	results
  end

  def create_board(cb, info)
  	agenda_links = "" 
    minute_links = ""
  	link_arr(cb, info, :agendas)[0..4].each do |elem|
  		agenda_links << "<li class='agenda-link'><a href='#{elem[:url]}' target='_blank'>#{elem[:title]}</a></li>"
	end

  	link_arr(cb, info, :minutes)[0..4].each do |elem|
  		minute_links << "<li class='min-link'><a href='#{elem[:url]}' target='_blank'>#{elem[:title]}</a></li>"
	end

  	html = "<div id='cb-#{cb}' class='cb-board'>
  				<div class='cb-title'>Community Board #{cb}</div>
  				<div class='cb-address-contact'>
	  				<div class='cb-address'>
	  					<div class='cb-address-title'>Address:</div>
	  					<div class='cb-address-text'>#{info[:address]}</div>
	  				</div>
	  				<div class='cb-contact'>
	  					<ul>
	  						<li>#{info[:telephone]}</li>
	  						<li>#{info[:fax]}</li>
	  						<li>#{info[:email]}</li>
	  					</ul>
	  				</div>
	  			</div>
  				<div class='cb-agendas-minutes'>
	  				<div class='cb-agendas'>
		  				<div class='cb-agendas-title'>Agendas</div>
	  					<ul class='cb-agendas-links'>
	  						#{agenda_links}
	  					</ul>
		  			</div>
		  			<div class='cb-minutes'>
		  				<div class='cb-minutes-title'>Minutes</div>
	  					<ul class='cb-minutes-links'>
	  						#{minute_links}
	  					</ul>
		  		    </div>
	  		    </div>
	  		

		  		<form id='cb-contact' action='#' method='post'>
		  		<label>Name</label><br>
		  		<input type='text' ></input><br>
		  		<label>Message</label><br>
		  		<textarea></textarea><br>
		  		<input type='submit' value='Submit'>
		  		</form>

	  		</div>
	  		"

  end

  def boards
    all_boards = "" 
  	CB_INFO.each_pair do |cb, info|
  		all_boards << create_board(cb, info)
  	end
  	all_boards
  end




end