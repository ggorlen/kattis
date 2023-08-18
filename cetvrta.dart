import "dart:io";

void main() {
    List<List<int>> coords = [];

    for (int i = 0; i < 3; i++) {
        var line = stdin.readLineSync()!
            .split(" ")
            .map<int>((e) => int.parse(e))
            .toList();
        coords.add(line);
    }

    var result = <int>[];

    for (int i = 0; i < coords[0].length; i++) {
        for (int j = 0; j < coords.length; j++) {
            int count = 0;

            for (int k = 0; k < coords.length; k++) {
                if (coords[k][i] == coords[j][i]) {
                    count++;
                }
            }

            if (count == 1) {
                result.add(coords[j][i]);
            }
        }
    }

    print(result.join(" "));
}
