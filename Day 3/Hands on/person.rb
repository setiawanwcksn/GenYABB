class Person
    attr_reader :name, :hitpoint, :attack_damage

    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage  
        @alive = true      
    end

    def attack(other_person)
        puts "#{@name} attack #{other_person.name} with #{@attack_damage} attack damage"
        other_person.take_damage(@attack_damage)
    end
    
    def print_stats
        puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end

    def healing(heal)
        @hitpoint += heal
    end
    def take_damage(damage)
        @hitpoint -= damage        
        if @hitpoint <= 0
            die
        end
    end
    def die    
        puts "#{@name} dies"
        @alive = true
    end    

    def die?
        !@alive
    end

    def remove?
        die?
    end
    
    def to_s
        puts "#{@name}"       
    end
end