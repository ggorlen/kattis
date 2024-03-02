read x
read n
res=""

for ((i = 0 ; i < n ; i++)); do
    res="${res}${x}"
done

echo $res
