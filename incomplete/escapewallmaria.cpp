#include <iostream>
#include <string>
#include <vector>

int main() {
    int M;
    int N;
    int t;
    int sx = 0;
    int sy = 0;
    std::cin >> t >> N >> M;
    std::vector<std::string> grid(N);

    for (int i = 0; i < N; i++) {
        std::cin >> grid[i];
        size_t pos = grid[i].find("S");

        if (pos != std::string::npos) {
            sx = pos;
            sy = i;
        }
    }

    // show the position; remove when you're ready to solve the problem
    std::cout << sx << ", " << sy << "\n";
}
