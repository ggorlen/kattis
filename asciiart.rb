a = "Problem A is about Ascii Art
   _     __   __  _   _
  / \   / /  / / | | | |
 / _ \  \ \ | |  | | | |
/_/ \_\ /_/  \_\ |_| |_|"
b = "Problem B is about Fortnite
###############
###############
####       /###
####   ########
####       ####
####   ########
####   ########
####   ########
####_~<########
###############"
c = "Problem C is about The Legend of Zelda
     /\\
    /  \\
   /____\\
  /\\    /\\
 /  \\  /  \\
/____\\/____\\"
s = gets.squeeze.strip

if s == "What is problem A about?"
  puts a
elsif s == "What is problem B about?"
  puts b
elsif s == "What is problem C about?"
  puts c
else
  puts "I am not sure how to answer that."
end
