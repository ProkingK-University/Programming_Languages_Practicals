class Employee
    attr_reader :earnings
  
    def initialize(base_salary = 20000.00)
      @earnings = 0.0
      @base_salary = base_salary
      @base_salary_paid = false
    end
  
    def pay_employee
      return if @base_salary_paid
      @earnings += @base_salary
      @base_salary_paid = true
    end
  
    def new_month
      @base_salary_paid = false
    end
end
  

class Manager < Employee
    def initialize(bonus)
        super()
        @bonus = bonus
    end

    def pay_employee
        super
        @earnings += @bonus
    end
end

class Programmer < Employee
    def initialize(percentage)
        base_salary = 20000.00 * percentage
        super(base_salary)
    end
end

# Team class
class Team
    def initialize
        @members = []
    end

    def add_member(employee)
        raise "Team is at capacity" if @members.length >= 2
        @members << employee
    end

    def pay_team
        @members.each(&:pay_employee)
    end

    def new_month
        @members.each(&:new_month)
    end

    def print_earnings
        puts "Total Earnings:"
        @members.each do |member|
        puts "#{member.class}: #{member.earnings}"
    end
    end
end

manager = Manager.new(10000.00)
puts "Enter manager's information:"
manager_information = gets.chomp

frontend = Team.new
frontend.add_member(manager)

puts "Enter programmer's information for frontend:"
programmer_information = gets.chomp
ui_designer = Programmer.new(0.2)
frontend.add_member(ui_designer)

backend = Team.new
backend.add_member(manager)

puts "Enter programmer's information for backend:"
programmer_information = gets.chomp
backend_engineer = Programmer.new(0.6)
backend.add_member(backend_engineer)

loop do
    print "Pay teams? (Y/n): "
    choice = gets.chomp.downcase
    break if choice == 'n'

    frontend.pay_team
    backend.pay_team
    frontend.new_month
    backend.new_month
end

frontend.print_earnings
backend.print_earnings