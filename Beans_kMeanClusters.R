setwd("~/GitHub/Beans/WD")
#setwd("C:/Users/mortimerk1/Desktop/Year 3/Summer 2021/Machine Learning/Final Project/Beans/WD")

data = read.csv('subsettedBeansNoColumns.csv', as.is = T)
#data = read.csv('FullBeans.csv', as.is = T)

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

clusters = kmeans(data1, 2, nstart = 2, algorithm = "Lloyd", iter.max = 1000)

centers = clusters$centers

print(centers)