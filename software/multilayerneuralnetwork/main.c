#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/*
Iris Model Neural Network Backpropagation Code
Notes about this neural network code:
    - Using Sigmoid as activation function as problem is a classification problem
    - Capable of l number of hidden layers
    - Capable of n number of hidden neurons per hidden layer
    - All hidden layers have the same number of hidden neurons
    - Biases are per neuron
*/

//Edit these values to change number of nodes for each layer, and number of training patterns
#define InputN 4                                                    //Number of neurons in the input layer
#define HiddenN 8                                                   //Number of neurons in the hidden layer (up to 12 due to float limitations? double only allows up to 6)
#define OutputN 3                                                   //Number of neurons in the output layer
#define HiddenLayer 2                                               //Number of hidden layers
#define TrainData 150                                               //Number of training sets

//Function Prototyping
float activation (float x);                                         //Activation function
float dActivation (float x);                                        //Derivative of activation function
double initialWeight();                                             //Randomly initializes weights between 0 and 1
void shuffleOrder (int *array, size_t n);                           //Shuffles order of training set
void opCountMAC (long *layerCountMAC, long *layerCountBypass, double product);                     //Counts the number of MAC operations that would potentially be used

int main() {
    int numLayer = HiddenLayer - 1;                                 //Variable for number of hidden layer arrays

    //Edit these variables to test neural network
    int maxEpoch = 1000000;                                         //Max number of epochs before force stopping
    float learningRate = 0.1;                                       //Learning rate should be set between 0 and 1
    float minError = 0.0025;                                        //Error threshold; Set to 0 to train up to max epochs

    int sampleRate = 100;                                          //Frequency of error sampling

    float input[TrainData][InputN] =                                //Input training sets (Standardized data of Iris Dataset)
        {
        {-0.8977,1.0156,-1.3358,-1.3134},{-1.1392,-0.1315,-1.3358,-1.3134},{-1.3807,0.3273,-1.3924,-1.3134},{-1.5015,0.0979,-1.2791,-1.3134},{-1.0184,1.245,-1.3358,-1.182},
        {-0.5354,1.9333,-1.1658,-1.0507},{-1.5015,0.7862,-1.3358,-1.182},{-1.0184,0.7862,-1.2791,-1.3134},{-1.743,-0.361,-1.3358,-1.3134},{-1.1392,0.0979,-1.2791,-1.4447},
        {-0.5354,1.4745,-1.2791,-1.3134},{-1.26,0.7862,-1.2225,-1.3134},{-1.26,-0.1315,-1.3358,-1.4447},{-1.8638,-0.1315,-1.5057,-1.4447},{-0.0523,2.1627,-1.449,-1.3134},
        {-0.1731,3.0805,-1.2791,-1.0507},{-0.5354,1.9333,-1.3924,-1.0507},{-0.8977,1.0156,-1.3358,-1.182},{-0.1731,1.7039,-1.1658,-1.182},{-0.8977,1.7039,-1.2791,-1.182},
        {-0.5354,0.7862,-1.1658,-1.3134},{-0.8977,1.4745,-1.2791,-1.0507},{-1.5015,1.245,-1.5623,-1.3134},{-0.8977,0.5567,-1.1658,-0.9194},{-1.26,0.7862,-1.0525,-1.3134},
        {-1.0184,-0.1315,-1.2225,-1.3134},{-1.0184,0.7862,-1.2225,-1.0507},{-0.7769,1.0156,-1.2791,-1.3134},{-0.7769,0.7862,-1.3358,-1.3134},{-1.3807,0.3273,-1.2225,-1.3134},
        {-1.26,0.0979,-1.2225,-1.3134},{-0.5354,0.7862,-1.2791,-1.0507},{-0.7769,2.3922,-1.2791,-1.4447},{-0.4146,2.6216,-1.3358,-1.3134},{-1.1392,0.0979,-1.2791,-1.3134},
        {-1.0184,0.3273,-1.449,-1.3134},{-0.4146,1.0156,-1.3924,-1.3134},{-1.1392,1.245,-1.3358,-1.4447},{-1.743,-0.1315,-1.3924,-1.3134},{-0.8977,0.7862,-1.2791,-1.3134},
        {-1.0184,1.0156,-1.3924,-1.182},{-1.6223,-1.7375,-1.3924,-1.182},{-1.743,0.3273,-1.3924,-1.3134},{-1.0184,1.0156,-1.2225,-0.788},{-0.8977,1.7039,-1.0525,-1.0507},
        {-1.26,-0.1315,-1.3358,-1.182},{-0.8977,1.7039,-1.2225,-1.3134},{-1.5015,0.3273,-1.3358,-1.3134},{-0.6561,1.4745,-1.2791,-1.3134},{-1.0184,0.5567,-1.3358,-1.3134},
        {1.3968,0.3273,0.5336,0.2627},{0.6722,0.3273,0.4203,0.394},{1.2761,0.0979,0.6469,0.394},{-0.4146,-1.7375,0.1371,0.1313},{0.793,-0.5904,0.477,0.394},
        {-0.1731,-0.5904,0.4203,0.1313},{0.5515,0.5567,0.5336,0.5253},{-1.1392,-1.5081,-0.2594,-0.2627},{0.9138,-0.361,0.477,0.1313},{-0.7769,-0.8198,0.0804,0.2627},
        {-1.0184,-2.4258,-0.1462,-0.2627},{0.0684,-0.1315,0.2504,0.394},{0.1892,-1.967,0.1371,-0.2627},{0.31,-0.361,0.5336,0.2627},{-0.2939,-0.361,-0.0895,0.1313},
        {1.0345,0.0979,0.3637,0.2627},{-0.2939,-0.1315,0.4203,0.394},{-0.0523,-0.8198,0.1937,-0.2627},{0.4307,-1.967,0.4203,0.394},{-0.2939,-1.2787,0.0804,-0.1313},
        {0.0684,0.3273,0.5903,0.788},{0.31,-0.5904,0.1371,0.1313},{0.5515,-1.2787,0.6469,0.394},{0.31,-0.5904,0.5336,0},{0.6722,-0.361,0.307,0.1313},
        {0.9138,-0.1315,0.3637,0.2627},{1.1553,-0.5904,0.5903,0.2627},{1.0345,-0.1315,0.7036,0.6567},{0.1892,-0.361,0.4203,0.394},{-0.1731,-1.0493,-0.1462,-0.2627},
        {-0.4146,-1.5081,0.0238,-0.1313},{-0.4146,-1.5081,-0.0329,-0.2627},{-0.0523,-0.8198,0.0804,0},{0.1892,-0.8198,0.7602,0.5253},{-0.5354,-0.1315,0.4203,0.394},
        {0.1892,0.7862,0.4203,0.5253},{1.0345,0.0979,0.5336,0.394},{0.5515,-1.7375,0.3637,0.1313},{-0.2939,-0.1315,0.1937,0.1313},{-0.4146,-1.2787,0.1371,0.1313},
        {-0.4146,-1.0493,0.3637,0},{0.31,-0.1315,0.477,0.2627},{-0.0523,-1.0493,0.1371,0},{-1.0184,-1.7375,-0.2594,-0.2627},{-0.2939,-0.8198,0.2504,0.1313},
        {-0.1731,-0.1315,0.2504,0},{-0.1731,-0.361,0.2504,0.1313},{0.4307,-0.361,0.307,0.1313},{-0.8977,-1.2787,-0.4294,-0.1313},{-0.1731,-0.5904,0.1937,0.1313},
        {0.5515,0.5567,1.27,1.7074},{-0.0523,-0.8198,0.7602,0.9194},{1.5176,-0.1315,1.2134,1.182},{0.5515,-0.361,1.0434,0.788},{0.793,-0.1315,1.1567,1.3134},
        {2.1214,-0.1315,1.6099,1.182},{-1.1392,-1.2787,0.4203,0.6567},{1.7591,-0.361,1.44,0.788},{1.0345,-1.2787,1.1567,0.788},{1.6384,1.245,1.3267,1.7074},
        {0.793,0.3273,0.7602,1.0507},{0.6722,-0.8198,0.8735,0.9194},{1.1553,-0.1315,0.9868,1.182},{-0.1731,-1.2787,0.7036,1.0507},{-0.0523,-0.5904,0.7602,1.576},
        {0.6722,0.3273,0.8735,1.4447},{0.793,-0.1315,0.9868,0.788},{2.2422,1.7039,1.6666,1.3134},{2.2422,-1.0493,1.7799,1.4447},{0.1892,-1.967,0.7036,0.394},
        {1.2761,0.3273,1.1001,1.4447},{-0.2939,-0.5904,0.6469,1.0507},{2.2422,-0.5904,1.6666,1.0507},{0.5515,-0.8198,0.6469,0.788},{1.0345,0.5567,1.1001,1.182},
        {1.6384,0.3273,1.27,0.788},{0.4307,-0.5904,0.5903,0.788},{0.31,-0.1315,0.6469,0.788},{0.6722,-0.5904,1.0434,1.182},{1.6384,-0.1315,1.1567,0.5253},
        {1.8799,-0.5904,1.3267,0.9194},{2.4837,1.7039,1.4966,1.0507},{0.6722,-0.5904,1.0434,1.3134},{0.5515,-0.5904,0.7602,0.394},{0.31,-1.0493,1.0434,0.2627},
        {2.2422,-0.1315,1.3267,1.4447},{0.5515,0.7862,1.0434,1.576},{0.6722,0.0979,0.9868,0.788},{0.1892,-0.1315,0.5903,0.788},{1.2761,0.0979,0.9302,1.182},
        {1.0345,0.0979,1.0434,1.576},{1.2761,0.0979,0.7602,1.4447},{-0.0523,-0.8198,0.7602,0.9194},{1.1553,0.3273,1.2134,1.4447},{1.0345,0.5567,1.1001,1.7074},
        {1.0345,-0.1315,0.8169,1.4447},{0.5515,-1.2787,0.7036,0.9194},{0.793,-0.1315,0.8169,1.0507},{0.4307,0.7862,0.9302,1.4447},{0.0684,-0.1315,0.7602,0.788},
        };

    float target[TrainData][OutputN] =                             //Target values for each training set
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

    float netH[HiddenLayer][HiddenN], netO[OutputN];               //Sum weights of hidden layer and output neurons
    float outH[HiddenLayer][HiddenN], outO[OutputN];               //Output activation for hidden layer and output neurons
    float biasH[HiddenLayer][HiddenN], biasO[OutputN];             //Bias values per hidden layer and output neuron (Zero means no bias)
    float weightIH[InputN][HiddenN], weightHO[OutputN][HiddenN];   //Weights for input-to-hidden and hidden-to-output neurons
    float weightHH[numLayer][HiddenN][HiddenN];                    //Weights for intermediate hidden layer neurons
    float errorH, errorO = minError;                               //Sum error for hidden and output layer
    float deltaH[HiddenLayer][HiddenN], deltaO[OutputN];           //Delta errors for hidden and output layer

    int i, j, k, l, p, x, epoch;

    long countMAC = 0;
    long countBypass = 0;
    long layerCountMAC[HiddenLayer+1] = {0};
    long layerCountBypass[HiddenLayer+1] = {0};
    double opMAC, trainTime;
    double feedfwdTime = 0;
    double backpropTime = 0;

    /*=========================================================
    Initializing Weights and Biases (Between 0 and 1)
    =========================================================*/
    for (i = 0; i < InputN; i++) {
        for (j = 0; j < HiddenN; j++) {
            weightIH[i][j] = initialWeight();
        }
    }

    for (j = 0; j < HiddenN; j++) {
        biasH[0][j] = initialWeight();
    }

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            for (k = 0; k < HiddenN; k++) {
                biasH[l][k] = initialWeight();
                for (j = 0; j < HiddenN; j++) {
                    weightHH[l-1][k][j] = initialWeight();
                }
            }
        }
    }

    for (j = 0; j < HiddenN; j++) {
        for (k = 0; k < OutputN; k++) {
            weightHO[k][j] = initialWeight();
        }
    }

    for (k = 0; k < OutputN; k++) {
        biasO[k] = initialWeight();
    }

    /*=========================================================
    Display Training Initialization
    =========================================================*/
    printf("==========================\nInitial Weights and Biases\n==========================\n\n");

    printf("   Input Weights:\n ");
    for (i = 0; i < InputN; i++) {
        printf("     [ ");
        for (j = 0; j < HiddenN; j++) {
            printf("%f, ", weightIH[i][j]);
        }
        printf("\b\b ]\n ");
    }
    printf("\n\n");

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            printf("   Hidden Layer %i Weights: \n ", l);
            for (j = 0; j < HiddenN; j++) {
                printf("     [ ");
                for (k = 0; k < HiddenN; k++) {
                    printf("%f, ", weightHH[l-1][j][k]);
                }
                printf("\b\b ]\n ");
            }
            printf("\n\n");
        }
    }

    printf("   Output Weights:\n");
    for (j = 0; j < OutputN; j++) {
        printf("      [ ");
        for (k = 0; k < HiddenN; k++) {
            printf("%f, ", weightHO[j][k]);
        }
        printf("\b\b ]\n");
    }
    printf("\n\n");

    printf("   Hidden Layer 1 Biases:\n      [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("%f, ", biasH[0][j]);
    }
    printf("\b\b ]\n\n");

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            printf("   Hidden Layer %i Biases:\n      [ ", l+1);
            for (j = 0; j < HiddenN; j++) {
                printf("%f, ", biasH[l][j]);
            }
            printf("\b\b ]\n\n");
        }
    }

    printf("   Output Biases:\n      [ ");
    for (j = 0; j < OutputN; j++) {
        printf("%f ", biasO[j]);
    }
    printf("]\n\n");

    /*=========================================================
    Neural Network Training
    =========================================================*/

    FILE *plot;
    plot = fopen("plot.csv", "w");
    if (plot == NULL){
        printf("Failed to open plot.csv!\n\n");
        exit(1);
    }

    printf("=======================\nNeural Network Training\n=======================\n\nEpoch: 1 \n");
    clock_t trainBegin = clock();                    //Begins measuring neural network training time

    //Iteration For-Loop that ends when max epochs reached or error is negligible
    for (epoch = 0; epoch < maxEpoch && errorO >= minError; epoch++) {
        shuffleOrder(trainOrder, TrainData);
        if (epoch % sampleRate == 0 && epoch != 0) {
            printf("\nEpoch: %i\tError: %f\n", epoch+1, errorO);
            fprintf(plot, "%i,%f\n", epoch+1, errorO);
        }
        errorO = 0.0;                                //Resets error to zero for next epoch

        for (x = 0; x < TrainData; x++) {
            p = trainOrder[x];

            /*=========================================================
            Feed-Forward
            =========================================================*/
            clock_t feedfwdBegin = clock();        //Begins measuring backpropagation time

            for (j = 0; j < HiddenN; j++) {
                netH[0][j] = biasH[0][j];
                for (i = 0; i < InputN; i++) {
                    opMAC = input[p][i] * weightIH[i][j];
                    netH[0][j] += opMAC;
                    opCountMAC(&layerCountMAC[0], &layerCountBypass[0], opMAC);
                }
                outH[0][j] = activation(netH[0][j]);
            }

            if (HiddenLayer > 1) {
                for (l = 1; l < HiddenLayer; l++) {
                    for (j = 0; j < HiddenN; j++) {
                        netH[l][j] = biasH[l][j];
                        for (k = 0; k < HiddenN; k++) {
                            opMAC = outH[l-1][k] * weightHH[l-1][k][j];
                            netH[l][j] += opMAC;
                            opCountMAC(&layerCountMAC[l], &layerCountBypass[l], opMAC);
                        }
                        outH[l][j] = activation(netH[l][j]);
                    }
                }
            }

            for (k = 0; k < OutputN; k++) {
                netO[k] = biasO[k];
                for (j = 0; j < HiddenN; j++) {
                    opMAC = outH[numLayer][j] * weightHO[k][j];
                    netO[k] += opMAC;
                    opCountMAC(&layerCountMAC[HiddenLayer], &layerCountBypass[HiddenLayer], opMAC);
                }
                outO[k] = activation(netO[k]);
            }

            //Display training set outputs
            if (p % 50 == -1 && epoch % sampleRate == 0) {
                printf("   Inputs: %.1f, %.1f, %.1f, %.1f    \t", input[p][0], input[p][1], input[p][2], input[p][3]);
                printf("Output: %.4f, %.4f, %.4f\t  Expected Output: %.0f, %.0f, %.0f\n", outO[0], outO[1], outO[2], target[p][0], target[p][1], target[p][2]);
            }

            clock_t feedfwdEnd = clock();
            feedfwdTime += (double)(feedfwdEnd - feedfwdBegin) / CLOCKS_PER_SEC;

            /*=========================================================
            Backpropagation
            =========================================================*/
            clock_t backpropBegin = clock();        //Begins measuring backpropagation time

            for (k = 0; k < OutputN; k++) {
                errorO += 0.5 * (target[p][k] - outO[k]) * (target[p][k] - outO[k]);
                deltaO[k] = (target[p][k] - outO[k]) * dActivation(outO[k]);
            }

            for (j = 0; j < HiddenN; j++) {
                errorH = 0.0;
                for (k = 0; k < OutputN; k++) {
                    opMAC = deltaO[k] * weightHO[k][j];
                    errorH += opMAC;
                    opCountMAC(&layerCountMAC[HiddenLayer], &layerCountBypass[HiddenLayer], opMAC);
                }
                deltaH[numLayer][j] = errorH * dActivation(outH[numLayer][j]);
            }

            if (HiddenLayer > 1) {
                for (l = numLayer - 1; l >= 0; l--) {
                    for (j = 0; j < HiddenN; j++) {
                        errorH = 0;
                        for (k = 0; k < HiddenN; k++) {
                            opMAC = deltaH[l+1][k] * weightHH[l][j][k];
                            errorH += opMAC;
                            opCountMAC(&layerCountMAC[l], &layerCountBypass[l], opMAC);
                        }
                        deltaH[l][j] = errorH * dActivation(outH[l][j]);
                    }
                }
            }

            /*=========================================================
            Updating Weights
            =========================================================*/
            for (k = 0; k < OutputN; k++) {
                opMAC = deltaO[k] * learningRate;
                biasO[k] += opMAC;
                opCountMAC(&layerCountMAC[HiddenLayer], &layerCountBypass[HiddenLayer], opMAC);
                for (j = 0; j < HiddenN; j++) {
                    opMAC = learningRate * deltaO[k] * outH[numLayer][j];
                    weightHO[k][j] += opMAC;
                    opCountMAC(&layerCountMAC[HiddenLayer], &layerCountBypass[HiddenLayer], opMAC);
                }
            }

            if (HiddenLayer > 1) {
                for (l = numLayer - 1 ; l >= 0; l--) {
                    for (j = 0; j < HiddenN; j++) {
                        opMAC = deltaH[l+1][j] * learningRate;
                        biasH[l+1][j] += opMAC;
                        opCountMAC(&layerCountMAC[l], &layerCountBypass[l], opMAC);
                        for (k = 0; k < HiddenN; k++) {
                            opMAC = learningRate * deltaH[l+1][j] * outH[l][k];
                            weightHH[l][k][j] += opMAC;
                            opCountMAC(&layerCountMAC[l], &layerCountBypass[l], opMAC);
                        }
                    }
                }
            }

            for (j = 0; j < HiddenN; j++) {
                opMAC = deltaH[0][j] * learningRate;
                biasH[0][j] += opMAC;
                opCountMAC(&layerCountMAC[0], &layerCountBypass[0], opMAC);
                for (i = 0; i < InputN; i++) {
                    opMAC = learningRate * deltaH[0][j] * input[p][i];
                    weightIH[i][j] += opMAC;
                    opCountMAC(&layerCountMAC[0], &layerCountBypass[0], opMAC);
                }
            }

            clock_t backpropEnd = clock();
            backpropTime += (double)(backpropEnd - backpropBegin) / CLOCKS_PER_SEC;
        }
    }

    fclose(plot);

    /*=========================================================
    Display Training Results
    =========================================================*/
    clock_t trainEnd = clock();
    trainTime = (double)(trainEnd - trainBegin) / CLOCKS_PER_SEC;

    for (l = 0; l <= HiddenLayer; l++) {
        countMAC += layerCountMAC[l];
        countBypass += layerCountBypass[l];
    }

    //Display to console application
    printf("\n\n==============\nFinal Results\n==============\n\n");
    printf("Total Epoch Count: %i\n\n", epoch);
    printf("Total MAC Operation Count:\t %lu\n", countMAC);
    for (l = 0; l < HiddenLayer; l++) {
        printf("Hidden Layer %i MAC Operations:\t %lu\n", l+1, layerCountMAC[l]);
    }
    printf("Output Layer MAC Operations:\t %lu\n", layerCountMAC[HiddenLayer]);
    printf("\nTotal MAC Bypass count:\t\t %lu\n", countBypass);
    for (l = 0; l < HiddenLayer; l++) {
        printf("Hidden Layer %i MAC Bypasses: \t %lu\n", l+1, layerCountBypass[l]);
    }
    printf("Output Layer MAC Bypasses:\t %lu\n", layerCountBypass[HiddenLayer]);
    printf("\nTotal Training Time:\t %.4f seconds\nFeed Forward Time:\t %.4f seconds\nBackpropagation Time:\t %.4f seconds\n\n", trainTime, feedfwdTime, backpropTime);

    printf("   Input Weights:\n ");
    for (i = 0; i < InputN; i++) {
        printf("     [ ");
        for (j = 0; j < HiddenN; j++) {
            printf("%f, ", weightIH[i][j]);
        }
        printf("\b\b ]\n ");
    }
    printf("\n");

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            printf("   Hidden Layer %i Weights: \n ", l);
            for (j = 0; j < HiddenN; j++) {
                printf("     [ ");
                for (k = 0; k < HiddenN; k++) {
                    printf("%f, ", weightHH[l-1][j][k]);
                }
                printf("\b\b ]\n ");
            }
            printf("\n");
        }
    }

    printf("   Output Weights:\n");
    for (j = 0; j < OutputN; j++) {
        printf("      [ ");
        for (k = 0; k < HiddenN; k++) {
            printf("%f, ", weightHO[j][k]);
        }
        printf("\b\b ]\n");
    }
    printf("\n");

    printf("   Hidden Layer 1 Biases:\n      [ ");
    for (j = 0; j < HiddenN; j++) {
        printf("%f, ", biasH[0][j]);
    }
    printf("\b\b ]\n\n");

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            printf("   Hidden Layer %i Biases:\n      [ ", l+1);
            for (j = 0; j < HiddenN; j++) {
                printf("%f, ", biasH[l][j]);
            }
            printf("\b\b ]\n\n");
        }
    }

    printf("   Output Biases:\n      [ ");
    for (j = 0; j < OutputN; j++) {
        printf("%f ", biasO[j]);
    }
    printf("]\n\n");

    //Write results to files
    FILE *ptr;
    ptr = fopen("results.txt", "w");
    if (ptr == NULL){
        printf("Failed to open results.txt!\n\n");
        exit(1);
    }

    fprintf(ptr, "Number of Inputs: %i \nNumber of Outputs: %i \nNumber of Hidden Neurons: %i \nNumber of Hidden Layers: %i\n", InputN, OutputN, HiddenN, HiddenLayer);
    fprintf(ptr, "Learning Rate: %f\nError Threshold: %f\n\n", learningRate, minError);
    fprintf(ptr, "Total Epoch Count: %i\n", epoch);
    fprintf(ptr, "Total MAC Operation Count:\t %lu\n", countMAC);
    for (l = 0; l < HiddenLayer; l++) {
        fprintf(ptr, "Hidden Layer %i MAC Operations:\t %lu\n", l+1, layerCountMAC[l]);
    }
    fprintf(ptr, "Output Layer MAC Operations:\t %lu\n\n", layerCountMAC[HiddenLayer]);
    fprintf(ptr, "Total MAC Bypass count:\t\t %lu\n", countBypass);
    for (l = 0; l < HiddenLayer; l++) {
        fprintf(ptr, "Hidden Layer %i MAC Bypasses: \t %lu\n", l+1, layerCountBypass[l]);
    }
    fprintf(ptr, "Output Layer MAC Bypasses:\t %lu\n\n", layerCountBypass[HiddenLayer]);
    fprintf(ptr, "Total Training Time:\t %.4f seconds\nFeed Forward Time:\t %.4f seconds\nBackpropagation Time:\t %.4f seconds\n\n", trainTime, feedfwdTime, backpropTime);

    fprintf(ptr, "Input Weights:\n");
    for (i = 0; i < InputN; i++) {
        fprintf(ptr, "{");
        for (j = 0; j < HiddenN; j++) {
            fprintf(ptr, "%f", weightIH[i][j]);
            if (j != HiddenN - 1) {
                fprintf(ptr, ",");
            }
        }
        fprintf(ptr, "}");
        if (i != InputN - 1) {
            fprintf(ptr, ",");
        }
        fprintf(ptr, "\n");
    }
    fprintf(ptr, "\n");

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            fprintf(ptr, "Hidden Layer %i Weights: \n", l);
            for (j = 0; j < HiddenN; j++) {
                fprintf(ptr, "{");
                for (k = 0; k < HiddenN; k++) {
                    fprintf(ptr, "%f", weightHH[l-1][j][k]);
                    if (k != HiddenN - 1) {
                        fprintf(ptr, ",");
                    }
                }
                fprintf(ptr, "}");
                if (j != HiddenN - 1) {
                    fprintf(ptr, ",");
                }
                fprintf(ptr, "\n");
            }
            fprintf(ptr, "\n");
        }
    }

    fprintf(ptr, "Output Weights:\n");
    for (j = 0; j < OutputN; j++) {
        fprintf(ptr, "{");
        for (k = 0; k < HiddenN; k++) {
            fprintf(ptr, "%f", weightHO[k][j]);
            if (k != HiddenN - 1) {
                fprintf(ptr, ",");
            }
        }
        fprintf(ptr, "}");
        if (j != OutputN - 1) {
            fprintf(ptr, ",");
        }
        fprintf(ptr, "\n");
    }
    fprintf(ptr, "\n");

    fprintf(ptr, "Hidden Layer 1 Biases:\n{");
    for (j = 0; j < HiddenN; j++) {
        fprintf(ptr, "%f", biasH[0][j]);
            if (j != HiddenN - 1) {
                fprintf(ptr, ",");
            }
    }
    fprintf(ptr, "}\n\n");

    if (HiddenLayer > 1) {
        for (l = 1; l < HiddenLayer; l++) {
            fprintf(ptr, "Hidden Layer %i Biases:\n{", l+1);
            for (j = 0; j < HiddenN; j++) {
                fprintf(ptr, "%f", biasH[l][j]);
                if (j != HiddenN - 1) {
                    fprintf(ptr, ",");
                }
            }
            fprintf(ptr, "}\n\n");
        }
    }

    fprintf(ptr, "Output Biases:\n{");
    for (j = 0; j < OutputN; j++) {
        fprintf(ptr, "%f", biasO[j]);
        if (j != OutputN - 1) {
            fprintf(ptr, ",");
        }
    }
    fprintf(ptr, "}\n\n");

    fclose(ptr);
    return epoch;
}

//Activation Function (Using Approximated Sigmoid function for Iris Classification Problem)
float activation(float x) {
    float output;

       output =	x <= -7 ? 3.03*pow(10,-8) + 0.001 :
                x >= -7 && x <= -6 ? 0.0015*x+0.0115 :
                x >= -6 && x <= -5 ? 0.0025*x + 0.0175 :
                x >= -5 && x <= -4 ? 0.01*x+0.055 :
                x >= -4 && x <= -3 ? 0.025*x+0.115 :
                x >= -3 && x <= -2 ? 0.06*x+0.22 :
                x >= -2 && x <= -1 ? 0.15*x+0.4 :
                x >= -1 && x <= 1  ? 0.25*x+0.5 :
                x >= 1 && x <= 2   ? 0.15*x+0.6 :
                x >= 2 && x <= 3   ? 0.06*x+0.78 :
                x >= 3 && x <= 4   ? 0.025*x+0.885 :
                x >= 4 && x <= 5   ? 0.01*x+0.945 :
                x >= 5 && x <= 6   ? 0.0025*x+0.9825 :
                x >= 6 && x <= 7   ? 0.0015*x+0.9885 :
                3.03*pow(10,-8) + 0.999;

//    output = 1 / (1 + exp(-x));
    return output;
}

//Derivative of Activation Function (Using derivative of Signmoid function for Iris Classification Problem)
float dActivation(float x) {
    float output;

    output = x * (1.0-x);
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

//Counts the number of MAC operations that would potentially be used
void opCountMAC (long *layerCountMAC, long int *layerCountBypass, double product) {
    if(abs(product) > 0.000061) {
        *layerCountMAC += 1;
    }

    else if (abs(product) <= 0.000061) {
        *layerCountBypass += 1;
    }
}
