# MS Progression Project Workflow

## Project Goal

Identify molecular signatures associated with progression from RRMS to SPMS using integrated methylation, transcriptomic, regulatory-element, and machine-learning analyses.

---

## 1. CD4+ T Cell Methylation Analysis (GSE130029)

### Input File

* GSE130029_beta_clean.csv

### File Contents

* CpG beta values
* Sample IDs
* Disease stage (RR, SP, HC)
* Age
* Sex

### Analysis Pipeline

1. Load beta matrix
2. Extract RRMS and SPMS samples
3. Generate metadata table
4. Convert beta values to M-values
5. Run limma differential methylation analysis
6. Run DMRcate regional methylation analysis
7. Export DMP and DMR results
8. Export BED files for regulatory analysis

### Expected Outputs

* DMPs_limma_results.csv
* DMRs_dmrcate_results.csv
* DMRs_dmrcate.bed

### Recovered Top DMRs

* chr7:27181418-27185512
* chr6:33279563-33284542
* chr17:57915665-57918682
* chr14:24640947-24642317
* chr3:46448084-46449636
* chr18:13611370-13611824
* chr13:113655468-113656424
* chr16:14397074-14397892
* chr6:152127812-152130332
* chr20:3065343-3066643

---

## 2. CD8+ T Cell Methylation Analysis (GSE130030)

### Input File

* GSE130030_beta_clean.csv

### File Contents

* CpG beta values
* Sample IDs
* Disease stage (RR, SP, HC)
* Age
* Sex

### Analysis Pipeline

1. Load beta matrix
2. Extract RRMS and SPMS samples
3. Generate metadata table
4. Convert beta values to M-values
5. Run limma differential methylation analysis
6. Run DMRcate regional methylation analysis
7. Export DMP and DMR results
8. Export BED files for regulatory analysis

### Expected Outputs

* DMPs_limma_results.csv
* DMRs_dmrcate_results.csv
* DMRs_dmrcate.bed

### Recovered Top DMRs

* chr1:3566304-3569899
* chr11:2321770-2323938
* chr2:45155201-45163188
* chr11:2889602-2891495
* chr6:29973407-29980376
* chr10:134594987-134602530
* chr6:30879515-30885567
* chr6:33039396-33044510
* chr6:28601269-28601519
* chr5:96037871-96039066

---

## 3. Regulatory Element Analysis

### Inputs

* DMR BED files

### Tools

* GeneHancer
* ENCODE
* HOMER

### Objectives

* Identify promoter overlap
* Identify enhancer overlap
* Assign putative target genes
* Characterize regulatory mechanisms associated with progression

### Expected Outputs

* Regulatory annotation tables
* Promoter/enhancer classifications
* Gene assignments
* Biological interpretations

---

## 4. Transcriptomic Analysis (GSE17048)

### Input Files

* 17048_RRMS_SPMS_expression_with_genes.xlsx
* FinalData.csv

### Dataset Contents

* Gene expression values
* RRMS samples
* SPMS samples

### Objectives

* Generate expression matrix for downstream analysis
* Identify candidate progression-associated genes
* Prepare machine-learning input dataset

### Expected Outputs

* Processed expression matrix
* Candidate gene lists

---

## 5. Machine Learning Analysis

### Input File

* FinalData.csv

### Code Files

* gene_discovery.ipynb
* gene_validation.ipynb

### Discovery Workflow

1. Load FinalData.csv
2. Perform feature selection
3. Identify top predictive genes
4. Train classifier
5. Evaluate ROC performance
6. Export top features

### Validation Workflow

External validation dataset:

* GSE247181

Expected validation outputs:

* validation_performance.png
* top_genes_heatmap.png

Known generated outputs:

* Top50_features.csv
* model.pkl
* ROC analyses
* Feature importance rankings
* Candidate biomarker genes

---

## Current Priorities

1. Recover DMR output files from rerun.
2. Recover regulatory-analysis outputs.
3. Recover machine-learning output files.
4. Document GeneHancer and HOMER workflow.
5. Reproduce complete analysis pipeline.
6. Prepare publication-ready repository structure.
