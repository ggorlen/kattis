# wrong answer; probably too large input?

read s
ln=($s)
minutes=${ln[0]}
seconds=$(($minutes * 60))

read s
ln=($s)
IFS=$'\n' sorted=($(sort <<<"${ln[*]}"))
unset IFS

total=0

for ((i=0; i<${#ln[@]}; i++)); do
  e=${ln[$i]}
  candidate="$(($seconds - $e))"

  if [[ $candidate -ge 0 ]]; then
    seconds=$(($seconds - $e))
    total=$(($total + $e))
  fi
done

echo "$total"
