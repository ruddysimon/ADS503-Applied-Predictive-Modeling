# Applied Predictive Modeling - Predicting Cervical Cancer (Risk Factors)

--- 

## About <a name = "about"></a>

Cervical cancer is the fourth most common cancer among women worldwide, with approximately 570,000 new cases and 311,000 deaths in 2018 alone. Most of these cases are reported in low-and middle-income countries, where access to early detection and treatment is often inadequate. Notably, cervical cancer is largely preventable with timely detection and treatment. Hence, enhancing early detection and diagnosis remains a critical aspect of combating this disease. Machine Learning, a subfield of Artificial Intelligence (AI), has shown enormous promise in improving cancer diagnostics. ML algorithms can analyze vast amounts of data to detect patterns, trends, and correlations that may not be readily evident to human observers. This study aims to develop an ML model specifically tailored for diagnosing cervical cancer and evaluate its accuracy and efficiency.

---

## 🎈 Contributions

- Shailja Somani
- Ruddy Simonpour 

---

## Prerequisites

### Necessary library packages 
```
library(Hmisc)
library(dplyr)
library(pROC)
library(reshape2)
library(ggplot2)
library(caret)
library(ROSE)
```

---

## Project Tree
```
|- README.md \  
|- Input Resources \   
|-     |- kag_risk_factors_cervical_cancer.csv
|- R Script \
|-     |- Data_Ingestion.R 
|-     |- Viz_EDA.R  
|-     |- Preprocessing.R
|-     |- Modeling.R
|-            R Markdown \
|-                 |- Cervical_cancer_data_preperation.Rmd
```

---

## Data Source

Our study utilized a dataset sourced from the UCI repository, a renowned platform for machine learning research. This dataset contains 858 instances and 36 variables, providing a comprehensive overview of patients' medical histories from Hospital Universitario de Caracas in Caracas, Venezuela (Kelwin Fernandes, 2017). The variables encompass a wide range of factors, including the use of hormonal contraceptives and IUDs, the presence of various sexually transmitted diseases (STDs) such as AIDS and HIV, condylomatosis, cervical condylomatosis, and lifestyle activities like smoking and sexual activity. It's important to note that out of the 36 variables, 25 contained missing values, necessitating careful data cleaning and pre-processing. 

---

## Methodology: Data and ML Model Development

For the development of the ML model, we utilized a comprehensive dataset collected from a hospital. This dataset contained anonymized patient information, including medical history, genetic predisposition, lifestyle-related factors, and diagnoses of different sexually transmitted diseases (STDs).

The data underwent preprocessing, which involved steps such as missing value imputation, normalization, and outlier removal. This step was essential to ensure the data quality and robustness of our machine learning models.

Following preprocessing, feature selection methods were applied to determine the most relevant features contributing to cervical cancer diagnosis. This step was critical in reducing model complexity and enhancing model interpretability without compromising the predictive performance.

The selected features were then fed into several supervised machine learning algorithms for model training. These algorithms included both linear (such as Linear Discriminant Analysis and Penalized Logistic Regression) and non-linear models (such as Random Forests, Support Vector Machines (SVM), and Neural Networks).

We used an 80-20 split for our data: 80% was used for training our models, and the remaining 20% was reserved for validation. This approach ensured that our models were not overfitting the training data and could generalize well to unseen data.

Furthermore, to ensure the robustness and reliability of our findings, we used a 10-fold cross-validation technique. In this method, the training dataset was divided into 10 subsets. The model was then trained 10 times, each time using 9 subsets for training and the remaining subset for validation. The final model performance was the average performance across the 10 iterations. This process not only helped us estimate the likely performance of the model on unseen data but also provided a safeguard against overfitting.


