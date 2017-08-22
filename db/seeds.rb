# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# SEED ADMIN
date = Time.now.ago(300000)
user = User.new(
  is_admin: true,
  first_name: "admin",
  last_name: "admin", 
  email: "admin@admin.admin",
  password: "adminadmin",
  username: "admin",
  created_at: date)
if user.save
  puts "ADMIN created!"
else
  puts user.errors.messages
end

# SEED ONE TEACHER
date = Time.now.ago(300000)
teacher = Teacher.new(
  first_name: 'Teacher',
  last_name: 'McTeacherface', 
  email: 'teacher@teacher.face',
  password: "password",
  username: '10001',
  created_at: date)
if teacher.save
  puts "Teacher SAMPLE created!"
else
  puts teacher.errors.messages
end
  
# SEED 14 OTHER TEACHERS
(2..15).each do |i|
  date          = Time.now.ago(300000)
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  username      = Time.now.strftime("%y") + (Teacher.count+1).to_s.rjust(3, '0')
  teacher = Teacher.new(
    first_name: first_name,
    last_name: last_name, 
    email: email,
    password: "password",
    username: username,
    created_at: date)
  if teacher.save
    puts "Teacher #{i} created!"
  else
    puts teacher.errors.messages
  end
end

# SEED 10 BLOCK_CLASSES (assume the teacher exists)
(1..5).each do |i|
  block_class = BlockClass.new( name: "N#{i}", teacher_id: 2*i )
  if block_class.save
    puts "Block Class #{i} created!"
  else
    puts block_class.errors.messages
  end
end

# SEED 10 COURSES
(1..5).each do |i|
  name = Faker::Educator.course
  course = Course.new(name: name)
  if course.save
    puts "Course #{i} created!"
  else
    puts course.errors.messages
  end
end

# SEED ONE STUDENT
date = Time.now.ago(300000)
student = Student.new(
  block_class_id: 1,
  type: Student,
  first_name: 'Student',
  last_name: 'McStudentface', 
  email: 'student@student.face',
  course_id: 1,
  year_level: 1,
  password: "password",
  username: '100001',
  created_at: date)
if student.save
  puts "Student SAMPLE created!"
else
  puts student.errors.messages
end

# SEED 49 OTHER STUDENTS (assume the block exists)
(2..50).each do |i|
  date          = Time.now.ago(300000)
  first_name    = Faker::Name.first_name
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  username      = Time.now.strftime("%y") + (Student.count+1).to_s.rjust(4, '0')
  student = Student.new(
    type: Student,
    is_admin: false,
    first_name: first_name,
    last_name: last_name, 
    email: email,
    course_id: (i%5 + 1),
    block_class_id: (i%5 + 1),
    year_level: (i%4 + 1),
    password: "password",
    username: username,
    created_at: date)
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

# SEED 3 LECTURES per SUBJECT
(1..9).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph(1, true, 3)
  subject_id = i
  lecture = Lecture.new(
    title:      "Lecture: #{title}",
    content:    content,
    subject_id: subject_id)
  if lecture.save
    puts "Lecture #{i} created!"
  else
    puts lecture.errors.messages
  end
end

(10..18).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph(1, true, 3)
  subject_id = i-9
  lecture = Lecture.new(
    title:      "Lecture: #{title}",
    content:    content,
    subject_id: subject_id)
  if lecture.save
    puts "Lecture #{i} created!"
  else
    puts lecture.errors.messages
  end
end

(19..27).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph(1, true, 3)
  subject_id = i-18
  lecture = Lecture.new(
    title:      "Lecture: #{title}",
    content:    content,
    subject_id: subject_id)
  if lecture.save
    puts "Lecture #{i} created!"
  else
    puts lecture.errors.messages
  end
end

# SEED 3 ASSIGNMENTS per SUBJECT
(1..9).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph(1, true, 3)
  subject_id = i
  assignment = Assignment.new(
    title:      "Assignment: #{title}",
    content:    content,
    subject_id: subject_id)
  if assignment.save
    puts "Assignment #{i} created!"
  else
    puts assignment.errors.messages
  end
end

(10..18).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph(1, true, 3)
  subject_id = i-9
  assignment = Assignment.new(
    title:      "Assignment: #{title}",
    content:    content,
    subject_id: subject_id)
  if assignment.save
    puts "Assignment #{i} created!"
  else
    puts assignment.errors.messages
  end
end

(19..27).each do |i|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph(1, true, 3)
  subject_id = i-18
  assignment = Assignment.new(
    title:      "Assignment: #{title}",
    content:    content,
    subject_id: subject_id)
  if assignment.save
    puts "Assignment #{i} created!"
  else
    puts assignment.errors.messages
  end
end

# SEED 2 COMMENTS per LECTURE
(1..27).each do |i|
  lecture_id = i
  user_id = i
  content = Faker::Lorem.paragraph(1, true, 3)
  comment = Comment.new(
    lecture_id: lecture_id,
    user_id: user_id,
    content: content)
  if comment.save
    puts "Comment #{i} created!"
  else
    puts comment.errors.messages
  end
end

(28..54).each do |i|
  lecture_id = i-27
  user_id = i-27
  content = Faker::Lorem.paragraph(1, true, 3)
  comment = Comment.new(
    lecture_id: lecture_id,
    user_id: user_id,
    content: content)
  if comment.save
    puts "Comment #{i} created!"
  else
    puts comment.errors.messages
  end
end

# SEED 2 COMMENTS per ASSIGNMENT
(55..81).each do |i|
  assignment_id = i-54
  user_id = i-54
  content = Faker::Lorem.paragraph(1, true, 3)
  comment = Comment.new(
    assignment_id: assignment_id,
    user_id: user_id,
    content: content)
  if comment.save
    puts "Comment #{i} created!"
  else
    puts comment.errors.messages
  end
end

(82..109).each do |i|
  assignment_id = i-108
  user_id = i-81
  content = Faker::Lorem.paragraph(1, true, 3)
  comment = Comment.new(
    assignment_id: assignment_id,
    user_id: user_id,
    content: content)
  if comment.save
    puts "Comment #{i} created!"
  else
    puts comment.errors.messages
  end
end

# SEED 2 EXAM_SCHEDULES per SUBJECT (Generate EXAMS thru model)
(1..9).each do |i|
  title = Faker::Lorem.word
  content = Faker::Lorem.paragraph(1, true, 3)
  remarks = Faker::Lorem.paragraph(1, true, 0)
  exam_schedule = ExamSchedule.new(
    title: title,
    content: content,
    remarks: remarks,
    subject_id: i,
    date: Time.now.advance(days: 15),
    max_score: 100)
  if exam_schedule.save
    puts "Exam Schedule #{i} created!"
  else
    puts exam_schedule.errors.messages
  end
end

(10..18).each do |i|
  title = Faker::Lorem.word
  content = Faker::Lorem.paragraph(1, true, 3)
  remarks = Faker::Lorem.paragraph(1, true, 0)
  exam_schedule = ExamSchedule.new(
    title: title,
    content: content,
    remarks: remarks,
    subject_id: i-9,
    date: Time.now.advance(days: 15),
    max_score: 100)
  if exam_schedule.save
    puts "Exam Schedule #{i} created!"
  else
    puts exam_schedule.errors.messages
  end
end

puts Time.now