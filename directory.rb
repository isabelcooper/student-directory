@students = []

def interactive_menu
  loop do
    print_menu
    process
  end
end

def process
  selection = gets.chomp
  case selection.to_i
  when 1
    input_students
  when 2
    show_students
  when 3
    save_students
  when 4
    load_students
  when 9
    exit
  else
    puts "Sorry, I don't recognise that option, please try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  if @students.count > 1
    print_students_list
  end
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  linewidth = 30
  @students.each_with_index do |student, index|
    left = (index + 1).to_s + ". #{student[:name]}"
    right = "(#{student[:cohort]} cohort, born in #{student[:country_of_birth]})"
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
    @students << {name: name, cohort: cohort, country_of_birth: country}
    puts "Now we have #{@students.count} students"
    break if ( country.empty? || cohort.empty? )
  end
end

def save_students
  #open the file in writing mode
  file = File.open("students.csv", "w")
  #iterate over array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country_of_birth]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, country_of_birth = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth}
  end
  file.close
end

def print_footer
  if @students.count != 1
    puts "Overall we have #{@students.count} great students"
  else
    puts "Overall we have #{@students.count} great student"
  end
end

interactive_menu

#letter = input_letter
#print_by_letter(students, letter)
#print_by_length(students)
