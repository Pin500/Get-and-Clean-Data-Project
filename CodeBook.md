# Code Book for Tidy Data Set

## Data Source
The original data was collected from the UCI Machine Learning Repository: 
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables

### Subject
- `subject`: Identifier for each participant (1-30).

### Activity
- `activity`: The type of activity being performed. The possible activities are:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

### Measurements
The measurements extracted are the mean and standard deviation for each signal, with descriptive labels.

Examples:
- `TimeBodyAccelerometerMeanX`: Mean of body acceleration in the X direction.
- `TimeBodyGyroscopeSTDZ`: Standard deviation of gyroscope measurement in the Z direction.

### Transformations
1. Data merged from training and test sets.
2. Only mean and standard deviation measurements were selected.
3. Activity codes replaced with descriptive names.
4. Variable names modified for readability.
5. Averages calculated for each variable, for each activity and subject.
