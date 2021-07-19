class Game
    def initialize(playable_character)
        @non_playable_character ={
            heroes: [],
            villains: []
        }
        @playable_character = playable_character
    end

    def add_hero(person)
        @non_playable_character[:heroes] << person
        # puts @non_playable_character[:heroes].to_s
    end

    def add_villain(person)
        @non_playable_character[:villains] << person
    end

    def start
        until (@playable_character.die? || @non_playable_character[:villains].empty?) do
            print_characters_stats
            play_charachters_turn
        end
    end

    def print_characters_stats
        @playable_character.print_stats
        @non_playable_character.each_value do |people|
            people.each do |person|
                person.print_stats
            end
        end
        puts "\n"
    end
    
    def play_charachters_turn
        @playable_character.play_turn(@non_playable_character[:heroes],
             @non_playable_character[:villains])
        
        @non_playable_character.each do |group, people|
            people.each do |person|
                if group == :heroes
                    targets = @non_playable_character[:villains]
                    unless targets.empty?
                        target = targets[rand(targets.size)]
                        person.attack(target)
                        targets.delete(target) if target.removed?
                    end
                elsif group == :villains
                    targets = @non_playable_character[:heroes].dup
                    targets << @playable_character
                    unless targets.empty?
                        target = targets[rand(targets.size)]
                        person.attack(target)
                        @non_playable_character[:heroes].delete(target) if
                        target.remove?
                    end
                end
            end
            puts "\n"
        end
    end
end