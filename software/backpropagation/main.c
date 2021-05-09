#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

/*
Iris Model Neural Network Backpropagation Code
Notes about this neural network code:
    - Using Sigmoid as activation function
    - Capable of only one hidden layer for now; Will require a nested for-loop for multiple hidden layers
*/

//Function Prototyping
double activation (double x);                                       //Activation function
double dActivation (double x);                                      //Derivative of reLU function
double initialWeight();                                             //Randomly initializes weights between 0 and 1
void shuffleOrder(int *array, size_t n);                            //Shuffles order of training set

//Edit these values to change number of nodes for each layer, and number of training patterns
#define InputN 4                                                    //Number of neurons in the input layer
#define HiddenN 6                                                   //Number of neurons in the hidden layer
#define OutputN 3                                                   //Number of neurons in the output layer
#define TrainData 150                                               //Number of training sets

int main() {

    //Edit these variables to test neural network (will change to text file for data set in the future)
    int maxEpoch = 100000;                                          //Max number of epochs before stopping
    double learningRate = 0.8;                                      //Learning rate should be set between 0 and 1
    double minError = 3;                                            //Error threshold; Set to 0 to train up to max epochs

    double input[TrainData][InputN] =                               //Input training sets
        {   {5.1, 3.5, 1.4, 0.2},{4.9, 3.0, 1.4, 0.2},{4.7, 3.2, 1.3, 0.2},{4.6, 3.1, 1.5, 0.2},{5.0, 3.6, 1.4, 0.3},
            {5.4, 3.9, 1.7, 0.4},{4.6, 3.4, 1.4, 0.3},{5.0, 3.4, 1.5, 0.2},{4.4, 2.9, 1.4, 0.2},{4.9, 3.1, 1.5, 0.1},
            {5.4, 3.7, 1.5, 0.2},{4.8, 3.4, 1.6, 0.2},{4.8, 3.0, 1.4, 0.1},{4.3, 3.0, 1.1, 0.1},{5.8, 4.0, 1.2, 0.2},
            {5.7, 4.4, 1.5, 0.4},{5.4, 3.9, 1.3, 0.4},{5.1, 3.5, 1.4, 0.3},{5.7, 3.8, 1.7, 0.3},{5.1, 3.8, 1.5, 0.3},
            {5.4, 3.4, 1.7, 0.2},{5.1, 3.7, 1.5, 0.4},{4.6, 3.6, 1.0, 0.2},{5.1, 3.3, 1.7, 0.5},{4.8, 3.4, 1.9, 0.2},
            {5.0, 3.0, 1.6, 0.2},{5.0, 3.4, 1.6, 0.4},{5.2, 3.5, 1.5, 0.2},{5.2, 3.4, 1.4, 0.2},{4.7, 3.2, 1.6, 0.2},
            {4.8, 3.1, 1.6, 0.2},{5.4, 3.4, 1.5, 0.4},{5.2, 4.1, 1.5, 0.1},{5.5, 4.2, 1.4, 0.2},{4.9, 3.1, 1.5, 0.2},
            {5.0, 3.2, 1.2, 0.2},{5.5, 3.5, 1.3, 0.2},{4.9, 3.6, 1.4, 0.1},{4.4, 3.0, 1.3, 0.2},{5.1, 3.4, 1.5, 0.2},
            {5.0, 3.5, 1.3, 0.3},{4.5, 2.3, 1.3, 0.3},{4.4, 3.2, 1.3, 0.2},{5.0, 3.5, 1.6, 0.6},{5.1, 3.8, 1.9, 0.4},
            {4.8, 3.0, 1.4, 0.3},{5.1, 3.8, 1.6, 0.2},{4.6, 3.2, 1.4, 0.2},{5.3, 3.7, 1.5, 0.2},{5.0, 3.3, 1.4, 0.2},
            {7.0, 3.2, 4.7, 1.4},{6.4, 3.2, 4.5, 1.5},{6.9, 3.1, 4.9, 1.5},{5.5, 2.3, 4.0, 1.3},{6.5, 2.8, 4.6, 1.5},
            {5.7, 2.8, 4.5, 1.3},{6.3, 3.3, 4.7, 1.6},{4.9, 2.4, 3.3, 1.0},{6.6, 2.9, 4.6, 1.3},{5.2, 2.7, 3.9, 1.4},
            {5.0, 2.0, 3.5, 1.0},{5.9, 3.0, 4.2, 1.5},{6.0, 2.2, 4.0, 1.0},{6.1, 2.9, 4.7, 1.4},{5.6, 2.9, 3.6, 1.3},
            {6.7, 3.1, 4.4, 1.4},{5.6, 3.0, 4.5, 1.5},{5.8, 2.7, 4.1, 1.0},{6.2, 2.2, 4.5, 1.5},{5.6, 2.5, 3.9, 1.1},
            {5.9, 3.2, 4.8, 1.8},{6.1, 2.8, 4.0, 1.3},{6.3, 2.5, 4.9, 1.5},{6.1, 2.8, 4.7, 1.2},{6.4, 2.9, 4.3, 1.3},
            {6.6, 3.0, 4.4, 1.4},{6.8, 2.8, 4.8, 1.4},{6.7, 3.0, 5.0, 1.7},{6.0, 2.9, 4.5, 1.5},{5.7, 2.6, 3.5, 1.0},
            {5.5, 2.4, 3.8, 1.1},{5.5, 2.4, 3.7, 1.0},{5.8, 2.7, 3.9, 1.2},{6.0, 2.7, 5.1, 1.6},{5.4, 3.0, 4.5, 1.5},
            {6.0, 3.4, 4.5, 1.6},{6.7, 3.1, 4.7, 1.5},{6.3, 2.3, 4.4, 1.3},{5.6, 3.0, 4.1, 1.3},{5.5, 2.5, 4.0, 1.3},
            {5.5, 2.6, 4.4, 1.2},{6.1, 3.0, 4.6, 1.4},{5.8, 2.6, 4.0, 1.2},{5.0, 2.3, 3.3, 1.0},{5.6, 2.7, 4.2, 1.3},
            {5.7, 3.0, 4.2, 1.2},{5.7, 2.9, 4.2, 1.3},{6.2, 2.9, 4.3, 1.3},{5.1, 2.5, 3.0, 1.1},{5.7, 2.8, 4.1, 1.3},
            {6.3, 3.3, 6.0, 2.5},{5.8, 2.7, 5.1, 1.9},{7.1, 3.0, 5.9, 2.1},{6.3, 2.9, 5.6, 1.8},{6.5, 3.0, 5.8, 2.2},
            {7.6, 3.0, 6.6, 2.1},{4.9, 2.5, 4.5, 1.7},{7.3, 2.9, 6.3, 1.8},{6.7, 2.5, 5.8, 1.8},{7.2, 3.6, 6.1, 2.5},
            {6.5, 3.2, 5.1, 2.0},{6.4, 2.7, 5.3, 1.9},{6.8, 3.0, 5.5, 2.1},{5.7, 2.5, 5.0, 2.0},{5.8, 2.8, 5.1, 2.4},
            {6.4, 3.2, 5.3, 2.3},{6.5, 3.0, 5.5, 1.8},{7.7, 3.8, 6.7, 2.2},{7.7, 2.6, 6.9, 2.3},{6.0, 2.2, 5.0, 1.5},
            {6.9, 3.2, 5.7, 2.3},{5.6, 2.8, 4.9, 2.0},{7.7, 2.8, 6.7, 2.0},{6.3, 2.7, 4.9, 1.8},{6.7, 3.3, 5.7, 2.1},
            {7.2, 3.2, 6.0, 1.8},{6.2, 2.8, 4.8, 1.8},{6.1, 3.0, 4.9, 1.8},{6.4, 2.8, 5.6, 2.1},{7.2, 3.0, 5.8, 1.6},
            {7.4, 2.8, 6.1, 1.9},{7.9, 3.8, 6.4, 2.0},{6.4, 2.8, 5.6, 2.2},{6.3, 2.8, 5.1, 1.5},{6.1, 2.6, 5.6, 1.4},
            {7.7, 3.0, 6.1, 2.3},{6.3, 3.4, 5.6, 2.4},{6.4, 3.1, 5.5, 1.8},{6.0, 3.0, 4.8, 1.8},{6.9, 3.1, 5.4, 2.1},
            {6.7, 3.1, 5.6, 2.4},{6.9, 3.1, 5.1, 2.3},{5.8, 2.7, 5.1, 1.9},{6.8, 3.2, 5.9, 2.3},{6.7, 3.3, 5.7, 2.5},
            {6.7, 3.0, 5.2, 2.3},{6.3, 2.5, 5.0, 1.9},{6.5, 3.0, 5.2, 2.0},{6.2, 3.4, 5.4, 2.3},{5.9, 3.0, 5.1, 1.8} };

    double target[TrainData][OutputN] =                             //Target values for each training set
        {   {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,0,1},{0,0,1},{0,0,1},{0,0,1},{0,0,1},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {0,1,0},{0,1,0},{0,1,0},{0,1,0},{0,1,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0},
            {1,0,0},{1,0,0},{1,0,0},{1,0,0},{1,0,0} };

    double netH[HiddenN], netO[OutputN];                                              //Sum weights of hidden layer and output neurons
    double outH[HiddenN], outO[OutputN];                            //Output activation for hidden layer and output neurons
    double biasH[HiddenN], biasO[OutputN];                          //Bias values per hidden layer and output neuron (Zero means no bias)
    double weightIH[InputN][HiddenN], weightHO[HiddenN][OutputN];   //Weights for hidden layer and output neurons
    double errorH, errorO = minError;                               //Sum error for hidden and output layer
    double deltaH[HiddenN], deltaO[OutputN];                        //Delta errors for hidden and output layer

    int i, j, k, p, x, epoch;
    int trainOrder[] =
        {   0,1,2,3,4,5,6,7,8,9,10,
            11,12,13,14,15,16,17,18,19,20,
            21,22,23,24,25,26,27,28,29,30,
            31,32,33,34,35,36,37,38,39,40,
            41,42,43,44,45,46,47,48,49,50,
            51,52,53,54,55,56,57,58,59,60,
            61,62,63,64,65,66,67,68,69,70,
            71,72,73,74,75,76,77,78,79,80,
            81,82,83,84,85,86,87,88,89,90,
            91,92,93,94,95,96,97,98,99,100,
            101,102,103,104,105,106,107,108,109,110,
            111,112,113,114,115,116,117,118,119,120,
            121,122,123,124,125,126,127,128,129,130,
            131,132,133,134,135,136,137,138,139,140,
            141,142,143,144,145,146,147,148,149};

    /*=========================================================
    Initializing Weights and Biases (Between 0 and 1)
    =========================================================*/
    for (i = 0; i < InputN; i++) {
        for (j = 0; j < HiddenN; j++) {
            weightIH[i][j] = initialWeight();
        }
    }

    for (i = 0; i < HiddenN; i++) {
        biasH[i] = initialWeight();
        for (j = 0; j < OutputN; j++) {
            weightHO[i][j] = initialWeight();
        }
    }

    for (i = 0; i < OutputN; i++) {
        biasO[i] = initialWeight();
    }

    //Displaying initial weights and biases
    printf("Initial Hidden Weights:\n   [ ");
    for (i = 0; i < InputN; i++) {
        printf("[ ");
        for (j = 0; j < HiddenN; j++) {
            printf("%f ", weightIH[i][j]);
        }
        printf("] ");
    }
    printf("]\n\n");

    printf("Initial Hidden Biases:\n   [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("%f ", biasH[j]);
    }
    printf("]\n\n");

    printf("Initial Output Weights:\n");
    for (j = 0; j < OutputN; j++) {
        printf("   [ ");
        for (k = 0; k < HiddenN; k++) {
            printf("%f ", weightHO[k][j]);
        }
        printf("]\n\n");
    }

    printf("Initial Output Biases:\n   [ ");
    for (j = 0; j < OutputN; j++) {
        printf("%f ", biasO[j]);
    }
    printf("]\n");

    /*
    FILE *ptr;
    ptr = fopen("C:\\Users\\Andrew\\Documents\\CodeBlocks\\backpropagation\\weights.txt", "w");
    if (ptr == NULL){
        printf("Failed to open weights.txt!\n\n");
        exit(1);
    }

    fprintf(ptr, "Initial Weights and Biases: \n");
    fprintf(ptr, "   Weight 1 = %f\n", weightIH[0][0]);
    fprintf(ptr, "   Weight 2 = %f\n", weightIH[0][1]);
    fprintf(ptr, "   Weight 3 = %f\n", weightIH[1][0]);
    fprintf(ptr, "   Weight 4 = %f\n", weightIH[1][1]);
    fprintf(ptr, "   Weight 5 = %f\n", weightHO[0][0]);
    fprintf(ptr, "   Weight 6 = %f\n", weightHO[1][0]);
    fprintf(ptr, "   Hidden Layer Bias = %f\n", biasH[0]);
    fprintf(ptr, "   Output Bias = %f\n", biasO[0]);
*/

    /*=========================================================
    Neural Network Training
    =========================================================*/
    //Iteration For-Loop that ends when max epochs reached or error is negligible
    for (epoch = 0; ((epoch < maxEpoch) && (errorO >= minError)); epoch++) {
        shuffleOrder(trainOrder, TrainData);
        printf("\nEpoch: %i\n", epoch+1);
        errorO = 0;

        for (x = 0; x < TrainData; x++) {
            p = trainOrder[x];

            /*=========================================================
            Feed-Forward
            =========================================================*/
            for (j = 0; j < HiddenN; j++) {
                netH[j] = biasH[j];
                for (i = 0; i < InputN; i++) {
                    netH[j] += input[p][i] * weightIH[i][j];
                }
                outH[j] = activation(netH[j]);
            }

            for (k = 0; k < OutputN; k++) {
                netO[k] = biasO[k];
                for (j = 0; j < HiddenN; j++) {
                    netO[k] += outH[j] * weightHO[j][k];
                }
                outO[k] = activation(netO[k]);
            }

            //Display training set outputs (Reduced to show every 50th dataset)
            if (p % 50 == 0) {
                printf("   Inputs: %.1f, %.1f, %.1f, %.1f\t", input[p][0], input[p][1], input[p][2], input[p][3]);
                printf("Output: %.4f, %.4f, %.4f\t  Expected Output: %.0f, %.0f, %.0f\t", outO[0], outO[1], outO[2], target[p][0], target[p][1], target[p][2]);
                printf("Error: %.4f\n", errorO);
            }

            /*=========================================================
            Backpropagation
            =========================================================*/
            for (k = 0; k < OutputN; k++) {
                errorO += 0.5 * (target[p][k] - outO[k]) * (target[p][k] - outO[k]);
                deltaO[k] = (target[p][k] - outO[k]) * dActivation(outO[k]);
            }

             for (j = 0; j < HiddenN; j++) {
                errorH = 0.0;
                for (k = 0; k < OutputN; k++) {
                    errorH += deltaO[k] * weightHO[j][k];
                }
                deltaH[j] = errorH * dActivation(outH[j]);
            }

            /*=========================================================
            Updating Weights
            =========================================================*/
            for (k = 0; k < OutputN; k++) {
                biasO[k] += deltaO[k] * learningRate;
                for (j = 0; j < HiddenN; j++) {
                    weightHO[j][k] += learningRate * deltaO[k] * outH[j];
                }
            }

            for (j = 0; j < HiddenN; j++) {
                biasH[j] += deltaH[j] * learningRate;
                for (i = 0; i < InputN; i++) {
                    weightIH[i][j] += learningRate * deltaH[j] * input[p][i];
                }
            }
        }
    }

    //Displaying final weights and biases (To be implemented as output text file)
    printf("\n\nFinal Hidden Weights:\n   [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("[ ");
        for (i = 0; i < InputN; i++) {
            printf("%f ", weightIH[i][j]);
        }
        printf("] ");
    }
    printf("]\n\n");

    printf("Final Hidden Biases:\n   [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("%f ", biasH[j]);
    }
    printf("]\n\n");

    printf("Final Output Weights:\n");
    for (k = 0; k < OutputN; k++) {
        printf("   [ ");
        for (j = 0; j < HiddenN; j++) {
            printf("%f ", weightHO[j][k]);
        }
        printf("]\n\n");
    }

    printf("Final Output Biases:\n   [ ");
    for (k = 0; k < OutputN; k++) {
        printf("%f ", biasO[k]);
    }
    printf("]\n");
/*

    printf("\n\nFinal Hidden Weights:\n   [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("[ ");
        for (i = 0; i < InputN; i++) {
            printf("%f ", weightIH[i][j]);
        }
        printf("] ");
    }
    printf("]\n\n");

    printf("Final Hidden Biases:\n   [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("%f ", biasH[j]);
    }
    printf("]\n\n");

    printf("Final Output Weights:\n");
    for (k = 0; k < OutputN; k++) {
        printf("   [ ");
        for (j = 0; j < HiddenN; j++) {
            printf("%f ", weightHO[j][k]);
        }
        printf("]\n\n");
    }

    printf("Final Output Biases:\n   [ ");
    for (k = 0; k < OutputN; k++) {
        printf("%f ", biasO[k]);
    }
    printf("]\n");

    //Write the final weight values to weight.txt file
    fprintf(ptr, "\nFinal Weights and Biases: \n");
    fprintf(ptr, "   Weight 1 = %f\n", weightIH[0][0]);
    fprintf(ptr, "   Weight 2 = %f\n", weightIH[0][1]);
    fprintf(ptr, "   Weight 3 = %f\n", weightIH[1][0]);
    fprintf(ptr, "   Weight 4 = %f\n", weightIH[1][1]);
    fprintf(ptr, "   Weight 5 = %f\n", weightHO[0][0]);
    fprintf(ptr, "   Weight 6 = %f\n", weightHO[1][0]);
    fprintf(ptr, "   Hidden Layer Bias = [%f, %f]\n", biasH[0], biasH[1]);
    fprintf(ptr, "   Output Bias = %f\n", biasO[0]);

    fclose(ptr);
*/
    return 0;
}

//Activation Function (Using Sigmoid function for Iris Classification Problem)
double activation(double x) {
    double output;
/*
    if (x > 0){
        if (x >= 1) {
            output = 1.0;
        }

        else {
            output = x;
        }
    }

    else {
        output = 0.0;
    }
*/
    output = 1 / (1 + exp(-x));
    return output;
}

//Derivative of Activation Function (Using Signmoid function for Iris Classification Problem)
double dActivation(double x) {
    double output;
/*
    if (x > 0 && x < 1) {
        output = 1.0;
    }

    else {
        output = 0.0;
    }
*/
    output = x * (1-x);
    return output;
}

//Initializes weight with random value between 0 and 1
double initialWeight() {
    return ((double)rand())/((double)RAND_MAX);
}

//Shuffles order of training set
void shuffleOrder(int *array, size_t n) {
    if (n > 1) {
        size_t i;
        for (i = 0; i < n - 1; i++) {
            size_t j = i + rand() / (RAND_MAX / (n - i) + 1);
            int t = array[j];
            array[j] = array[i];
            array[i] = t;
        }
    }
}
