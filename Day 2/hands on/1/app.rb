require_relative 'hero'
require_relative 'person'

jin = Hero.new("Jin Sakai", 100, 50)
puts jin.to_s
puts "\n"

khotun = Person.new("Khotun Khan", 500, 50)
puts khotun.to_s
puts "\n"

loop do
    jin.attack(khotun)
    puts khotun.to_s
    break if khotun.die?

    khotun.attack(jin)
    puts khotun.to_s
    break if khotun.die?
end