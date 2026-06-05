library(GEOquery)

gse <- getGEO("GSE17048", GSEMatrix = TRUE)

expr <- exprs(gse[[1]])
pheno <- pData(gse[[1]])

pheno_rrms_spms <- subset(
    pheno,
    `ms subtype:ch1` %in% c("RRMS", "SPMS")
)

sample_ids <- pheno_rrms_spms$geo_accession

expr_rrms_spms <- expr[, sample_ids]

dir.create(
    "02_Processed_Data/Transcriptomics",
    recursive = TRUE,
    showWarnings = FALSE
)

write.csv(
    expr_rrms_spms,
    "02_Processed_Data/Transcriptomics/GSE17048_RRMS_SPMS_expression.csv"
)

write.csv(
    pheno_rrms_spms,
    "02_Processed_Data/Transcriptomics/GSE17048_RRMS_SPMS_metadata.csv"
)

cat("Expression dimensions:\n")
print(dim(expr_rrms_spms))

cat("\nSample counts:\n")
print(table(pheno_rrms_spms$`ms subtype:ch1`))