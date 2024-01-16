#include <algorithm>
#include <iostream>
#include <string>

int main() {
    std::string s;

    while (std::getline(std::cin, s)) {
        std::transform(s.begin(), s.end(), s.begin(),
            [](unsigned char c){ return std::tolower(c); });
        bool found = s.find("problem") != std::string::npos;
        std::cout << (found ? "yes" : "no") << "\n";
    }
}
