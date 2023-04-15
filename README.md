# GeorgeTree

This my simple project of creating my tree classification package using R

Install instruction

You need to install devtools package to get all things work

```{r}
if (!requireNamespace("devtools", quietly = TRUE)) { install.packages("devtools") }
```

After you install devtools

```{r}
devtools::install_github("fantasia1314/GeorgeTree")

```

There are four function here:

1.  classification_tree: train the model using classification tree

2.  regression_tree: train the model using regression tree

3.  predict_tree: make prediction use the trained model

4.  performance_tree: plot the model and show how well you model did.
