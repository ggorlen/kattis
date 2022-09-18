public class Throwns {
    public static void main(String[] args) {
        var sc = new java.util.Scanner(System.in);
        int n = Integer.parseInt(sc.nextLine().split(" ")[0]);
        var line = sc.nextLine().split(" ");
        var commands = new java.util.ArrayList<Integer>();
        int sum = 0;

        for (int i = 0; i < line.length; i++) {
            if (line[i].matches("^-?\\d+$")) {
                commands.add(Integer.parseInt(line[i]));
                continue;
            }

            for (int j = Integer.parseInt(line[++i]); j > 0; j--) {
                commands.remove(commands.size() - 1);
            }
        }

        for (int c : commands) {
            sum += c;
        }

        System.out.println(Math.floorMod(sum, n));
    }
}
