@students = []

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student
  end 
  file.close
end 

def try_load_students(filename = "students.csv")
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end 
end 

def add_student
  @students << {name: name, cohort: cohort.to_sym}
end 

def input_students
  puts "Please enter the cohort then the names of the students"
  puts "To finish, just hit return twice"
  cohort = STDIN.gets.chomp
  name = STDIN.gets.chomp
  
  while !name.empty? do
    add_student
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end 
  
end 

def print_header
  puts "The Students of Villains Academy"
  puts "--------------------------------"
end

def print_students_list
  
  if !@students.empty?
    
    @students.each_with_index do |name, index| 
    i = index += 1
    puts "#{i} #{name[:name]} (#{name[:cohort]} cohort)" 
    end 
    
  else
    puts "Please enter some students"
  end 
  
end 

def print_footer
  puts "Overall, we have #{@students.count} great students"
end 

def show_students
  print_header
  print_students_list
  print_footer
end 

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load the list of students"
  puts "9. Exit"
end 

def process(selection)
  case selection
    when "1"
      puts "INPUT STUDENTS SELECTED"
      input_students
    when "2"
      puts "SHOW STUDENTS SELECTED"
      show_students
    when "3"
      save_students
      puts "STUDENT LIST SAVED"
    when "4"
      load_students
      "STUDENT LIST LOADED"
    when "9"
      exit
    else 
      puts "I don't know what that means, please try again."
  end
end 

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end 

interactive_menu