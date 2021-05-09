#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

/*
Notes about this neural network code:
    - Using ReLU as activation function
    - Capable of only one hidden layer for now; will require a nested for-loop for multiple hidden layers
    - Biases are per layer rather per neuron
*/


//Edit these values to change number of nodes for each layer
#define InputN 2                                                    //Number of neurons in the input layer
#define HiddenN 2                                                   //Number of neurons in the hidden layer
#define OutputN 1                                                   //Number of neurons in the output layer

double reLU (double x);                                             //Function prototyping reLU function
double derivReLU (double x);                                        //Function prototyping derivative of reLU function

int main() {

    //Edit these variables to test neural network (will change to text file for data set in the future)
    double input[InputN] = {0, 1};                                  //Input neurons
    double target[OutputN] = {1};                                   //Actual (expected) value of outputs
    double biasH[HiddenN] = {0.775376, -0.788981};                  //Bias values (Zero means no bias)
    double biasO[OutputN] = {1.0};                                  //Output Bias value (Zero means no bias)
    double weightIH[InputN][HiddenN] =                              //Weights for hidden layer (From input to hidden)
        { {-0.775376, 0.788981}, {-0.775376, 0.788981} };
    double weightHO[HiddenN][OutputN] =                             //Weights for output layer (From hidden to output)
        { {-1.289697}, {-1.267458} };

    double netH[HiddenN];                                           //Feed forward for hidden layer neurons
    double netO[OutputN];                                           //Feed forward for output neurons
    double outH[HiddenN];                                           //Output activation for hidden layer neurons
    double outO[OutputN];                                           //Output activation of output neurons (Predicted value)
    double error;
    int i, j, k;                                                    //Variables for indexing inputs, hidden layer neurons, and outputs respectively

    //Displaying initial conditions and weights
    printf("Inputs = [%.2f, %.2f]\nExpected Value = %.2f\n\n", input[0], input[1], target[0]);
    printf("    Weight 1 = %f\n", weightIH[0][0]);
    printf("    Weight 2 = %f\n", weightIH[0][1]);
    printf("    Weight 3 = %f\n", weightIH[1][0]);
    printf("    Weight 4 = %f\n", weightIH[1][1]);
    printf("    Weight 5 = %f\n", weightHO[0][0]);
    printf("    Weight 6 = %f\n\n", weightHO[1][0]);

    printf("    Hidden Layer Bias = [%f, %f]\n", biasH[0], biasH[1]);
    printf("    Output Bias = %f\n\n", biasO[0]);

    /*=========================================================
    Feed-Forward
    =========================================================*/
    for (j = 0; j < HiddenN; j++) {                             //Computes hidden layer activation outputs;
        netH[j] = biasH[j];                                     //Initialize net hidden layer neurons with bias
        for (i = 0; i < InputN; i++) {                          //For every input, calculate the corresponding net hidden layer value
            netH[j] += input[i] * weightIH[i][j];
        }
        outH[j] = reLU(netH[j]);                                //For every hidden layer neuron, calculate the activation output
    }

    for (k = 0; k < OutputN; k++) {                             //Computes output layer activation outputs
        netO[k] = biasO[k];                                        //Initicalize net output neurons with bias
        for (j = 0; j < HiddenN; j++) {                         //For every hidden layer neuron, calculate corresponding net output value
            netO[k] += outH[j] * weightHO[j][k];
        }
        outO[k] = reLU(netO[k]);                                //For every output neuron, calculate the activation output
        error = target[k] - outO[k];
    }

    printf("Output = %f\nError: %f\n\n", outO[0], error);

    return 0;
}

//Rectified Linear Unit Function
double reLU(double x) {
    double output;

    if (x > 0){
        output = x;
    }

    else {
        output = 0;
    }

    return output;
}

//Derivative of ReLU Function
double derivReLU(double x) {

    double output;

    if (x > 0){
        output = 1;
    }

    else {
        output = 0;
    }

    return output;
}
