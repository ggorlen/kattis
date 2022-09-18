import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class TextureAnalysis {
    public static void main(String[] args) throws java.io.IOException {
        var sc = new BufferedReader(new InputStreamReader(System.in));
        var dc = new BufferedWriter(new OutputStreamWriter(System.out));

        for (int i = 1;; i++) {
            String s = sc.readLine();
    
            if (s.equals("END")) {
                break;
            }

            var a = s.split("\\*", -1);
            boolean allSameLength = true;

            for (int j = 2; j < a.length - 1; j++) {
                if (a[j].length() != a[1].length()) {
                    allSameLength = false;
                    break;
                }
            }

            dc.write(i + (allSameLength ? " EVEN\n" : " NOT EVEN\n"));
        }

        dc.close();
        sc.close();
    }
}
