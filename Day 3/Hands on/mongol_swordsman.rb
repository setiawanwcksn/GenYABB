require_relative 'person'

class MongolSwordsman< Villain
    def initialize(name,hitpoint, attack_damage)
        super(name,hitpoint, attack_damage)
    end
    def attack(other_person)
        puts "#{@name} slashes #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end
end