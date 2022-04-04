class AddAttrsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :dob, :date
    add_column :students, :age, :integer 
    add_column :students, :address, :string
    add_column :students, :contact, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
