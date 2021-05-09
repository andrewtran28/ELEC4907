#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

/*
Notes about this neural network code:
    - Using ReLU as activation function
    - Capable of only one hidden layer for now; will require a nested for-loop for multiple hidden layers
    - Only one training set so far (Adjust the variables below to test other training sets), will have to implement text file with various data sets
    - Biases are per layer rather per neuron
*/


//Edit these values to change number of nodes for each layer
#define InputN 2                                                    //Number of neurons in the input layer
#define HiddenN 2                                                   //Number of neurons in the hidden layer
#define OutputN 1                                                   //Number of neurons in the output layer
#define trainData 4                                                 //Number of training data patterns (Will be implemented next)


double reLU (double x);                                             //Function prototyping reLU function
double derivReLU (double x);                                        //Function prototyping derivative of reLU function

int main() {

    //Edit these variables to test neural network (will change to text file for data set in the future)
    double input[InputN] = {1, 0};                                  //Input neurons
    double target[OutputN] = {1};                                   //Actual (expected) value of outputs
    double learningRate = 0.1;                                      //Learning rate is between 0 and 1
    double bias[1] = {0.5};                                         //Bias values (Zero means no bias)
    double biasO = 0.5;                                             //Output Bias value (Zero means no bias)
    int epoch_max = 1000;                                           //Max number of epochs until iterations stop
    double weightIH[InputN][HiddenN] = {                            //Weights for hidden layer (From input to hidden)
        {0.1, -0.2}, {0.5, 1}
    };
    double weightHO[HiddenN][OutputN] = {                           //Weights for output layer (From hidden to output)
        {0.6}, {-0.5}
    };


    double netH[HiddenN];                                           //Feed forward for hidden layer neurons
    double netO[OutputN];                                           //Feed forward for output neurons
    double outH[HiddenN];                                           //Output activation for hidden layer neurons
    double outO[OutputN];                                           //Output activation of output neurons (Predicted value)
    double error;                                                   //Mean Squared Error
    double sumWeightHO[HiddenN];
    double So[OutputN];                                             //Output error (AKA delta node) for output neurons
    double Sh[HiddenN];                                             //Hidden neuron errors for hidden layer neurons


    int i, j, k = 0;                                                //Variables for indexing inputs, hidden layer neurons, and outputs respectively
    int epoch = 0;                                                  //Variable for epoch count

    //Displaying initial conditions and weights
    printf("Inputs = [%.2f, %.2f]\nTarget Value = %.2f\nLearning Rate = %.2f\n\n", input[0], input[1], target[k], learningRate);
    printf("    Weight 1 = %.4f\n", weightIH[0][0]);
    printf("    Weight 2 = %.4f\n", weightIH[0][1]);
    printf("    Weight 3 = %.4f\n", weightIH[1][0]);
    printf("    Weight 4 = %.4f\n", weightIH[1][1]);
    printf("    Weight 5 = %.4f\n", weightHO[0][0]);
    printf("    Weight 6 = %.4f\n\n", weightHO[1][0]);

    printf("    Hidden Layer Bias = %.4f\n", bias[0]);
    printf("    Output Bias = %.4f\n\n", biasO);


    while (epoch < epoch_max) {                                     //Iteration While-Loop; Ends when max iterations or minimal error threshold is reached
    error = 0;                                                      //Initialize error for the current epoch

        /*=========================================================
        Feed-Forward
        =========================================================*/
        for (j = 0; j < HiddenN; j++) {                             //Computes hidden layer activation outputs;
            netH[j] = bias[0];                                      //Initialize net hidden layer neurons with bias
            for (i = 0; i < InputN; i++) {                          //For every input, calculate the corresponding net hidden layer value
                netH[j] += input[i] * weightIH[i][j];
            }
            outH[j] = reLU(netH[j]);                                //For every hidden layer neuron, calculate the activation output
        }

        for (k = 0; k < OutputN; k++) {                             //Computes output layer activation outputs
            netO[k] = biasO;                                        //Initicalize net output neurons with bias
            for (j = 0; j < HiddenN; j++) {                         //For every hidden layer neuron, calculate corresponding net output value
                netO[k] += outH[j] * weightHO[j][k];
            }
            outO[k] = reLU(netO[k]);                                //For every output neuron, calculate the activation output
        }

        /*=========================================================
        Calculating Error
        =========================================================*/
        for (k = 0; k < OutputN; k++) {                             //For every output neuron, calculate the total error
            error += 0.5 * pow((target[k] - outO[k]), 2);           //Mean square error; Factor of 0.5 in front to simplify node delta when taking the derivative
            So[k] = (outO[k] - target[k]) * derivReLU(outO[k]);     //Output error calculation
            biasO -= So[k]*learningRate;                                         //Updates output bias values
        }

        /*=========================================================
        Backpropagation (Updating Weights)
        =========================================================*/

        //Backpropagating error to hidden layers
        for (j = 0; j < HiddenN; j++) {
            sumWeightHO[j] = 0;                                     //Initialize hidden layer error for the current layer
            for (k = 0; k < OutputN; k++) {                         //For every output neuron, calculate the total hidden layer error for the repsective hidden layer neuron
                sumWeightHO[j] += weightHO[j][k] * So[k];
            }
            Sh[j] = sumWeightHO[j] * derivReLU(outH[j]);            //Hidden layer output calculation
            bias[0] -= Sh[j]*learningRate;                                       //Updates hidden layer bias values
        }

        //Updating the HO weights
        for (k = 0; k < OutputN; k++) {
            for (j = 0; j < HiddenN; j++) {
                    weightHO[j][k] -= learningRate * So[k] * outH[j];
            }
        }

        //Updating the IH weights
        for (j = 0; j < HiddenN; j++) {
            for (i = 0; i < InputN; i++) {
                    weightIH[i][j] -= learningRate * Sh[j] * input[i];
            }
        }

        //End of Epoch; Move to next iteration
        printf("Iteration #%i: Output = %f\nError: %.10f\n\n", epoch+1, outO[0], error);
        epoch++;

        if (error < 0.000000001){                                   //If minimum error threshold is reached, end While-Loop
            break;
        }

        else if (epoch == epoch_max) {                              //If max number of allowed epochs is reached, end While-Loop
            break;
        }
    }

    //Diplay final weights
    printf("Final weights and biases after %i iteration(s):\n", epoch);
    printf("    Weight 1 = %f\n", weightIH[0][0]);
    printf("    Weight 2 = %f\n", weightIH[0][1]);
    printf("    Weight 3 = %f\n", weightIH[1][0]);
    printf("    Weight 4 = %f\n", weightIH[1][1]);
    printf("    Weight 5 = %f\n", weightHO[0]);
    printf("    Weight 6 = %f\n\n", weightHO[1]);
    printf("    Hidden Layer Bias = %f\n", bias[0]);
    printf("    Output Bias = %f\n\n", biasO);

    //Write the final weight values to weight.txt file
    FILE *ptr;
    ptr = fopen("C:\\Users\\Andrew\\Documents\\CodeBlocks\\neuralnetwork\\weights.txt", "w");

    if (ptr == NULL){
        printf("Failed to open weights.txt!\n\n");
        exit(1);
    }

    fprintf(ptr, "Weight 1 = %f\n", weightIH[0][0]);
    fprintf(ptr, "Weight 2 = %f\n", weightIH[0][1]);
    fprintf(ptr, "Weight 3 = %f\n", weightIH[1][0]);
    fprintf(ptr, "Weight 4 = %f\n", weightIH[1][1]);
    fprintf(ptr, "Weight 5 = %f\n", weightHO[0]);
    fprintf(ptr, "Weight 6 = %f\n", weightHO[1]);

    fprintf(ptr, "Hidden Layer Bias = %f\n", bias[0]);
    fprintf(ptr, "Output Bias = %f\n", biasO);

    fclose(ptr);

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
