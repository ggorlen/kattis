require "set"

def dist(a, b)
  dx = a[:x] - b[:x]
  dy = a[:y] - b[:y]
  (dx * dx + dy * dy) ** 0.5
end

_, n_pings = gets.split.map(&:to_i)
pings = []

n_pings.times do
  p, x, y, t = gets.split.map(&:to_i)
  pings << {p: p, x: x, y: y, t: t}
end

pairs = Set.new
pings.sort!{|x, y| x[:t] - y[:t]}

pings.each_with_index do |x, i|
  5.times do |j|
    j += i + 1

    break if j >= pings.size || pings[j][:t] - x[:t] > 10

    if x[:p] != pings[j][:p] && dist(x, pings[j]) <= 1000
      pairs << [x[:p], pings[j][:p]].sort
    end
  end
end

p pairs.size
pairs.sort.each{|e| puts e.join(" ")}
