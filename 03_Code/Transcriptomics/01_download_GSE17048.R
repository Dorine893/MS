library(GEOquery)

gse <- getGEO("GSE17048", GSEMatrix = TRUE)

expr <- exprs(gse[[1]])
pheno <- pData(gse[[1]])

dir.create("02_Processed_Data/Transcriptomics",
           recursive = TRUE,
           showWarnings = FALSE)

write.csv(
    expr,
    "02_Processed_Data/Transcriptomics/GSE17048_expression_matrix.csv"
)

write.csv(
    pheno,
    "02_Processed_Data/Transcriptomics/GSE17048_metadata.csv"
)

cat("Expression matrix dimensions:\n")
print(dim(expr))

cat("\nMS subtype counts:\n")
print(table(pheno$`ms subtype:ch1`))