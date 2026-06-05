# GSE130030 RRMS vs SPMS Methylation Analysis

Dataset:

* GSE130030
* CD8+ T cells
* RRMS (n=10)
* SPMS (n=18)

Preprocessing:

* Beta matrix dimensions: 471,336 CpGs × 28 samples
* Metadata extracted from GEO
* Groups assigned as RRMS vs SPMS
* Beta values transformed to M-values using:

M = log2((Beta + 1e-6)/(1 - Beta + 1e-6))

Differential Methylation Analysis:

* Method: limma
* Significant CpGs (FDR < 0.05): 0
* CpGs with nominal P < 0.001: 1004

Differentially Methylated Regions:

* Method: DMRcate
* Total DMRs identified: 14,572
* DMRs with min_smoothed_fdr < 0.05: 1,512
* High-confidence DMRs:

  * min_smoothed_fdr < 0.05
  * |mean methylation difference| > 0.05
  * Total: 85

Top DMR-associated genes:

* SAMD11
* ANKMY1
* RPTOR
* PTPRN2
* HLA-DRB5
* CYP2E1
* GIMAP5
* IRAK2
* HLA-A
* CLEC4C
* SLC1A3
* TP73
* MYO1F
* PLA2G4C

Gene List:

* 75 unique genes extracted from high-confidence DMRs
* Saved as:
  Strong_DMR_Gene_List.csv

Output Files:

* DMPs_limma_results.csv
* DMRs_dmrcate_results.csv
* Strong_DMRs_FDR05_Effect05.csv
* Strong_DMR_Summary.csv
* Strong_DMR_Gene_List.csv

