require_relative 'person'

class Hero < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @deflect_percentage = 0.8
        @heal = 50
    end
    def take_damage(damage)
        if rand < @deflect_percentage
            deflect
        else
            super(damage)
        end
    end
    def deflect
        puts "#{@name} deflects the attack"
    end
    def heal(other_person)
        # puts "#{@name} heals #{other_person.name}, restoring #{@heal} hitpoint"
        other_person.healing(@heal)
    end
end