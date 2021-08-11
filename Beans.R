setwd("~/GitHub/Beans/WD")
data = read.csv('subsettedBeans.csv', as.is = T)

# Load packages
library(factoextra)

data$Class = as.numeric(as.factor(data$Class))

# Compute PCA
res.pca <- prcomp(data, scale = TRUE)

# Graph eigenvalues
fviz_eig(res.pca)

# Graph of individuals. Individuals with a similar profile are grouped together
fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

# Graph of variables. Positive correlated variables point to the same side of the plot. Negative correlated variables point to opposite sides of the graph.
fviz_pca_var(res.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)



