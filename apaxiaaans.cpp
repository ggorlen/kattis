#include <iostream>
#include <sstream>
#include <string>

int main() {
    std::string s;
    std::stringstream ss;
    std::cin >> s;

    for (int i = 0; i < s.size(); i++) {
        if (i == 0 || s[i] != s[i-1]) {
            ss << s[i];
        }
    }

    std::cout << ss.str() << "\n";
}
