## Gene expression response to physiological stress in two Hawaiian corals is dominated by ploidy and genotype

[![DOI](https://zenodo.org/badge/)](https://zenodo.org/badge/)

Erin E. Chille (1), Timothy G. Stephens (1), Deeksha Misri (2), Emma L. Strand (3), Hollie M. Putnam (3), and Debashish Bhattacharya (1) 
1. Department of Biochemistry and Microbiology, Rutgers University; New Brunswick, NJ 08901, USA.  
2. Department of Genetics, Rutgers University, New Brunswick, NJ 08901, USA.  
3. Department of Biological Sciences, University of Rhode Island; Kingston, RI 02881, USA.  

This repository provides data and scripts to analyze *Monitpora capitata* and *Pocillopora acuta* gene expression across two months of exposure to thermal and/or low pH stress conditions. This analysis provides genotype-controlled gene expression data characterizing the population-level response to stress of colonies inhabiting the sheltered Kāneʻohe Bay, Hawaiʻi. The RNA-seq data are available from NCBI’s SRA repository (BioProject: [PRJNA731596](https://www.ncbi.nlm.nih.gov/bioproject/?term=(PRJNA731596)%20AND%20bioproject_sra[filter]%20NOT%20bioproject_gap[filter])). Genome assemblies and predicted genes are available from [http://cyanophora.rutgers.edu/montipora/](http://cyanophora.rutgers.edu/montipora/) (Version 3) and [http://cyanophora.rutgers.edu/Pocillopora_acuta/](http://cyanophora.rutgers.edu/Pocillopora_acuta/) (Version 2). Read processing scripts are available at [https://doi.org/10.5281/zenodo.8077955](https://github.com/TimothyStephens/Kaneohe_Bay_coral_2018_PopGen.git) The color score data and scripts are available at [https://github.com/hputnam/Acclim_Dynamics](https://github.com/hputnam/Acclim_Dynamics). 


### Abstract

Transcriptome data are frequently used to investigate coral bleaching, however, the factors controlling gene expression in natural populations of these species is poorly understood. We studied two corals, *Montipora capitata* and *Pocillopora acuta*, that inhabit the sheltered Kāneʻohe Bay, Hawaiʻi. *M. capitata* colonies in the bay are outbreeding diploids, whereas *P. acuta* is a mixture of clonal diploids and triploids. Populations were sampled from six reefs and subjected to thermal and pH stress. RNA-seq data were generated to test two competing hypotheses: 1) gene expression is largely independent of genotype, reflecting a shared treatment-driven response (TDE) or, 2) genotype dominates gene expression, regardless of treatment (GDE). Our results strongly support the GDE model, even under severe stress. We suggest that post-transcriptional processes (e.g., control of translation, protein turnover) modify the signal from the transcriptome, and may underlie the observed differences in coral bleaching sensitivity via the downstream proteome and metabolome. 

### Figure 1

![Figure1](https://github.com/echille/Genotype_dominates_transcriptomic_response_Pacu/blob/main/Manuscript/230126_Chille_Erin_Genotype_Expression_Manuscript_Fig1.pdf)


---

**Execute all scripts in Rproj and knit to project**

### Data Organization 

This repository is organized by `Genome_Info`, `Manuscript`, `Output`, `Sample_Info`, and `Scripts`. 

`Sample_Info` includes data table summarizing sample metadata. `Genome_Info` includes transcript count matrices and relevant genomic data (e.g. functional annotations). `Scripts` and `Output` include all R scripts and results, respectively from all gene expression analyses. `Manuscript` includes all final figures and produced for the associated manuscript. 


### Contact

Any questions about this project and the contents of this repository can be directed to Erin Chille at erin_chille (at) scarletmail.rutgers.edu.
