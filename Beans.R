setwd("~/GitHub/Beans/WD")
data = read.csv('subsettedBeans.csv', as.is = T)

# Load packages
library(factoextra)

data$Class = as.numeric(as.factor(data$Class))

# Compute PCA
res.pca <- prcomp(data, scale = TRUE)

fviz_eig(res.pca)








