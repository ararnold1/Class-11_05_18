#gene Ontology

library(GO.db)
library(org.Hs.eg.db)

#create object

object <- org.Hs.egGO #make a object with all the human gene annotations

genes_to_map <- mappedkeys(object) #some sample genes to map

#makeing a list of genes to map 

genes_to_map_list <- as.list(object[genes_to_map])

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("GOstats", version = "3.8")


library("GOstats") #library to do stat analysis on genes

parameters <- new('GOHyperGParams', geneIds=c("1000", "100"), universeGeneIds=genes_to_map, ontology='BP', pvalueCutoff=0.001, conditional=F, testDirection='over', annotation="org.Hs.eg.db")

test_results <- hyperGTest(parameters)

summary(test_results)

results<- summary(test_results)

head(results, 5)

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("biomaRt", version = "3.8")

library(biomaRt)