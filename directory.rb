def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each_with_index do |name, index|
    puts (index + 1).to_s + ". #{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_by_letter (names, letter)
  names.each_with_index do |name, index|
    if name[:name].start_with?(letter)
      puts (index + 1).to_s + ". #{name[:name]} (#{name[:cohort]} cohort)"
    end
  end
end

def print_by_length (names)
  names.each_with_index do |name, index|
    if name[:name].length < 12
      puts (index + 1).to_s + ". #{name[:name]} (#{name[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def input_letter
  puts "select the initial letter you'd like to return"
  letter = gets.chomp
  letter
end


students = input_students
print_header
print_by_length(students)
#letter = input_letter
#print_by_letter(students, letter)
print_footer(students)
