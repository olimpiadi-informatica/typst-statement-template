#include <iostream>

int sum(int A, int B);

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(nullptr);

    int A, B;
    std::cin >> A >> B;
    
    std::cout << sum(A, B) << '\n';
}