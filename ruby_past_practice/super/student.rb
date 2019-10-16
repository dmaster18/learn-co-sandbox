require_relative 'super/user.rb'

class Student < User
  def log_in
    super
    @in_class = true
  end
end