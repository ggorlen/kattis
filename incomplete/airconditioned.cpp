#include <iostream>
#include <vector>

int main() {
    int n;
    std::cin >> n;
    std::vector<int>temps(2 * n + 1);

    for (int i = 0; i < n; i++) {
        int lower;
        int upper;
        std::cin >> lower;
        std::cin >> upper;

        for (int j = lower; j < upper; j++) {
            temps[j] = 1;
        }

        if (temps[upper] == 0) {
            temps[upper] = 2;
        }
    }

    //for (size_t i = 0; i < temps.size(); i++)
    //    std::cout << temps[i] << " ";
    //std::cout << "\n";

    int rooms = 0;
    for (size_t i = 0; i < temps.size(); i++) {
        if (temps[i]) {
            rooms++;

            for (; i < temps.size() && temps[i] == 1; i++);

            //if (temps[i] == 2) {
            //    
            //}
        }
    }

    std::cout << rooms << "\n";
}
