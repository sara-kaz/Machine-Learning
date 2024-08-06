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

% Plot histograms for various columns in the dataset

% Jitter Local
histogram(Dataset.Jitter_local_, 'Normalization', 'pdf');
title("Jitter Local");

% Jitter Local Absolute
histogram(Dataset.Jitter_local_Absolute_, 'Normalization', 'pdf');
title("Jitter Local Absolute");

% Jitter Rap
histogram(Dataset.Jitter_rap_, 'Normalization', 'pdf');
title("Jitter Rap");

% Jitter PPQ5
histogram(Dataset.Jitter_ppq5_, 'Normalization', 'pdf');
title("Jitter PPQ5");

% Jitter DDP
histogram(Dataset.Jitter_ddp_, 'Normalization', 'pdf');
title("Jitter DDP");

% Shimmer Local
histogram(Dataset.Shimmer_local_, 'Normalization', 'pdf');
title("Shimmer Local");

% Shimmer Local DB
histogram(Dataset.Shimmer_local_DB_, 'Normalization', 'pdf');
title("Shimmer Local DB");

% Shimmer APQ3
histogram(Dataset.Shimmer_apq3_, 'Normalization', 'pdf');
title("Shimmer APQ3");

% Shimmer APQ5
histogram(Dataset.Shimmer_apq5_, 'Normalization', 'pdf');
title("Shimmer APQ5");

% Shimmer APQ11
histogram(Dataset.Shimmer_apq11_, 'Normalization', 'pdf');
title("Shimmer APQ11");

% Shimmer DDA
histogram(Dataset.Shimmer_dda_, 'Normalization', 'pdf');
title("Shimmer DDA");

% AC
histogram(Dataset.AC, 'Normalization', 'pdf');
title("AC");

% NTH
histogram(Dataset.NTH, 'Normalization', 'pdf');
title("NTH");

% HTN
histogram(Dataset.HTN, 'Normalization', 'pdf');
title("HTN");

% Median Pitch
histogram(Dataset.MedianPitch, 'Normalization', 'pdf');
title("Median Pitch");

% Mean Pitch
histogram(Dataset.MeanPitch, 'Normalization', 'pdf');
title("Mean Pitch");

% Standard Deviation
histogram(Dataset.StandardDeviation, 'Normalization', 'pdf');
title("Standard Deviation");

% Minimum Pitch
histogram(Dataset.MinimumPitch, 'Normalization', 'pdf');
title("Minimum Pitch");

% Maximum Pitch
histogram(Dataset.MaximumPitch, 'Normalization', 'pdf');
title("Maximum Pitch");

% Number Of Pulses
histogram(Dataset.NumberOfPulses, 'Normalization', 'pdf');
title("Number Of Pulses");

% Number Of Periods
histogram(Dataset.NumberOfPeriods, 'Normalization', 'pdf');
title("Number Of Periods");

% Mean Period
histogram(Dataset.MeanPeriod, 'Normalization', 'pdf');
title("Mean Period");

% Standard Deviation Of Period
histogram(Dataset.StandardDeviationOfPeriod, 'Normalization', 'pdf');
title("Standard Deviation Of Period");

% Fraction Of Locally Unvoiced Frames
histogram(Dataset.FractionOfLocallyUnvoicedFrames, 'Normalization', 'pdf');
title("Fraction Of Locally Unvoiced Frames");

% Number Of Voice Breaks
histogram(Dataset.NumberOfVoiceBreaks, 'Normalization', 'pdf');
title("Number Of Voice Breaks");

% Degree Of Voice Breaks
histogram(Dataset.DegreeOfVoiceBreaks, 'Normalization', 'pdf');
title("Degree Of Voice Breaks");

% Class Information
histogram(categorical(Dataset.classInformation), 'Normalization', 'pdf');
title("Class Information");
