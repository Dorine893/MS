required_pkgs <- c("limma", "DMRcate", "sva", "minfi", 
                   "IlluminaHumanMethylation450kanno.ilmn12.hg19")
missing <- required_pkgs[!(required_pkgs %in% installed.packages()[, "Package"])]
if (length(missing) > 0) {
  stop("Install missing packages before running script: ", 
       paste(missing, collapse = ", "))
}

library(limma)
library(DMRcate)
library(sva)
library(minfi)
library(IlluminaHumanMethylation450kanno.ilmn12.hg19)
cat("Libraries loaded.\n")

beta_file       <- "cleaned_gse130030_beta_matrix.csv"
metadata_file   <- "GSE130030_phenotype_metadata_clean.csv"

dmp_output_file <- "DMPs_limma_results.csv"
dmr_output_file <- "DMRs_dmrcate_results.csv"
dmr_bed_file    <- "DMRs_dmrcate.bed"

beta_matrix <- read.csv(beta_file, row.names = 1, check.names = FALSE)
metadata    <- read.csv(metadata_file, row.names = 1)

cat("Original Beta Matrix samples:", ncol(beta_matrix), "\n")
cat("Original Metadata samples:", nrow(metadata), "\n")

sample_order <- rownames(metadata)
if (!all(sample_order %in% colnames(beta_matrix))) {
  stop("Mismatch: some metadata sample IDs not in beta matrix columns.")
}
beta_matrix <- beta_matrix[, sample_order]

cat("Filtered Beta Matrix samples:", ncol(beta_matrix), "\n")
cat("--------------------------------------\n")

if (!"MS_Stage" %in% colnames(metadata)) {
  stop("metadata must contain column 'MS_Stage'")
}

metadata$condition <- factor(metadata$MS_Stage, levels = c("RRMS","SPMS"))
design <- model.matrix(~condition, data = metadata)

cat("Design matrix (first 6 rows):\n")
print(head(design))
cat("Design rows:", nrow(design), "Beta columns:", ncol(beta_matrix), "\n")
cat("--------------------------------------\n")

m_matrix <- ilogit2(as.matrix(beta_matrix))
cat("M-matrix dimensions:", dim(m_matrix), "\n")
cat("--------------------------------------\n")

cat("Fitting limma model...\n")
fit <- lmFit(m_matrix, design)

contrast_matrix <- makeContrasts(SPMSvsRRMS = conditionSPMS, levels = design)
fit2 <- contrasts.fit(fit, contrast_matrix)
fit2 <- eBayes(fit2)

coef_name <- colnames(contrast_matrix)[1]
cat("Using contrast coefficient:", coef_name, "\n")

dmp_results <- topTable(fit2, coef = coef_name, number = Inf, sort.by = "P")
write.csv(dmp_results, dmp_output_file, row.names = TRUE)
cat("DMPs saved to:", dmp_output_file, "\n")

sig_count <- sum(dmp_results$adj.P.Val < 0.05, na.rm = TRUE)
cat("Number of individually significant CpGs:", sig_count, "\n")
cat("--------------------------------------\n")

cat("Preparing DMRcate annotation...\n")

coef_idx <- which(colnames(design) == "conditionSPMS")

annot <- cpg.annotate(
  object        = m_matrix,
  datatype      = "array",
  what          = "M",
  analysis.type = "differential",
  design        = design,
  coef          = coef_idx, 
  fdr           = 0.5,
  arraytype     = "450K"
)

cat("Running dmrcate...\n")
dmrs <- dmrcate(annot, lambda = 1000, C = 2, pcutoff = 0.5)

dmr_ranges <- extractRanges(dmrs)

if (length(dmr_ranges) > 0) {
  dmr_table  <- as.data.frame(dmr_ranges)
  write.csv(dmr_table, dmr_output_file, row.names = FALSE)
  cat("DMR results saved to:", dmr_output_file, "\n")
  
  if ("writeBed" %in% ls("package:DMRcate")) {
    DMRcate::writeBed(dmrs, file = dmr_bed_file, color = "255,0,0")
    cat("DMR BED saved to:", dmr_bed_file, "\n")
  } else {
    cat("writeBed() not found in DMRcate; skipping BED export.\n")
  }
  
  top_n <- 10
  cat("\nTop", top_n, "DMRs (sorted by Stouffer p-value):\n")
  top_dmrs <- head(dmr_table[order(dmr_table$Stouffer, decreasing = FALSE), ], top_n)
  print(top_dmrs[, c("seqnames", "start", "end", "no.cpgs", "Stouffer")])
  
} else {
  cat("No DMRs detected with current thresholds.\n")
}

cat("Pipeline finished successfully!\n")