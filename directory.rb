student_count = 11
# put all students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# then print them
puts "The Students of Villains Academy"
puts "--------------------------------"
students.each { |s| puts s }
# finally, we print the total
puts "Overall, we have #{students.count} great students"