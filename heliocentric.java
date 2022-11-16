public class heliocentric {
    public static void main(String[] args) {
        var scanner = new java.util.Scanner(System.in);

        for (int i = 1; scanner.hasNextInt(); i++) {
            int days = 0;
            int e = scanner.nextInt();
            int m = scanner.nextInt();

            while (e != 0 || m != 0) {
                e = (e + 1) % 365;
                m = (m + 1) % 687;
                days++;
            }

            System.out.println("Case " + i + ": " + days);
        }

        scanner.close();
    }
}
