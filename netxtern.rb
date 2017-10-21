


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
			arr << str
		elsif type == 1			
			str = arr.grep(ABS_URL)[0] + str
			arr << str
		elsif type == 2			
		else
			str.prepend("/")
			str = arr.last + str
			arr << str
		end
		browser_context = arr.join("")
	end
	puts arr	
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