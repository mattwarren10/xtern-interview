
def processes(arr)
	started_processes = []
	arr.each do |process|
		if !started_processes.include?(process)
			started_processes << process
		else
			started_processes.delete(process)
		end
		if started_processes.empty?
			started_processes << 0
		end
	end
	puts started_processes
end


input = [ 
					36,
					47,
					58,
					47,
					36
				]

input2 = [
					12,
					23,
					34,
					34,
					12,
					23
				 ]

input3 = [
					84,
					34,
					99,
					99,
					98,
					103,
					103
				 ]


processes(input)
processes(input2)
processes(input3)