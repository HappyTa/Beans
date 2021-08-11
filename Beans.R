setwd("~/GitHub/Beans/WD")
data = read.csv('subsettedBeans.csv', as.is = T)
data$Class = as.numeric(as.factor(data$Class))

# Load packages
library(factoextra)

B<- data$Area
C<-data$Perimeter
D<-data$MajorAxisLength
E<-data$MinorAxisLength
F<-data$AspectRation
G<-data$Eccentricity
H<-data$ConvexArea
I<-data$EquivDiameter
J <- data$Extent
K <- data$Solidity
L <- data$roundness
M <- data$Compactness
N <- data$ShapeFactor1
O <- data$ShapeFactor1
P <- data$ShapeFactor2
Q <- data$ShapeFactor4
class <- data$Class


#normalize data
meanB <- mean(B)
stB <- sd(B)
B <- (B-meanB )/stB

meanC <- mean(C)
stC <- sd(C)
C<- (C-meanC )/stC

meanD <- mean(D)
stD <- sd(D)
D<- (D-meanD )/stD

meanE <- mean(E)
stE <- sd(E)
E<- (E-meanE )/stE

meanF <- mean(F)
stF <- sd(F)
F<- (F-meanF )/stF

meanG <- mean(G)
stG <- sd(G)
G<- (G-meanG )/stG

meanH <- mean(H)
stH <- sd(H)
H <- (H-meanH)/stH

meanI <- mean(I)
stI <- sd(I)
I <- (I-meanI )/stI

meanJ <- mean(J)
sdJ <- sd(J)
J <-(J-meanJ)/sdJ

meanK <- mean(K)
sdK <- sd(K)
K <-(K-meanK)/sdK

meanL <- mean(L)
sdL <- sd(L)
L <-(L-meanL)/sdL

meanM <- mean(M)
sdM <- sd(M)
M <-(M-meanM)/sdM

meanN <- mean(N)
sdN <- sd(N)
N <-(N-meanN)/sdN

meanO <- mean(O)
sdO <- sd(O)
O <-(O-meanO)/sdO

meanP <- mean(P)
sdP <- sd(P)
P <-(P-meanP)/sdP

meanQ <- mean(Q)
sdQ <- sd(Q)
Q <-(P-meanQ)/sdQ

beannormal <- data.frame(B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,class)
colnames(beannormal) <- c("B","C","D","E","F","G","H",'I',"J","K","L","M","N","O","P","Q",'Class')



# # Compute PCA
# res.pca <- prcomp(beannormal, scale = TRUE)
# 
# 
# #visualizes the eigen values Show the percentage of variances explained by each principal component.
# fviz_eig(res.pca)
# 
# # Eigenvalues
# eig.val <- get_eigenvalue(res.pca)
# 
# # plot pc1 & pc2
# plot(res.pca$x[,1],res.pca$x[,2], xlab="PC1 (80%)", ylab = "PC2 (8%)", main = "PC1 / PC2 - plot")



