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

def input_students
  puts "Please enter the cohort then the names of the students"
  puts "To finish, just hit return twice"
  cohort = gets.chomp
  name = gets.chomp
  
  while !name.empty? do
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
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
  puts "3. Save the list"
  puts "9. Exit"
end 

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else 
      puts "I don't know what that means, please try again."
  end
end 

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end 

interactive_menu