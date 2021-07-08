require_relative 'person'

class Hero < Person
    def initialize(name, hitpoint, attack_damage, heal)
        super(name, hitpoint, attack_damage)
        @deflect_percentage = 0.8
        @heal = heal
    end
    def take_damage(damage)
        if rand < @deflect_percentage
            puts "#{name} deflects the attack"
        else
            @hitpoint -= hitpoint
        end
    end
    def heal(other_person)
        puts "#{@name} heals #{other_person.name}, restoring #{@heal} hitpoint"
        other_person.healing(@heal)
    end
end