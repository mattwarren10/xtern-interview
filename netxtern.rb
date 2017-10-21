


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
	routes = arr[0]
	abs_url_indices = arr[1]
	arr = []
	routes.each_with_index do |str, i|
		if abs_url_indices.include?(i)
			arr << str			
		else
			# add new commands to this array, ie: "REFRESH", "STOP"
			commands = [ "BACK", "FORWARD" ]			
			if str == ""				
				next
			elsif commands.include?(str)
			else
				str[0] != "/" ? str.prepend("/") : str
				abs_url_indices.each do |num|						
					if i > num
						str = routes[num] + str		
					end
				end				
				arr << str
			end
		end
	end
	puts arr
end



input = %q(
https://google.com
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