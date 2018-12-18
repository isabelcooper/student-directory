def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  linewidth = 30
  names.each_with_index do |name, index|
    left = (index + 1).to_s + ". #{name[:name]}"
    right = "(#{name[:cohort]} cohort, born in #{name[:country_of_birth]})"
    puts left.ljust(linewidth) + right.rjust(linewidth)
  end
end

=begin
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

def input_letter
  puts "select the initial letter you'd like to return"
  letter = gets.chomp
  letter
end
=end

def input_students
  puts "Please enter the names & details of the students"
  puts "To finish, hit enter twice"
  students = []
  name = "temp"
  cohort = "temp"
  country = "temp"
  while (!name.empty? && !cohort.empty?) do
    puts "Name:"
    name = gets.chomp
    puts "Cohort:"
    cohort = gets.chomp
    puts "Country:"
    country = gets.chomp
    students << {name: name, cohort: cohort, country_of_birth: country}
    puts "Now we have #{students.count} students"
  end
  students
end


def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

students = input_students
print_header
print(students)
#letter = input_letter
#print_by_letter(students, letter)
#print_by_length(students)
print_footer(students)
