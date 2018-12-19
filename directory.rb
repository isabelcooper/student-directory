def interactive_menu
  students = []
  loop do
    #give user options
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #retrieve selection
    selection = gets.chomp
    #action
    case selection.to_i
    when 1
      students = input_students
    when 2
      print_header
      if students.count > 1
        print(students)
      end
      print_footer(students)
    when 9
      exit
    else
      puts "Sorry, I don't recognise that option, please try again"
    end
  end
end

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

def print_by_length (names)
  names.each_with_index do |name, index|
    if name[:name].length < 12
      puts (index + 1).to_s + ". #{name[:name]} (#{name[:cohort]} cohort)"
    end
  end
end

def print_by_letter (names, letter)
  names.each_with_index do |name, index|
    if name[:name].start_with?(letter)
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
  puts "Enter the names & details of the students"
  puts "To finish, hit enter twice"
  students = []
  name = "temp"
  cohort = "temp"
  country = "temp"
  while !name.empty? do
    puts "Name:"
    name = gets.tr("\n", "")
    break if name.empty?
    puts name
    puts "Cohort:"
    cohort = gets.tr("\n", "")
    puts "Country:"
    country = gets.tr("\n", "")
    students << {name: name, cohort: cohort, country_of_birth: country}
    puts "Now we have #{students.count} students"
    break if ( country.empty? || cohort.empty? )
  end
  students
end

def print_footer(names)
  if names.count != 1
    puts "Overall we have #{names.count} great students"
  else
    puts "Overall we have #{names.count} great student"
  end
end

interactive_menu

#letter = input_letter
#print_by_letter(students, letter)
#print_by_length(students)
