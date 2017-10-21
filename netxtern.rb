


ABS_URL = /https:\/\/[A-Za-z0-9]+\.com/

def convert(input)
	arr = input.split("\n")
	abs_url_indices = []
	arr.each_with_index do |str, i|
		if str.match(ABS_URL)
			abs_url_indices << i			
		end		
	end
	[arr, abs_url_indices]
end

def output(input)
	commands = [ "BACK", "FORWARD"]
	arr = convert(input)
	links = arr[0]	
	abs_url_indices = arr[1]
	arr = []
	browser_context = []
	links.each_with_index do |str, i|					
		if str.match(ABS_URL)
			arr[0] = str			
			browser_context << arr[0]			
		elsif str[0] == "/"
			arr[1] = arr[0] + str
			# str = arr.grep(ABS_URL)[0] + str			
			browser_context << arr[1]
		elsif commands.include?(str)
			browser_context << browser_context[-2]			
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
events/mine
https://reddit.com
r/kittens
BACK
FORWARD
new
)


output(input)