


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

def type?(str)	
	commands = [ "BACK", "FORWARD"]
	if str.match(ABS_URL)
		type = 0
	elsif str[0] == "/"
		type = 1	
	elsif commands.include?(str)
		type = 2
	else
		type = 3
	end
	type
end

def output(input)
	arr = convert(input)
	links = arr[0]	
	abs_url_indices = arr[1]
	arr = []
	browser_context = []
	links.each_with_index do |str, i|
		type = type?(str)		
		# p "#{i}: #{str}"
		if type == 0
			arr[0] = str			
			browser_context << arr[0]			
		elsif type == 1			
			arr[1] = arr[0] + str
			# str = arr.grep(ABS_URL)[0] + str			
			browser_context << arr[1]
		elsif type == 2
			# str = arr.grep(ABS_URL)[0] + links[i-2]
			if str == "BACK"
				browser_context << browser_context[-2]
			elsif str == "FORWARD"
				browser_context << browser_context[-2]
			end			
		else
			str.prepend("/")
			p " >>>>"
			p browser_context
			p str
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