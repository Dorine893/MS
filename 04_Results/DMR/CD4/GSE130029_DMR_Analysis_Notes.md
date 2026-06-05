# GSE130029 CD4+ T Cell DMR Analysis Notes

Dataset: GSE130029

Cell Type: CD4+ T Cells

Comparison:

* RRMS = 12 samples
* SPMS = 8 samples

Preprocessing:

* Identified metadata rows embedded within beta matrix:

  * Stage
  * Sex
  * Age
* Removed all three rows before final analysis.
* Created cleaned file:
  GSE130029_beta_clean_FIXED.csv

Quality Control:

* Final beta matrix dimensions:
  469,662 CpGs × 31 samples
* No NA values after cleanup.
* No infinite values after M-value transformation.

Differential Methylation Analysis:

* Method: limma
* Contrast: SPMS vs RRMS
* Significant DMPs (FDR < 0.05): 1
* Individually significant probes used by DMRcate: 5

DMR Analysis:

* Method: DMRcate
* Lambda = 1000
* C = 2
* pcutoff = 0.5

Top DMRs:

* chr7: 27,181,418-27,185,512 (55 CpGs)
* chr6: 33,279,563-33,284,384 (103 CpGs)
* chr17: 57,915,665-57,918,682 (11 CpGs)
* chr14: 24,640,947-24,642,317 (14 CpGs)
* chr3: 46,448,084-46,449,636 (13 CpGs)

Key Observation:
Despite only one FDR-significant CpG, DMR analysis detected strong regional methylation differences between RRMS and SPMS, suggesting coordinated methylation changes across neighboring CpGs rather than isolated loci.

Status:
Final cleaned analysis completed successfully.
