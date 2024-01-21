sub binomial_coefficient {
    my $n = shift;
    my $k = shift;
    my $res = $n;

    for (my $i = 2; $i <= $k; $i++) {
        $res *= ($n - $i + 1) / $i;
    }

    return $res;
}

my $n = <>;
print binomial_coefficient $n, 4;

=pod
<!DOCTYPE html>
<body>
<script>
// helper used to figure out how many points are in n=7
const c = document.createElement("canvas");
document.body.append(c);
c.width = c.height = 500;
const ctx = c.getContext("2d");
const points = [
  [54, 50],
  [102, 28],
  [191, 63],
  [239, 111],
  [203, 170],
  [121, 187],
  [50, 134],
];

for (const [x, y] of points) {
  ctx.moveTo(x, y);
  ctx.beginPath();
  ctx.arc(x, y, 2, 0, Math.PI * 2);
  ctx.closePath();
  ctx.fill();
}

for (const [x, y] of points) {
  for (const [xx, yy] of points) {
    ctx.moveTo(x, y);
    ctx.lineTo(xx, yy);
    ctx.stroke();
  }
}
document.addEventListener("click", e => {
  const {x, y} = {x: e.offsetX, y: e.offsetY};
  console.log(x, y);
  ctx.moveTo(x, y);
  ctx.beginPath();
  ctx.strokeStyle = "red";
  ctx.arc(x, y, 6, 0, Math.PI * 2);
  ctx.closePath();
  ctx.stroke();
});

</script>
</body>
=cut
