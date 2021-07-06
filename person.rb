class Person
    attr_reader :name
    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def attack(other_person)    
        if deflects(other_person.name)            
            puts "#{other_person.name} deflects #{@name}'s damage" 
        else
            other_person.take_damage(@attack_damage)
            puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        end
        
    end

    def take_damage(damage)        
        @hitpoint -= damage            
    end
    
    def die?
        if @hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end
    def deflects(names)            
        attacked = [1,1,0,0,0,0,0,0,0,0]        
        if attacked[(rand(attacked.count))] == 1 && names == "Jin Sakai"
            return true
        end
    end
    def to_s
        puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} damage"
    end
end