# Diagnosing Parkinson’s Disease Based on Voice Recordings: Comparative Study Using Machine Learning Techniques

This repository contains the code and resources for the conference paper titled "Diagnosing Parkinson’s Disease Based on Voice Recordings: Comparative Study Using Machine Learning Techniques" presented in the book series "Smart Innovation, Systems and Technologies" (volume 330).

## Abstract
Parkinson’s disease is a neurological disorder for which the symptoms worsen over time, making its treatment difficult. Early detection can help patients receive effective treatment before the disease becomes severe. This paper focuses on applying and evaluating different machine learning techniques to predict Parkinson’s disease based on patients' voice data. Various algorithms in MATLAB were used to train models, and the better performing models among them were chosen. The chosen algorithms were logistic regression, SVM (linear and quadratic), and weighted KNN. The quadratic SVM classifier performed best among other classifiers to predict Parkinson’s disease. The findings of this study could contribute to the development of better diagnostic tools for early prediction of Parkinson’s disease.

## Features
- Data preprocessing and statistical analysis of voice recordings
- Implementation of various machine learning algorithms
- Evaluation and comparison of model performance
- Visualization of data distributions and model results

## Getting Started

### Prerequisites
- MATLAB R2020a or higher

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/your-repo/Machine-Learning.git
    ```
2. Navigate to the project directory:
    ```bash
    cd Machine-Learning
    ```
3. Open the project in MATLAB.

### Usage
1. Open and run the main script `main.m` to start the data preprocessing and model training.
2. Use the provided scripts and functions to explore the dataset, train models, and visualize results.

## Files

### Source Files
- `main.m`: Main script to run the preprocessing, training, and evaluation pipeline.
- `preprocessData.m`: Function to preprocess and clean the dataset.
- `trainModels.m`: Function to train and evaluate machine learning models.
- `visualizeResults.m`: Function to visualize data distributions and model performance.

### Data
- `Dataset.csv`: Voice recordings dataset used for training and evaluation.

### Example Code
Below is a snippet from the data preprocessing and statistical analysis script.

```matlab
% Set the format for displaying numbers to long
format long g;

% Specify that we are working with numeric data types
a = vartype('numeric');

% Extract the first 1208 rows of the dataset containing numeric data types
insN = Dataset(1:1208, a);

% Initialize arrays to store column statistics
columnName = cell(width(insN), 1);
Count = zeros(width(insN), 1);
Missing = zeros(width(insN), 1);
Card = zeros(width(insN), 1);
Min = zeros(width(insN), 1);
F_Q = zeros(width(insN), 1);  % First Quartile
Avg = zeros(width(insN), 1);  % Average
Mid = zeros(width(insN), 1);  % Median
T_Q = zeros(width(insN), 1);  % Third Quartile
Max = zeros(width(insN), 1);
S_D = zeros(width(insN), 1);  % Standard Deviation

% Loop through each numeric column to calculate statistics
for x = 1:width(insN)
    % Store the column name
    columnName(x, 1) = insN.Properties.VariableNames(x);
    
    % Count the number of entries
    Count(x, 1) = height(insN.(x));
    
    % Calculate the percentage of missing values
    Missing(x, 1) = sum(ismissing(insN.(x))) / height(insN) * 100;
    
    % Calculate the cardinality (number of unique values)
    Card(x, 1) = height(groupsummary(insN, x));
    
    % Calculate the minimum value
    Min(x, 1) = min(insN.(x));
    
    % Calculate the first quartile (25th percentile)
    F_Q(x, 1) = prctile(insN.(x), 25);
    
    % Calculate the mean (average) value
    Avg(x, 1) = mean(insN.(x));
    
    % Calculate the median value
    Mid(x, 1) = median(insN.(x));
    
    % Calculate the maximum value
    Max(x, 1) = max(insN.(x));
    
    % Calculate the third quartile (75th percentile)
    T_Q(x, 1) = prctile(insN.(x), 75);
    
    % Calculate the standard deviation
    S_D(x, 1) = std(insN.(x));
end

% Create a table to store the calculated statistics
DQR = table(Count, Missing, Card, Min, F_Q, Avg, Mid, T_Q, Max, S_D, 'RowNames', columnName);
```

## Contact
For any questions or issues, please contact Sara Aly at sarakhaled.kaz@gmail.com.

Feel free to reach out with any questions or feedback regarding this implementation. Happy coding!
