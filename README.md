# Predict authors from their works using NLP and machine learning

## Introduction

Identifying the author of a text poses a challenge for humans, yet
algorithms offer a promising solution by discerning patterns in writing
styles. This study uses natural language processing (NLP) and machine
learning techniques to predict 10 authors from their 100 works,
achieving an 89% predictive accuracy.

## Data collection

A total of 100 English works by 10 authors were downloaded from
[Gutenberg](https://www.gutenberg.org/) using the `gutenbergr` package,
as detailed in [1-gutenberg\_download.R](1-gutenberg_download.R). 10
authors are: Jane Austen, Agatha Christie, Charles Dickens, Daniel
Defoe, Arthur Conan Doyle, George Eliot, Jack London, William
Shakespeare, Mark Twain, and Oscar Wilde.

## Data preprocessing

Data preprocessing was conducted using NLP and the `NLTK` package, as
outlined in [2-NLP.ipynb](2-NLP.ipynb). The following steps were
taken:  
1. **Lowercasing**: Convertint all letters to lowercase, as uppercase
and lowercase letters are typically treated the same.  
- Example: “Retailers and 10 Ice-creams” becomes “retailers and 10
ice-creams”.  
2. **Tokenization**: Splitting text into individual words and chunks.  
- Example: “retailers and 10 ice-creams” becomes “retailers”, “and”,
“10”, “ice-creams”.  
3. **Stop Word Removal**: Removing common words such as “the”, “and”,
“in” as they do not carry useful information.  
- Example: “retailers”, “10”, “ice-creams” remains.  
4. **Regular Expressions**: Retaining only English letters, removing
numbers and punctuation.  
- Example: “retailers” remains.  
5. **Stemming and Lemmatization**: Reducing words to their root forms
for easier analysis.  
- Example: “retailers” becomes “retail”.

## Feature extraction

I converted textual data to numerical features using the `sklearn`
package so that machine learning algorithms can understand.

Bag-of-Words (BoW) counts occurrences of each word, resulting in a wide
vector for a text, where each column represents a word. When multiple
texts are stacked together, BoW forms a wide matrix. Below is its head:

<table>
<colgroup>
<col style="width: 3%" />
<col style="width: 4%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 6%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 4%" />
<col style="width: 6%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">aar</th>
<th style="text-align: right;">aaron</th>
<th style="text-align: right;">ab</th>
<th style="text-align: right;">aba</th>
<th style="text-align: right;">aback</th>
<th style="text-align: right;">abaft</th>
<th style="text-align: right;">abalon</th>
<th style="text-align: right;">abandon</th>
<th style="text-align: right;">abari</th>
<th style="text-align: right;">abash</th>
<th style="text-align: right;">abat</th>
<th style="text-align: right;">abb</th>
<th style="text-align: right;">abbalac</th>
<th style="text-align: right;">abbaratta</th>
<th style="text-align: right;">abbay</th>
<th style="text-align: right;">abbess</th>
<th style="text-align: right;">abbey</th>
<th style="text-align: right;">abbeyland</th>
<th style="text-align: right;">abbia</th>
<th style="text-align: right;">abbiamo</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">23</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">40</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

An improvement of BoW is TF-IDF (term frequency–inverse document
frequency). Since documents vary in length, 10 occurrences of “apples”
in a 1000-word document may not be more important than 8 occurrences in
a 10-word document. Therefore, term frequency measures how frequently a
word appears in a document. Moreover, “car” may appear very often in
every car review, so it may not carry additional information. Thus,
words that are common across many documents get a lower inverse document
frequency score, while rare words get a higher score. In summary, TF-IDF
emphasizes words that are both significant within a specific document
and relatively uncommon across the whole set of documents. Below is its
head:

<table style="width:100%;">
<colgroup>
<col style="width: 2%" />
<col style="width: 4%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 2%" />
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 4%" />
<col style="width: 5%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">aar</th>
<th style="text-align: right;">aaron</th>
<th style="text-align: right;">ab</th>
<th style="text-align: right;">aba</th>
<th style="text-align: right;">aback</th>
<th style="text-align: right;">abaft</th>
<th style="text-align: right;">abalon</th>
<th style="text-align: right;">abandon</th>
<th style="text-align: right;">abari</th>
<th style="text-align: right;">abash</th>
<th style="text-align: right;">abat</th>
<th style="text-align: right;">abb</th>
<th style="text-align: right;">abbalac</th>
<th style="text-align: right;">abbaratta</th>
<th style="text-align: right;">abbay</th>
<th style="text-align: right;">abbess</th>
<th style="text-align: right;">abbey</th>
<th style="text-align: right;">abbeyland</th>
<th style="text-align: right;">abbia</th>
<th style="text-align: right;">abbiamo</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0087742</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0065871</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0031459</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0053308</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0005131</td>
<td style="text-align: right;">0.0015409</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0004347</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0.0007997</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0.0360961</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

## Dimentionality reduction

Using TF-IDF for further analysis, Principal Component Analysis (PCA)
reduced the dimensionality from around 35,000 unique words to 20
principal components.

## Supervised learning

The outcome variable (*y*) contains 10 authors, and the feature
variables (*X*) are the 20 principle components. The dataset was split
into 80% training data and 20% test data. 7 classification models were
evaluated: logistic regression, Lasso, Naive Bayes, KNN, random forest,
GBM, and XGBoost. These models were trained on the training data, and
their predictions were compared to actual outcomes in the test data.

In logistic regression, I used Softmax function to handle multiple
classes in the outcome variable.

Logistic regression with too many features may result in overfitting.
Thus, I used Lasso to regularize it. I used 10-fold cross-validation in
the training data to find the optimal regularization parameter *λ*.

Naive Bayes assumes every feature is independent of all other features,
conditional on the class labels of the outcome variable.

KNN measures distances between features. I used 10-fold cross-validation
in the training data to find the optimal number of neighbors *k*.

In gradient boosting models (GBM and XGBoost), I used grid search with
5-fold cross-validation in the training data to find optimal parameters.

Below is the overall accuracy, measuring the proportion of accurate
predictions in test data. Random Forest achieved the highest accuracy at
0.8947, significantly outperforming random guessing 10 classes of
authors.

<table>
<thead>
<tr class="header">
<th style="text-align: left;">model</th>
<th style="text-align: right;">overall_accuracy</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Logistic regression</td>
<td style="text-align: right;">0.7368</td>
</tr>
<tr class="even">
<td style="text-align: left;">Lasso</td>
<td style="text-align: right;">0.7895</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Naive Bayes</td>
<td style="text-align: right;">0.5789</td>
</tr>
<tr class="even">
<td style="text-align: left;">KNN</td>
<td style="text-align: right;">0.7895</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Random Forest</td>
<td style="text-align: right;">0.8947</td>
</tr>
<tr class="even">
<td style="text-align: left;">GBM</td>
<td style="text-align: right;">0.8421</td>
</tr>
<tr class="odd">
<td style="text-align: left;">XGBoost</td>
<td style="text-align: right;">0.8421</td>
</tr>
</tbody>
</table>

## Clustering

I used K-means to group 100 works into 12 clusters. There is no
“optimal” number of clusters *k*, so I tried it from 2 to 20, finding
that 12 had a better performance. In the table below, each row
represents a cluster. Notably, Cluster 4 mainly contains works by Daniel
Defoe, indicating new works falling into this cluster are likely
authored by him.

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 11%" />
<col style="width: 9%" />
<col style="width: 11%" />
<col style="width: 12%" />
<col style="width: 9%" />
<col style="width: 8%" />
<col style="width: 13%" />
<col style="width: 7%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">Austen, Jane</th>
<th style="text-align: right;">Christie, Agatha</th>
<th style="text-align: right;">Defoe, Daniel</th>
<th style="text-align: right;">Dickens, Charles</th>
<th style="text-align: right;">Doyle, Arthur Conan</th>
<th style="text-align: right;">Eliot, George</th>
<th style="text-align: right;">London, Jack</th>
<th style="text-align: right;">Shakespeare, William</th>
<th style="text-align: right;">Twain, Mark</th>
<th style="text-align: right;">Wilde, Oscar</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">9</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">15</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">9</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

## Sentiment analysis

In a sentiment lexicon like Afinn, positive words have higher sentiment
scores. For example, “good” scores 3 while “bad” scores -3. In each
single document, I multiplied the sentiment score of each word by its
term frequency to balance different lengths of documents, then summed up
all multiplications to get one sentiment score.  
From the figure below, my selection of Jane Austen’s works are more
positive, while Agatha Christie’s are more negative.  
![](3-machine_learning_files/figure-markdown_strict/Sentiment%20analysis-1.png)

## Word cloud

Word clouds visualized word frequencies for each author (using the
`wordcloud` package, saving in the [wordcloud](wordcloud) folder). “One”
is the most prevalent among all authors. Notably, the famous detective
“Poirot” frequently appears in Agatha Christie’s works. Below is the
word cloud of her works.  
![Word cloud of Christie, Agatha](wordcloud/Christie,%20Agatha.png)
