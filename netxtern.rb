
ABS_URL = /https:\/\/[A-Za-z0-9]+\.com/
ABS_REL_PATH = /[A-Za-z0-9]+/
ALL_LINKS = /(https:\/\/[A-Za-z0-9]+\.com)|([A-Za-z0-9]+)/
BACK = /BACK/
COMMANDS = /BACK|FORWARD/

def set_browser_context(input)
	# extract str to modify it
	links = input.split("\n")
	# add commands to this array, ie: "REFRESH" or "STOP"
	commands = [ "BACK", "FORWARD"]
	# tracks the type of href links
	arr = []
	# logs the final URL the browser
	# visits after every operation
	browser_context = []
	links.each_with_index do |str, i|
		# absolute url			
		if str.match(ABS_URL)
			arr[0] = str			
			browser_context << arr[0]
		# absolute path
		elsif str[0] == "/"
			arr[1] = arr[0] + str					
			browser_context << arr[1]
		# commands such as "BACK" or "FORWARD"
		elsif commands.include?(str)
			p i
			back_clicks = 0
			i.downto(0) do |n|
				if links[n] == "BACK"
					back_clicks += 1				
				end
			end			
			if !links[i-1].match(COMMANDS)
				back_clicks = 1
			end
			browser_context << "#{browser_context[-2*back_clicks]} #{i}"		
		# relative paths
		else
			str.prepend("/")
			arr[2] = browser_context.last + str
			browser_context << arr[2]
		end
	end	
		puts browser_context
end

input = %q(https://google.com
/search
query
term/kittens
/calendar/today
BACK
BACK
BACK
FORWARD
FORWARD
FORWARD
events/mine
https://reddit.com
r/kittens
BACK
FORWARD
new
)

set_browser_context(input)



