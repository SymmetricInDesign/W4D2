class Employee

    attr_reader :name, :title, :salary, :boss
    attr_writer :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        boss.add_sub(self) if boss != nil
    end

    def bonus(multiplier)
        bonus = (@salary) * multiplier
    end


end

class Manager < Employee

    attr_reader :subordinates

    def initialize(name, title, salary, boss=nil)
        super
        @subordinates = []
    end

    def bonus(multiplier)
        self.sum_sub_salaries * multiplier
    end

    def add_sub(employee)
        @subordinates << employee
    end

    def sum_sub_salaries

        sum = @subordinates.sum do |employee| 
            if employee.is_a? Manager
                employee.salary + employee.sum_sub_salaries
            else
                employee.salary
            end
        end
    end

end



ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "Manager", 78000, ned)
shawna = Employee.new('Shawna', "TA", 12000, darren)
david = Employee.new('david', "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000