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

# SEED 15 TEACHERS
(1..15).each do |i|
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

# SEED 5 BLOCK_CLASSES (assume the teacher exists)
(1..5).each do |i|
  block_class = BlockClass.new( name: "N#{i}", teacher_id: 2*i )
  if block_class.save
    puts "Block Class #{i} created!"
  else
    puts block_class.errors.messages
  end
end

# SEED 50 STUDENTS (assume the block exists)
(1..50).each do |i|
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  course        = Faker::Educator.course
  username      = "student#{i}"
  student = Student.new(
    block_class_id: i%5 + 1,
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

# SEED 9 SUBJECTS
(1..3).each do |i|
  subject = Subject.new(
    name: "CS2#{i}",
    teacher_id: i%15+1,
    block_class_ids: [1,3,5])
  if subject.save
    puts "Subject #{i} created!"
  else
    puts subject.errors.messages
  end
end

(4..6).each do |i|
  subject = Subject.new(
    name: "EN#{i}",
    teacher_id: i%15+1,
    block_class_ids: [2,4,5])
  if subject.save
    puts "Subject #{i} created!"
  else
    puts subject.errors.messages
  end
end

(7..9).each do |i|
  subject = Subject.new(
    name: "Lit#{i}",
    teacher_id: i%15+1,
    block_class_ids: [1,2,3,4,5])
  if subject.save
    puts "Subject #{i} created!"
  else
    puts subject.errors.messages
  end
end

# SEED 15 LECTURES
(1..5).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  subject_id = i
  lecture = Lecture.new(
    title:      title,
    content:    content,
    subject_id: subject_id)
  if lecture.save
    puts "Lecture #{i} created!"
  else
    puts lecture.errors.messages
  end
end

(6..10).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  subject_id = i-5
  lecture = Lecture.new(
    title:      title,
    content:    content,
    subject_id: subject_id)
  if lecture.save
    puts "Lecture #{i} created!"
  else
    puts lecture.errors.messages
  end
end

(11..15).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  subject_id = i-10
  lecture = Lecture.new(
    title:      title,
    content:    content,
    subject_id: subject_id)
  if lecture.save
    puts "Lecture #{i} created!"
  else
    puts lecture.errors.messages
  end
end