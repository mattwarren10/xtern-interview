
ABS_URL = /https:\/\/[A-Za-z0-9]+\.com/

def set_browser_context(input)
	# extract str to modify it
	links = input.split("\n")
	# add commands to this array, ie: "REFRESH" or "STOP"
	commands = [ "BACK", "FORWARD"]
	# tracks the type of href links by
	# collecting each current abs url, abs path, rel path
	current_href_links = {}
	# logs each URL the browser
	# visits after every operation
	browser_context = []
	# iterate through the links to categorize them
	links.each_with_index do |str, i|			
		# absolute url			
		if str.match(ABS_URL)
			current_href_links[:abs_url] = str			
			browser_context << current_href_links[:abs_url]			
		# absolute path
		elsif str[0] == "/"
			current_href_links[:abs_path] = current_href_links[:abs_url] + str					
			browser_context << current_href_links[:abs_path]			
		# commands such as "BACK" or "FORWARD"
		elsif commands.include?(str)
			back_clicks = 0
			forward_clicks = 0
			# collect the amount of BACK and
			# FORWARD clicks in the log
			0.upto(i) do |n|
				if links[n] == "BACK"
					back_clicks += 1
				elsif links[n] == "FORWARD"
					forward_clicks += 1					
				end
			end
			# log the BACK or FORWARD operation
			if str == "BACK"
				browser_context << browser_context[-2*back_clicks]
			else
				browser_context << browser_context[-2*forward_clicks]
			end
		# relative paths
		else
			str.prepend("/")
			current_href_links[:rel_path] = browser_context.last + str
			browser_context << current_href_links[:rel_path]			
		end
	end	
		puts browser_context
end

input = %q(https://google.com
/search
query
term/kittens
/calendar/today
events/mine
https://reddit.com
r/kittens
BACK
FORWARD
new
)

set_browser_context(input)



