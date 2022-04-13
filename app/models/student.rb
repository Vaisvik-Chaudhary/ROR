class ValidatorClass < ActiveModel::Validator
    def validation(record)
        if record.first_name == "Tom Cruise"
            record.errors.add :first_name, "can not be full name."
        end
    end 
end


class Student < ApplicationRecord
    has_many :blogs
    has_and_belongs_to_many :courses
    has_many :student_projects
    has_many :projects, through: :student_projects
    validates :first_name, :last_name, :email, :date_of_birth, :address, :contact, presence: true

    # validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    validates :first_name, :last_name, length: {in: (3..25)}
    validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed"}
    
    class Student
    include ActiveModel::Validations
    validates_with ValidatorClass
    end
    validates_each :first_name do |record, attr, value|
        record.errors.add(attr,'must start with upper case') if value =~/\A[[:lower]]/
    end

    before_validation :login_check
    after_validation :add_last_name
    before_create :display_greetings
    before_update :update_display_greetings
    after_create :create_student_age
    after_update :update_student_age
   

    private

    def login_check
        if first_name.nil?
            puts "Please enter the first name"
        end
               
        if email.nil?
          puts "Please enter the email"
        end
    end

    def add_last_name
        self.last_name = "#{last_name}"
    end

    def display_greetings
        puts "Hello, You executed before create callback!"
    end

    def update_display_greetings
        puts "Hello, You executed before update callback!"
    end
    
    def create_student_age
        if self.date_of_birth.present?
            age = Date.today.year - self.date_of_birth.year
            puts "===== Age of the student is #{age} ====="
        else 
            puts "===== Age can't be calculated without date_of_birth ====="
        end
    end

    def update_student_age
        puts "This is called after student age updated"
    end
end
    
   