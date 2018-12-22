require 'csv'
@students = []

def print_menu
  menu = ["1. Input the students","2. Show the students",
  "3. Save the list to students.csv","4. Load the list from students.csv",
  "5. Print source code","9. Exit"]
  puts menu
end

def interactive_menu
  loop do
    print_menu
    process
  end
end

def process
  selection = STDIN.gets.chomp
  case selection.to_i
  when 1
    input_students
    puts "Got them - don't forget to save to file if permanent version needed"
  when 2
    show_students
  when 3
    save_students
    puts "Students saved to file"
  when 4
    load_students("")
  when 5
    print_source_code
  when 9
    puts "Exiting program"
    exit
  else
    puts "Sorry, I don't recognise that option, please try again"
  end
end

def print_header
  puts "The students of Villains Academy \n-------------"
end

def print_footer
  summary = "Overall we have #{@students.count} great student"
  if @students.count != 1
    puts summary + "s"
  else
    puts summary
  end
end

def show_students
  print_header
  if @students.count > 1
    print_students_list
  end
  print_footer
end

def print_students_list
  linewidth = 30
  @students.each_with_index do |student, index|
    left = (index + 1).to_s + ". #{student[:name]}"
    right = "(#{student[:cohort]} cohort, born in #{student[:country]})"
    puts left.ljust(linewidth) + right.rjust(linewidth)
  end
end

def input_students
  puts "Enter the names & details of the students"
  puts "To finish, hit enter twice"
  name = "temp"
  cohort = "temp"
  country = "temp"
  while !name.empty? do
    puts "Name:"
    name = STDIN.gets.tr("\n", "")
    break if name.empty?
    puts name
    puts "Cohort:"
    cohort = STDIN.gets.tr("\n", "").to_sym
    puts "Country:"
    country = STDIN.gets.tr("\n", "")
    add_students_to_array(name, cohort, country)
    puts "Now we have #{@students.count} students"
    break if ( country.empty? || cohort.empty? )
  end
end

def save_students
  filename = enter_filename
  if File.exists?(filename)
    CSV.File.open(filename, "w") do |csv|
      @students.each do |student|
        csv << [student[:name], student[:cohort], student[:country]]
      end
    end
  else
    puts "Filename not recognised"
  end
end

def pre_load_students
  filename = ARGV.first || "students.csv"
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename)
  if filename.nil? || filename == ""
    filename = enter_filename
  end
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
        name, cohort, country = row
        add_students_to_array(name, cohort.to_sym, country)
      end
    puts "File loaded"
  else
    puts "Filename not recognised"
  end
end

def add_students_to_array(name, cohort, country)
  @students << {name: name, cohort: cohort, country: country}
end

def enter_filename
  puts "Enter filename"
  STDIN.gets.chomp
end

def print_source_code
  puts File.read(__FILE__)
end

pre_load_students
interactive_menu
