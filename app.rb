require_relative 'person'

jin = Person.new("Jin Sakai", 100, 50)
puts jin.to_s

khotun = Person.new("Khotun Khan", 500, 50)
puts khotun.to_s

loop do
    jin.attack(khotun)
    puts "#{jin.to_s} \n"
    break if khotun.die?

    khotun.attack(jin)
    puts "#{khotun.to_s} \n"
    break if jin.die?
end
