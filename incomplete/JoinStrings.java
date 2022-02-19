// https://stackoverflow.com/questions/62020672/run-time-error-on-kattis-problem-java-problem-join-strings?rq=1
import java.util.*;

class Node {
    public String data;
    public Node head;
    public Node tail;

    public Node(String data) {
        this.data = data;
        this.head = null;
        this.tail = null;
    }
}

public class JoinStrings {
    public static void main(String args[]) {
        var sc = new Scanner(System.in);
        int n = sc.nextInt();
        var nodes = new ArrayList<Node>(n);

        for (int i = 0; i < n; i++) {
            nodes.add(new Node(sc.next()));
        }

        int a = 0;
        for (int i = 1; i < n; i++) {
            a = sc.nextInt() - 1;
            int b = sc.nextInt() - 1;
            var bb = nodes.get(b);
            var aa = nodes.get(a);
            aa.tail.next = bb.head;
            aa.tail = bb.tail;
        }

        for (var node = nodes.get(a); node != null; node = node.next) {
            System.out.print(node.data);
        }

        sc.close();
    }
}
