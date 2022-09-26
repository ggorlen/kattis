import java.io.BufferedReader;
import java.io.InputStreamReader;

public class addemup {
    public static void main(String[] args) throws java.io.IOException {
        var sc = new BufferedReader(new InputStreamReader(System.in));
        var s = sc.readLine().split(" ");
        var target = Integer.parseInt(s[1]);
        var lookup = new boolean[100000001];

        for (String n : sc.readLine().split(" ")) {
            int i = Integer.parseInt(n);

            if (target - i >= 0 && lookup[target-i]) {
                System.out.println("YES");
                return;
            }

            var revS = new StringBuilder(n).reverse().toString();

            if (revS.indexOf('3') >= 0 || revS.indexOf('4') >= 0 || revS.indexOf('7') >= 0) {
                lookup[i] = true;
                continue;
            }

            int rev = Integer.parseInt(revS);

            if (target - rev >= 0 && lookup[target-rev]) {
                System.out.println("YES");
                return;
            }

            lookup[i] = true;
            lookup[rev] = true;
        }

        System.out.println("NO");
        sc.close();
    }
}

