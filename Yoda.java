public class Yoda {
    public static void main(String[] args) {
        var s = new java.util.Scanner(System.in);
        String a = s.next(), b = s.next();
        s.close();
        String ra = "", rb = "";
        int i = a.length() - 1, j = b.length() - 1;

        for (; i >= 0 || j >= 0; i--, j--) {
            int x = i < 0 ? -1 : Character.getNumericValue(a.charAt(i));
            int y = j < 0 ? -1 : Character.getNumericValue(b.charAt(j));

            if (x >= y) {
                ra = a.charAt(i) + ra;
            }
            if (y >= x) {
                rb = b.charAt(j) + rb;
            }
        }

        System.out.println(
            (ra.isEmpty() ? "YODA" : Integer.parseInt(ra)) + "\n" +
            (rb.isEmpty() ? "YODA" : Integer.parseInt(rb)) + "\n"
        );
    }
}
