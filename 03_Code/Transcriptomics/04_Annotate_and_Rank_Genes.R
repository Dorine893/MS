library(GEOquery)
library(limma)

gse <- getGEO("GSE17048", GSEMatrix = TRUE)

expr <- exprs(gse[[1]])
pheno <- pData(gse[[1]])
fdat <- fData(gse[[1]])

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
    number = Inf,
    sort.by = "P"
)

deg_results$ProbeID <- rownames(deg_results)

annotated <- merge(
    deg_results,
    fdat[, c("ID","Symbol","Entrez_Gene_ID")],
    by.x = "ProbeID",
    by.y = "ID",
    all.x = TRUE
)

rrms_cols <- pheno$geo_accession[
    pheno$`ms subtype:ch1` == "RRMS"
]

spms_cols <- pheno$geo_accession[
    pheno$`ms subtype:ch1` == "SPMS"
]

annotated$Mean_RRMS <- rowMeans(
    expr[annotated$ProbeID, rrms_cols]
)

annotated$Mean_SPMS <- rowMeans(
    expr[annotated$ProbeID, spms_cols]
)

annotated$Delta_abs <- abs(
    annotated$Mean_SPMS -
    annotated$Mean_RRMS
)

annotated <- annotated[
    order(-annotated$Delta_abs),
]

dir.create(
    "04_Results/Transcriptomics",
    recursive = TRUE,
    showWarnings = FALSE
)

write.csv(
    annotated,
    "04_Results/Transcriptomics/Annotated_Transcriptomic_Ranking.csv",
    row.names = FALSE
)

write.csv(
    head(annotated, 50),
    "04_Results/Transcriptomics/Top50_Genes.csv",
    row.names = FALSE
)

write.csv(
    head(annotated, 100),
    "04_Results/Transcriptomics/Top100_Genes.csv",
    row.names = FALSE
)

write.csv(
    head(annotated, 200),
    "04_Results/Transcriptomics/Top200_Genes.csv",
    row.names = FALSE
)

write.csv(
    head(annotated, 500),
    "04_Results/Transcriptomics/Top500_Genes.csv",
    row.names = FALSE
)

cat("Ranking complete\n")