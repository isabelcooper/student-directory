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

def list_cohorts(students)
#  students.group_by{ |cohort| cohort[students[:cohort]] }
  by_cohort = {}
  list =[]
  students.map do |student|
    list.select {|cohort_name| student[:cohort] != cohort_name}
      by_cohort = {
        :cohort => student[:cohort],
        :student => [student[:name], student[:country_of_birth]]
      }
    end
    list.select {|cohort_name| student[:cohort] == cohort_name}
      by_cohort[:student] = [student[:name], student[:country_of_birth]]]
        row << {name: student[:name], country_of_birth: student[:country]}
      end
    end
  end
end

def print_by_cohort(names)
  puts "Select cohort"
  search_cohort = gets.chomp.downcase
end

def regroup(students, by, at)
  regroup = students.group_by {|namehash| namehash[by] }.map { |k,v| [ k, v.map { |h|h[at]} ] }.to_h
end

def print_by_cohort(names)
  linewidth = 30
  names.each_with_index do |name, index|
    left = (index + 1).to_s + ". #{name[:name]}"
    right = "(#{name[:cohort]} cohort, born in #{name[:country_of_birth]})"
    puts left.ljust(linewidth) + right.rjust(linewidth)
  end
end

=begin
def group(list, by, at)
  list.group_by { |h| h[by] }.map { |k,v| [ k , v.map {|h| h[at]} ] }.to_h
end

sample =[
  {:type=>"Meat",  :name=>"one",  :size=>"big"   },
  {:type=>"Meat",  :name=>"two",  :size=>"small" },
  {:type=>"Fruit", :name=>"four", :size=>"small" }
]

group(sample, :type, :name) # => {"Meat"=>["one", "two"], "Fruit"=>["four"]}
group(sample, :size, :name) # => {"big"=>["one"], "small"=>["two", "four"]}
=end
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
  puts "Enter the names & details of the students"
  puts "To finish, hit enter twice"
  students = []
  name = "temp"
  cohort = "temp"
  country = "temp"
  while !name.empty? do
    puts "Name:"
    name = gets.tr("\n", "")
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
  if names.count > 1
    puts "Overall we have #{names.count} great students"
  else
    puts "Overall we have #{names.count} great student"
  end
end

students = input_students
#students_by_cohort = regroup(students, :cohort, :name)
print_header
puts students
test = list_cohorts(students)
puts test
#print_by_cohort(students_by_cohort)

#letter = input_letter
#print_by_letter(students, letter)
#print_by_length(students)
print_footer(students)

 #print them grouped by cohorts.
 #To do this, you'll need to get a list of all existing cohorts
 #(the map() method may be useful but it's not the only option),
 # iterate over it and only print the students from that cohort.


 #1. print list of cohorts. select which, print whats within that.
 #2. if cohort appears empty, add unknown
 #2. main menu for selecting move?
