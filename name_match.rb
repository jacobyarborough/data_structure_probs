def name_match(name_names, submitted_name)
  submitted_name_array = submitted_name.split(" ")
  # binding.pry
  name_names.each do |name|
    name = name.split(" ")
    if name.length == 3 && submitted_name_array.length == 3
      # both alias and submitted_name have first, middle, and last
      puts true if name[0] == submitted_name_array[0] && name[1] == submitted_name_array[1] && name[2] == submitted_name_array[2]
      puts true if name[0] == submitted_name_array[1] && name[1] == submitted_name_array[0] && name[2] == submitted_name_array[2]
      if name[1].length == 1 || submitted_name_array[1].length == 1
        puts true if name[0] == submitted_name_array[0] && name[1][0] == submitted_name_array[1][0] && name[2] == submitted_name_array[2]
        puts true if name[0][0] == submitted_name_array[1][0] && name[1] == submitted_name_array[0] && name[2] == submitted_name_array[2]
      end
    elsif name.length == 3 && submitted_name_array.length == 2 
      # alias has first, middle, and last, but submitted name only has first and last
      puts true if name[0] == submitted_name_array[0] && name[2] == submitted_name_array[1]
      puts true if name[1] == submitted_name_array[0] && name[2] == submitted_name_array[1]
    elsif name.length == 2 && submitted_name_array.length == 3
      # alias has only first and last, but submitted name has first. middle, and last
      puts true if name[0] == submitted_name_array[0] && name[1] == submitted_name_array[2]
    elsif name.length == 2 && submitted_name_array.length == 2 
      # both alias and submitted_name have first and last
      puts true if name[0] == submitted_name_array[0] && name[1] == submitted_name_array[2]
    end 
  end  
end 