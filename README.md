# Multiple Sclerosis Progression Multi-Omics Analysis

## Overview

This repository contains bioinformatics analyses investigating molecular differences between Relapsing-Remitting Multiple Sclerosis (RRMS) and Secondary Progressive Multiple Sclerosis (SPMS).

The project integrates transcriptomic, epigenomic, and machine learning approaches to identify biomarkers, molecular signatures, and biological pathways associated with MS progression.

---

## Research Objectives

* Identify genes differentially expressed between RRMS and SPMS.
* Identify differentially methylated regions (DMRs) associated with disease progression.
* Compare methylation signatures across immune cell populations.
* Discover molecular features associated with transition from RRMS to SPMS.
* Generate candidate biomarkers for future validation studies.
* Evaluate molecular predictors of disease progression using machine learning approaches.

---

## Key Findings

### CD4+ T Cells (GSE130029)

* Significant DMPs (FDR < 0.05): 1
* Significant DMRs (FDR < 0.05): 1,093
* Strong DMRs (FDR < 0.05 and |mean methylation difference| > 0.05): 268
* Unique genes associated with strong DMRs: 255

### CD8+ T Cells (GSE130030)

* Significant DMRs (FDR < 0.05): 1,512
* Strong DMRs (FDR < 0.05 and |mean methylation difference| > 0.05): 85
* Unique genes associated with strong DMRs: 75

### Shared DMR-Associated Genes

The following genes were identified in both CD4+ and CD8+ analyses:

* SAMD11
* CYP2E1
* SPRN
* AL161645.2
* MAST4
* CES1P1
* RPTOR
* COX19
* RP11-897M7.1

These genes represent candidate progression-associated methylation signatures observed across multiple immune cell populations.

---

## Datasets

### Transcriptomics

**GSE17048**

* Whole blood gene expression profiles
* RRMS vs SPMS comparison

GEO:
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE17048

### DNA Methylation

#### GSE130029

* Cell type: CD4+ T cells
* RRMS samples: 12
* SPMS samples: 8

GEO:
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE130029

#### GSE130030

* Cell type: CD8+ T cells
* RRMS samples: 10
* SPMS samples: 18

GEO:
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE130030

---

## Data Access and Reproducibility

Large processed methylation matrices are not stored in this repository due to GitHub file size limitations.

To reproduce the analyses, download the original datasets from GEO and place processed files in the expected directories.

### Required Datasets

#### Transcriptomics

* GSE17048

#### DNA Methylation

* GSE130029 (CD4+ T cells)
* GSE130030 (CD8+ T cells)

### Expected Directory Structure

```text
02_Processed_Data/
├── Transcriptomics/
├── Methylation/
│   ├── GSE130029_beta_clean.csv
│   ├── GSE130029_phenotype_metadata_clean.csv
│   ├── GSE130030_beta_clean.csv
│   └── GSE130030_phenotype_metadata_clean.csv
└── ML/
    └── FinalData.csv
```

The repository contains all analysis scripts required to reproduce the analyses presented in this project once the datasets are downloaded and placed in the appropriate directories.

Large intermediate files, R workspace files, trained models, and other generated artifacts are intentionally excluded from version control.

---

## Methods

### Differential Methylation Analysis

Pipeline:

1. Beta-value preprocessing
2. Conversion of beta values to M-values
3. Differential methylation testing using limma
4. Differentially methylated region identification using DMRcate
5. Gene annotation and biological interpretation

Criteria used to define strong DMRs:

* FDR < 0.05
* Absolute mean methylation difference > 0.05

### Differential Expression Analysis

Pipeline:

1. Gene expression preprocessing
2. RRMS vs SPMS comparison
3. Differential expression analysis
4. Identification of highly altered genes
5. Feature prioritization for downstream analyses

### Machine Learning

Machine learning analyses are being developed to evaluate the ability of molecular features to distinguish RRMS from SPMS samples and identify candidate progression-associated biomarkers.

---

## Repository Structure

```text
03_Code/
    Analysis scripts

04_Results/
    DMR/
        CD4/
        CD8/
        DMR_Comparison_Results.md
        DMR_Project_Summary.md

02_Processed_Data/
    ML/
        FinalData.csv
```

---

## Software

Analyses were performed primarily in R using:

* limma
* DMRcate
* minfi
* sva

Additional analyses and data processing were performed using Python and standard machine learning libraries.

---

## Research Focus

Multiple sclerosis progression, neuroimmunology, epigenomics, transcriptomics, bioinformatics, and machine learning.
