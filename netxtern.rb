
commands = [ "BACK", "FORWARD" ]

abs_rel_path = /[A-Za-z0-9]+/

def convert(input)
	abs_url = /https:\/\/[A-Za-z0-9]+\.com/
	arr = input.split("\n")
	abs_url_indices = []
	arr.each_with_index do |str, i|
		if str.match(abs_url)
			abs_url_indices << i			
		end		
	end
	[arr, abs_url_indices]
end

def output(arr)
	routes = arr[0]
	indices = arr[1]
	arr = []
	routes.each_with_index do |str, i|
		
	end
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

convert(input)