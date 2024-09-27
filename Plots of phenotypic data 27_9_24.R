##### QTL MAPPING AMPLE X DEE SPRING 2024 #####

require(readxl)


##### Importing and pre-processing data  #####
#1. Import dataset
Phenotypic_scoresA <- read_excel("C:/Users/bm43561/OneDrive - The James Hutton Institute/2024 Yasmin's QTL mapping/Phenotypic data/Phenotypic scores.xlsx", 
                                 sheet = "25_9_24", range = "A2:C174")
Phenotypic_scoresA <- Phenotypic_scoresA[complete.cases(Phenotypic_scoresA),]

Phenotypic_scoresB <- read_excel("C:/Users/bm43561/OneDrive - The James Hutton Institute/2024 Yasmin's QTL mapping/Phenotypic data/Phenotypic scores.xlsx", 
                                 sheet = "25_9_24", range = "D2:F179")
Phenotypic_scoresB <- Phenotypic_scoresB[complete.cases(Phenotypic_scoresB),]

#2. Rename first column
colnames(Phenotypic_scoresA)[1] <- "Individual"
colnames(Phenotypic_scoresB)[1] <- "Individual"

#3. Merge two sets
Phenotypic_scores <- rbind(Phenotypic_scoresA, Phenotypic_scoresB)

#4. Clean environment leaving only ready file
rm(list=setdiff(ls(), "Phenotypic_scores"))

###### 2. Plots #######
#1. Senescence is a qualitative trait (measured in categories).
#In R this is called a factor
help(as.factor) #read more
Phenotypic_scores$Senescence <- as.factor(Phenotypic_scores$Senescence)

#2. Plot is the main function to draw graphs
help(plot) #read more
plot(Phenotypic_scores$Senescence)
#The arguments let you change colours and customize the plot
plot(Phenotypic_scores$Senescence, 
     col = "pink",
     border = F)

