
module UserGroupReporting
  # creates a hash of group_types
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
    output_hash = create_group_types(group_types)
    arr = str.split(" ")
    arr.each_with_index do |word, i|
      if i.even?
        group_types.each do |group_type|
          if word == group_type
             output_hash[group_type] << arr[i+1]
          end
        end
      else
        group_types.each do |group_type|
          if word == group_type
             output_hash[group_type] << arr[i-1]
          end
        end
      end
    end
    output_hash
  end
  
  def self.sort_group_types(input)
  	h = extract_users_and_groups(input)  	  	
    h.each_value do |arr|
    	group_type = arr.shift
      arr.sort!
      arr.unshift(group_type)
    end
    h
  end 
end

input = %q(
  alan admins
  beth students
  charlie teachers
  matt admins
  zack teachers
  admins david
  teachers louis
  students debra
  caroline students
  mark teachers
)


output = UserGroupReporting.sort_group_types(input)
p output