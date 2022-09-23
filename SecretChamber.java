import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Stack;

class SecretChamber {
    public static void main(String[] args) {
        var scanner = new Scanner(System.in);
        int numTranslations = scanner.nextInt();
        int numPairs = scanner.nextInt();
        scanner.nextLine();
        var graph = new HashMap<Character, ArrayList<Character>>();

        for (int i = 0; i < numTranslations; i++) {
            var line = scanner.nextLine();
            char a = line.charAt(0);
            char b = line.charAt(2);

            if (!graph.containsKey(a)) {
                graph.put(a, new ArrayList<Character>());
            }

            graph.get(a).add(b);
        }

        var closures = buildTransitiveClosures(graph);

        for (int i = 0; i < numPairs; i++) {
            var pair = scanner.nextLine().split(" ");
            var verdict = translatable(closures, pair[0], pair[1]);
            System.out.println(verdict ? "yes" : "no");
        }
    }

    private static HashMap<Character, HashSet<Character>> buildTransitiveClosures(
        HashMap<Character, ArrayList<Character>> graph
    ) {
        var closures = new HashMap<Character, HashSet<Character>>();

        for (var entry : graph.entrySet()) {
            var closure = new HashSet<Character>();
            closures.put(entry.getKey(), closure);

            var stack = new Stack<Character>();
            var visited = new HashSet<Character>();
            stack.push(entry.getKey());

            while (!stack.isEmpty()) {
                var curr = stack.pop();
                var translations = graph.get(curr);

                if (translations != null && !visited.contains(curr)) {
                    visited.add(curr);

                    for (var t : translations) {
                        closure.add(t);
                        stack.push(t);
                    }
                }
            }
        }

        return closures;
    }

    private static boolean translatable(
        HashMap<Character,HashSet<Character>> closures,
        String a,
        String b
    ) {
        if (a.length() != b.length()) {
            return false;
        }

        for (int j = 0; j < a.length(); j++) {
            var x = a.charAt(j);
            var y = b.charAt(j);

            if (x != y && (!closures.containsKey(x) ||
                           !closures.get(x).contains(y))) {
                return false;
            }
        }

        return true;
    }
}
