
#Libraries 
library(plyr)
library(vegan)
library(dplyr)
library(tidyverse)
library(readxl)
library(writexl)
library(Rmisc)
library(ggplot2)
library(ggridges)
library(hrbrthemes)
library(viridis)
library(mixOmics)

#Read in data
treatment_colorscore= read_tsv("2-TestStripDX_analysis/results.TestStripDX.8d1ac01.combined_results.txt")
str(treatment_colorscore)

montipora_data= treatment_colorscore %>% filter(Spp=="Mon" & Sample!="M36")

head(montipora_data)

# PCA Data matrix
montipora_matrix= as.matrix(montipora_data[,c(6:8,10:12,14:16,18:20)]) 

rownames(montipora_matrix)= montipora_data$Sample


# Color Score distance matrix
montipora_dist= vegdist(montipora_matrix, method="euclidean")


# PCA Calculation
montipora_PCA <- prcomp(t(montipora_dist)) #calculate eigengenes
pc.data <- summary(out<-prcomp(t(montipora_dist))); pc.data
plot(out)


# Extract PC1 as Colorscore Value
montipora_colorscore <- as.data.frame(montipora_PCA$x[, 1]) 
montipora_colorscore$Sample= rownames(montipora_matrix)

montipora_colorscore <- montipora_colorscore %>% dplyr::rename(., Color_score = `montipora_PCA$x[, 1]`)

# Plot PCA 
percentVar <- montipora_PCA$sdev^2/sum(montipora_PCA$sdev^2) #save % variation by PC1 and PC2
d <- data.frame(PC1 = montipora_PCA$x[, 1], PC2 = montipora_PCA$x[, 2], montipora_data) #make a dataframe containing all plotting info

filter(d) %>% ggplot(aes_string(x = "PC1", y = "PC2")) + 
  geom_point(size = 3, aes(colour=Reef)) +
  xlab(paste0("PC1: ", round(percentVar[1] * 100), "% variance")) +
  ylab(paste0("PC2: ", round(percentVar[2] * 100), "% variance")) +
  coord_fixed() +
  theme_bw() + #Set background color
  theme(panel.border = element_blank(), # Set border
        panel.grid.major = element_blank(), #Set major gridlines
        panel.grid.minor = element_blank(), #Set minor gridlines
        axis.line = element_line(colour = "black", size = 0.6), #Set axes color
        plot.background=element_blank(), #Set the plot background
        axis.title = element_text(size = 14))#Axis title size

# Final Data Frame
montipora_data_final= left_join(montipora_data, montipora_colorscore, by= "Sample")

#Histogram of Data
montipora_data_final$Reef= factor(montipora_data_final$Reef,levels= c("FMH","AL", "MML", "SGL", "PGL", "LRM"))

hist(montipora_data_final$Color_score)

#Boxplot
montipora_means <- summarySE(montipora_data_final, measurevar = c("Color_score"), groupvars = c("Reef"))
#montipora_means %>% write_xlsx("1-Bleaching_score_analysis/Montipora_bleaching_score_summary_data.xlsx")


filter(montipora_data_final) %>% ggplot(aes(x=Reef, y=-Color_score)) + # fill=name allow to automatically dedicate a color for each group
  geom_jitter(alpha = 0.5, aes(color=Reef)) +
  geom_violin(alpha = 0, aes(color=Reef)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme_bw() + #Set background color
  theme(panel.border = element_blank(), # Set border
        panel.grid.major = element_blank(), #Set major gridlines
        panel.grid.minor = element_blank(), #Set minor gridlines
        axis.line = element_line(colour = "black", size = 0.6), #Set axes color
        plot.background=element_blank(), #Set the plot background
        axis.title = element_text(size = 14))#Axis title size

Reef_order=c("AL","MML","FMH","LRM","SGL", "PGL")
montipora_data_final$Reef <- factor(montipora_data_final$Reef, levels=Reef_order)
summary_plot <- filter(montipora_data_final) %>% ggplot(aes(x=-Color_score, y = Reef, fill = after_stat(x))) +
  #xlim(-2.5,11) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis(name = "Bleaching Score", option = "C") +
  labs(title = 'TestStripDX Score of Montipora June 2023') +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)); summary_plot

ggsave("2-TestStripDX_analysis/Montipora_TestStripDX_Score_June23_plot.pdf", summary_plot, device=cairo_pdf, width = 11, height = 8.5, units = "in")

# Partial Least Squares Analysis
mixOmic_plsda <- plsda(montipora_matrix, montipora_data_final$Reef, ncomp = 12)
plotVar(mixOmic_plsda, plot = F)
plsda_plot <- biplot(mixOmic_plsda, cutoff = .8); plsda_plot
plotIndiv(mixOmic_plsda, ind.names = TRUE, ellipse = TRUE, legend = TRUE)

#ggsave("2-TestStripDX_analysis/Montipora_June23_TestStripDX_PLSDA_80cor_biplot.pdf", plsda_plot, device=cairo_pdf, width = 11, height = 8.5, units = "in")


```
