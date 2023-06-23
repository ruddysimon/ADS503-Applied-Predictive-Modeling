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

The data underwent preprocessing, which involved steps such as missing value imputation, normalization (scaling and centering), and fixing class imbalance problem. This step was essential to ensure the data quality and robustness of our machine learning models.

Following preprocessing, feature selection methods were applied to determine the most relevant features contributing to cervical cancer diagnosis. This step was critical in reducing model complexity and enhancing model interpretability without compromising the predictive performance.

The selected features were then fed into several supervised machine learning algorithms for model training. These algorithms included both linear (such as Linear Discriminant Analysis and Penalized Logistic Regression) and non-linear models (such as Random Forests, Support Vector Machines (SVM), and Neural Networks).

We used an 80-20 split for our data: 80% was used for training our models, and the remaining 20% was reserved for validation. This approach ensured that our models were not overfitting the training data and could generalize well to unseen data.

Furthermore, to ensure the robustness and reliability of our findings, we used a 10-fold cross-validation technique. In this method, the training dataset was divided into 10 subsets. The model was then trained 10 times, each time using 9 subsets for training and the remaining subset for validation. The final model performance was the average performance across the 10 iterations. This process not only helped us estimate the likely performance of the model on unseen data but also provided a safeguard against overfitting.

### Models

> The following models have been used in this study for predicting cervical cancer:

**Linear Discriminant Analysis (LDA):** Linear Discriminant Analysis is a method used in statistics, pattern recognition, and machine learning to find a linear combination of features that characterizes or separates two or more classes of objects or events.</br>

**Penalized Logistic Regression (glmnet):** Logistic regression, despite its name, is a linear model for classification rather than regression. Penalized Logistic Regression is a variation of logistic regression in which the logistic loss function is augmented with a penalty function to avoid overfitting and better manage multicollinearity.</br>

**Nearest Shrunken Centroids (PAMR):** Also known as Predictive Analysis for Microarrays (PAM), this method is used for high dimensional class prediction. It shrinks the class centroids towards the overall centroid for all classes, which can improve prediction accuracy.</br>

**Multivariate Adaptive Regression Splines (MARS):** MARS is a non-parametric regression method that models complex data by piecing together simpler, spline-based models.</br>

**Support Vector Machine (svmRadial):** Support Vector Machines are based on the concept of decision planes that define decision boundaries. A decision plane is one that separates between a set of objects having different class memberships.</br>

**Support Vector Machine (svmPoly):** The SVM algorithm that uses a polynomial function as its kernel. This algorithm is well suited for problems where all the training data is not linearly separable.</br>

**K-Nearest Neighbor (knn):** The k-nearest neighbors algorithm is a type of instance-based learning, or lazy learning, where the function is only approximated locally and all computation is deferred until function evaluation.</br>

**Random Forest (RF):** Random forests or random decision forests are an ensemble learning method for classification, regression and other tasks that operate by constructing a multitude of decision trees at training time and outputting the class that is the mode of the classes or mean/average prediction of the individual trees.</br>

**Neural Networks (nnet):** A neural network takes in inputs, which are then processed in hidden layers using weights that are adjusted during training. Then the model spits out a prediction.</br>

**Logistic Regression (GLM):** Logistic regression is a statistical model that in its basic form uses a logistic function to model a binary dependent variable, although many more complex extensions exist. In regression analysis, logistic regression (or logit regression) is estimating the parameters of a logistic model; it is a form of binomial regression.</br>

---

## Result

Among the different models tested, the Random Forest algorithm demonstrated superior performance, with an accuracy of 93%, sensitivity of 95%, specificity of 72%, and an AUC-ROC of 0.88. These results suggest a high diagnostic accuracy and precision of the Random Forest model in detecting cervical cancer. The most influential features identified were Schiller, STDs.vulvo.perineal.comdylomatosis, number of different STDs diagnosis, Number of pregnancies, number of sexual partners, and smoking status. This aligns well with established risk factors for cervical cancer.

![ROC Curve](https://github.com/ruddysimon/ADS503-Applied-Predictive-Modeling/blob/main/Images/roc_curve_comparison.png "AUC-ROC curve comparing performance of different models")




