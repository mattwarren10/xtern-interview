


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
	arr = convert(input)
	links = arr[0]	
	abs_url_indices = arr[1]
	arr = []	
	links.each_with_index do |str, i|
		commands = [ "BACK", "FORWARD"]
		p "#{i}: #{str}"
		if abs_url_indices.include?(i)
			abs = str
			arr << str
		elsif commands.include?(str)
			arr << str
		else
			str[0] != "/" ? str.prepend("/") : str			
			arr << str
		end
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