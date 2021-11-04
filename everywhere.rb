require "set"

gets.to_i.times do
  places = Set.new
  gets.to_i.times {places.add gets.chomp}
  p places.size
end
