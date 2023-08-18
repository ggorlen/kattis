read n

for ((i = 0; i < n; i++)); do
  read a
  read b
  echo $a
  echo $b

  for ((j = 0; j < ${#a}; j++)); do
    aj=${a:j:1}
    bj=${b:j:1}
    if [[ $aj == $bj ]]; then
      printf "."
    else
      printf "*"
    fi
  done

  echo
  echo
done
