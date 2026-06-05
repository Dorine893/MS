library(GEOquery)
library(limma)

gse <- getGEO("GSE17048", GSEMatrix = TRUE)

expr <- exprs(gse[[1]])
pheno <- pData(gse[[1]])

keep <- pheno$`ms subtype:ch1` %in% c("RRMS","SPMS")

expr <- expr[, keep]
pheno <- pheno[keep, ]

group <- factor(
    pheno$`ms subtype:ch1`,
    levels = c("RRMS","SPMS")
)

design <- model.matrix(~group)

fit <- lmFit(expr, design)
fit <- eBayes(fit)

deg_results <- topTable(
    fit,
    coef = "groupSPMS",
    number = Inf
)

dir.create(
    "04_Results/Transcriptomics",
    recursive = TRUE,
    showWarnings = FALSE
)

write.csv(
    deg_results,
    "04_Results/Transcriptomics/DEGs_limma_results.csv"
)

sig_deg <- subset(
    deg_results,
    adj.P.Val < 0.05
)

write.csv(
    sig_deg,
    "04_Results/Transcriptomics/Significant_DEGs.csv"
)

cat("Total probes:", nrow(deg_results), "\n")
cat("Significant probes:", nrow(sig_deg), "\n")