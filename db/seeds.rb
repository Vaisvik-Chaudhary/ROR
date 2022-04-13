# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

student = Student.create(
    first_name: "Rohit",
    last_name: "Sharma",
    email: "rohit@sharma.com"
)

20.times do |i|
    puts "Creating student #{i+1}"
    Student.create(
        first_name: "Student #{i+1}",
        last_name: "lnam #{i+1}",
        email: "student#{i+1}@boot.com"
    )
end

Student.all.each do |student|
    student.blogs.create(title: "Dummy Blog for student #{student.id}", content: "Custom content pending")
    student.blogs.create(title: "Dummy Blog for student #{student.id}", content: "Custom content pending")  
end

Course.create(name: "Ruby on Rails course", description: "pending")
Course.create(name: "Angular Js course", description: "pending")
Course.create(name: "Python course", description: "pending")
Course.create(name: "Java course", description: "pending")
Course.create(name: "Node Js course", description: "pending")