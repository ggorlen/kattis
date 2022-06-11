#include <bits/stdc++.h>

using namespace std;

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);

    int n;
    cin >> n;

    for (int i = 0; i < n; i++) {
        int g;
        cin >> g;
        int previous = -1;

        for (int j = 0; j < g; j++) {
            int current;
            cin >> current;

            if (previous >= 0 && previous + 1 != current) {
                cout << (1 + j) << "\n";
                string s;
                getline(cin, s);
                break;
            }

            previous = current;
        }
    }
}
