# Data Recovery

## Recovered Assets

### Code

* DMR_workflow.r
* gene_discovery.ipynb
* gene_validation.ipynb

### Processed Methylation Data

* GSE130029_beta_clean.csv
* GSE130030_beta_clean.csv

Both methylation files contain:

* CpG beta values
* Sample IDs
* Stage labels (RR/SP/HC)
* Age
* Sex

### Processed Transcriptomic Data

* FinalData.csv
* 17048_RRMS_SPMS_expression_with_genes.xlsx

### Raw Data

* GSE130030_RAW.tar

### Manuscript

* Current manuscript draft

---

## Missing / Not Yet Recovered

### DMR Outputs

* DMRs_dmrcate_results.csv
* DMPs_limma_results.csv
* DMRs_dmrcate.bed

### Regulatory Analysis Outputs

* HOMER outputs
* ENCODE overlap outputs
* GeneHancer outputs
* Regulatory annotation tables

### Machine Learning Outputs

* Top50_features.csv
* model.pkl
* validation_performance.png
* top_genes_heatmap.png
* Feature importance plots
* ROC figures

---

## Notes

The methylation metadata is embedded directly within:

* GSE130029_beta_clean.csv
* GSE130030_beta_clean.csv

Separate metadata files may have been generated later but are not required to recover Stage, Age, and Sex information.
