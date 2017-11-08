
module UserGroupReporting
  # we use a hash because it could be easier to 
  # access in the future.
  def self.create_group_types(arr)
    group_types = {}
    arr.each do |type|
      group_types[type] = [type]
    end
    group_types
  end
  
  def self.extract_users_and_groups(str)
    # just add to this array when adding more group types
    group_types = [ "admins", "students", "teachers" ]
    # this hash will initially have a value
    # of an array with the group type, ie: 'admins' in
    # the first postition. we will add the names to each value.
    unsorted_names = create_group_types(group_types)
    # parse the array to iterate and sort
    arr = str.split(" ")
    arr.each_with_index do |word, i|
      if i.even?
        group_types.each do |group_type|
          if word == group_type
            # if it's even, we want the word after it
            unsorted_names[group_type] << arr[i+1]
          end
        end
      else
        group_types.each do |group_type|
          if word == group_type
            # if it's odd, we want the word before it
            unsorted_names[group_type] << arr[i-1]
          end
        end
      end
    end
    unsorted_names
  end
  
  def self.sort_group_types(input)
  	h = extract_users_and_groups(input)  	  	
    h.each_value do |arr|
      # remove the first element to sort, ie: 'admins'
    	group_type = arr.shift
      arr.sort!
      # insert group type back at the first position
      arr.unshift(group_type)
    end
    h
  end

  def self.convert(input)
    h = sort_group_types(input)
    str = ""
    # compress array back into a multi-line string
    h.each_value do |arr|
      str += arr.join(",") + "\n"
    end
    str
  end  
end

input = %q(alan admins
beth students
charlie teachers
david admins
)


output = UserGroupReporting.convert(input)
puts output