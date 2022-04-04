class Student < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true

    before_create :display_greetings

    def display_greetings
        puts "Hello, You executed before create callback!"
    end
end
