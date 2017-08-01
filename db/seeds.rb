# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# SEED ADMIN
user = User.new( 
  type: Teacher,
  is_admin: true,
  first_name: "admin",
  last_name: "admin", 
  email: "admin@admin.admin",
  password: "adminadmin",
  username: "admin")
if user.save
  puts "ADMIN created!"
else
  puts user.errors.messages
end

# SEED 5 TEACHERS (generate advisory thru model)
(1..5).each do |i|
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  username      = "teacher#{i}"
  teacher = Teacher.new(
    first_name: first_name,
    last_name: last_name, 
    email: email,
    password: "password",
    username: username)
  if teacher.save
    puts "Teacher #{i} created!"
  else
    puts teacher.errors.messages
  end
end

# SEED 5 TEACHER-TYPE USERS (generate advisory thru model)
(6..10).each do |i|
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  username      = "teacher#{i}"
  user = User.new(
    type: Teacher,
    first_name: first_name,
    last_name: last_name, 
    email: email,
    password: "password",
    username: username)
  if user.save
    puts "Teacher (type) #{i} created!"
  else
    puts teacher.errors.messages
  end
end

# SEED 3 BLOCK_CLASSES (assume the teacher and advisory exists)
block_class = BlockClass.new( name: "N", advisory_id: 1)
if block_class.save
  puts "Block Class N1 created!"
else
  puts block_class.errors.messages
end

block_class = BlockClass.new( name: "N1", advisory_id: 2)
if block_class.save
  puts "Block Class N1 created!"
else
  puts block_class.errors.messages
end

block_class = BlockClass.new( name: "A", advisory_id: 3)
if block_class.save
  puts "Block Class A created!"
else
  puts block_class.errors.messages
end

# SEED 5 STUDENTS (assume the block exists)
(1..5).each do |i|
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  course        = Faker::Educator.course
  username      = "student#{i}"
  student = Student.new(
    block_class_id: 1,
    type: Student,
    is_admin: false,
    first_name: first_name,
    last_name: last_name, 
    email: email,
    course: course,
    year_level: (i%4 + 1),
    password: "password",
    username: username)
  if student.save
    puts "Student #{i} created!"
  else
    puts student.errors.messages
  end
end

# SEED 5 STUDENT-TYPE USERS (assume the block exists)
(6..10).each do |i|
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  course        = Faker::Educator.course
  username      = "student#{i}"
  user = User.new(
    block_class_id: 1,
    type: Student,
    is_admin: false,
    first_name: first_name,
    last_name: last_name, 
    email: email,
    course: course,
    year_level: (i%4 + 1),
    password: "password",
    username: username)
  if user.save
    puts "Student (type) #{i} created!"
  else
    puts user.errors.messages
  end
end

# SEED 3 SUBJECTS
subject = Subject.new(
  name: "CS21")
if subject.save
  puts "Subject CS21 created!"
else
  puts subject.errors.messages
end

subject = Subject.new(
  name: "Ma18")
if subject.save
  puts "Subject Ma18 created!"
else
  puts subject.errors.messages
end

subject = Subject.new(
  name: "En12")
if subject.save
  puts "Subject En12 created!"
else
  puts subject.errors.messages
end