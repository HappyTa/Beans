setwd("~/GitHub/Beans/WD")
data = read.csv('subsettedBeans.csv', as.is = T)

# set column names to varible name
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

data1 <- data.frame(B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q)
colnames(data1) <- c("B","C","D","E","F","G","H",'I',"J","K","L","M","N","O","P","Q")

#rownames(data1) <- c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16")
#Different way to calculate covariance matrix


#this is for the heptathlon data
#data("heptathlon", package="HSAUR")
#print(heptathlon)

#lets make all events in the same direction so that 
#large values are good
#heptathlon$hurdles <- max(heptathlon$hurdles)-heptathlon$hurdles
#heptathlon$run200m <- max(heptathlon$run200m)-heptathlon$run200m
#heptathlon$run800m <- max(heptathlon$run800m)-heptathlon$run800m
#can calculate the correlation coefficents in each case to see if any are indepedent
#which relates the covariance matrix
#also note did -8 because I want to get rid of the scores or output
#I do this through out this program
correl <- round(cor(data[,-17]),2)
print(correl)
#this next command does the prinicple component analysis for you
data_pca <- prcomp(data[,-17],scale=T)
print(summary(data_pca))
print(data_pca)

#this gets the first principle component
pc1 <- data_pca$rotation[,1]
print(pc1)


#for the last command when I print out the first principle component you should notice that
#the absolute value of the weight for the javelin is very berry small therefore 
#if you we use the first prinicple component to eliminate a feature then we would elimate this feature 
#since it has the least amount of variability and hence is not informative or it is not an important feature. 


#next command gives you the values that were used to normalize the data
#which needs to be done for PCA except does not need to be done for the output
center <- heptathlon_pca$center
scale <- heptathlon_pca$scale
#the next line is use the linear combination for principle component to do regression
#You can use PCA to domutiple linear regression
pred <- predict(heptathlon_pca)[,1]
print(pred)
corscore <- cor(heptathlon$score, pred)
#this correlation coefficient lets us know how good we did with our prediction
print(corscore)
#this next one does a biplot which I talked about briefly in the video
plot(heptathlon_pca)
pdf("biplot_PC1_PC2.pdf")
biplot(heptathlon_pca,col=c("gray","black"))
dev.off()


