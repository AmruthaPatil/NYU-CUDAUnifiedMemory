#include <iostream>
#include <chrono>
#include <cmath>

// Function to add arrays
void addArrays(float *array1, float *array2, int N) {
    for (int i = 0; i < N; ++i) {
        array2[i] = array1[i] + array2[i];
    }
}

int main(int argc, char** argv) {
    int millions = 1;
    int N = 1 << 20;

    if (argc == 2) {
        sscanf(argv[1], "%d", &millions);
    }

    N = millions * N;
    float *arrayA = (float*)malloc(N * sizeof(float));
    float *arrayB = (float*)malloc(N * sizeof(float));

    // Initialize arrays
    for (int i = 0; i < N; ++i) {
        arrayA[i] = 1.0f;
        arrayB[i] = 2.0f;
    }

    auto start = std::chrono::high_resolution_clock::now();
    addArrays(arrayA, arrayB, N);
    auto stop = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
    
    std::cout << "K: " << millions << " million, " << "Time: " << (float)duration.count()/1000000 << " (sec)" << std::endl;

    // Check for errors (all values should be 3.0f)
    float maxError = 0.0f;
    for (int i = 0; i < N; i++) {
        maxError = std::fmax(maxError, std::fabs(arrayB[i] - 3.0f));
    }
    std::cout << "Max error: " << maxError << std::endl;

    // Free memory
    free(arrayA);
    free(arrayB);

    return 0;
}
