from std/strutils import parseInt

var a = parseInt(readLine(stdin))
var b = parseInt(readLine(stdin))
var c = parseInt(readLine(stdin))

if a < b and a < c:
  echo "Monnei"
elif b < c:
  echo "Fjee"
else:
  echo "Dolladollabilljoll"
