total_weight, stacks = gets.chomp.split.map {|x| x.to_i}
total_coins = stacks * (stacks + 1) / 2 
gold_weight = 29_370
tung_weight = 29_260

(0..100).each do |gold_coin_qty|
  tung_coin_qty = total_coins - gold_coin_qty
  gold_coin_value = gold_coin_qty * gold_weight
  tung_coin_value = tung_coin_qty * tung_weight

  if gold_coin_value + tung_coin_value == total_weight
    puts gold_coin_qty
  end
end
