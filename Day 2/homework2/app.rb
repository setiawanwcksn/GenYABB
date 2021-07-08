require_relative 'hero'
require_relative 'person'
require_relative 'villain'
require_relative 'mongol_archer'
require_relative 'mongol_spearman'
require_relative 'mongol_swordsman'

jin = Hero.new("Jin Sakai", 100, 50, 20)
yuna = Person.new("Yuna", 90, 45)
sensei = Person.new("Sensei Ishikawa", 80, 60)

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)

villains = [mongol_archer, mongol_spearman, mongol_swordsman]
allies = [yuna, sensei]
heroes = [yuna, sensei, jin]

i = 1
until (jin.die? || villains.empty?) do
    puts "=== Turn #{i} ===\n"
    puts jin.to_s    
    allies.each do |ally|
        puts ally.to_s
    end
    villains.each do |villain|
        puts villain.to_s
    end

    puts "As Jin Sakai, what do you want to do this turn?\n"
    puts "1. Attack an enemy"
    puts "2. Heal an ally"
    puts "Your choice: " 
    menu1 = gets.to_i

    if menu1 == 1
        puts "which enemy you want to attack?\n"
        k = 1
            villains.each do |villain|
                puts "#{k}. #{villain.name}"
                k += 1
            end
        puts "Your choice: " 

        menu2 = gets.to_i
        jin.attack(villains[menu2-1])   
        
        villains.each do |villain|
            if villain.die? || villain.flee?
                villains.delete(villain)                 
            end
        end  
    else
        puts "Which ally you want to heal?"
        k = 1
            allies.each do |ally|
                puts "#{k}. #{ally.name}"
            end
        puts "Which ally do you want?"
        
        menu2 = gets.to_i
        jin.heal(heroes[menu2-1])        
    end
    allies.each do |ally|
        ally.attack(villains[rand(villains.size)])
    end
    puts "\n"
    villains.each do |villain|
        if villain.die? || villain.flee?
            villains.delete(villain)                 
        end
    end  
    puts "\n"
    villains.each do |villain|
        villain.attack(heroes[rand(heroes.size)])
    end
    puts "\n"
    allies.each do |ally|
        if ally.die?
            allies.delete(ally)                 
        end
    end 
    puts "\n"
    i += 1
end