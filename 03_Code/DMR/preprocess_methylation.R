# ==========================================
# Rebuild metadata and beta matrices
# from recovered GEO methylation files
# ==========================================

process_methylation <- function(input_file,
                                beta_output,
                                metadata_output) {

  cat("\nProcessing:", input_file, "\n")

  raw <- read.csv(
    input_file,
    row.names = 1,
    check.names = FALSE,
    stringsAsFactors = FALSE
  )

  # locate metadata rows
  stage_row <- which(rownames(raw) == "Stage")
  age_row   <- which(rownames(raw) == "Age")
  sex_row   <- which(rownames(raw) == "Sex")

  if (length(stage_row) == 0)
    stop("Could not find Stage row")

  samples <- colnames(raw)

  metadata <- data.frame(
    SampleID = samples,
    MS_Stage = as.character(raw[stage_row, ]),
    Age      = as.character(raw[age_row, ]),
    Sex      = as.character(raw[sex_row, ]),
    stringsAsFactors = FALSE
  )

  # keep only RR and SP
  metadata <- metadata[metadata$MS_Stage %in% c("RR", "SP"), ]

  metadata$MS_Stage <- ifelse(
    metadata$MS_Stage == "RR",
    "RRMS",
    "SPMS"
  )

  rownames(metadata) <- metadata$SampleID

  write.csv(
    metadata,
    metadata_output,
    row.names = TRUE
  )

  cat("Metadata saved:", metadata_output, "\n")

  beta <- raw[
    !(rownames(raw) %in% c("Stage", "Age", "Sex")),
    metadata$SampleID
  ]

  write.csv(
    beta,
    beta_output,
    row.names = TRUE
  )

  cat("Beta matrix saved:", beta_output, "\n")
}

# ==========================
# CD4
# ==========================

process_methylation(
  input_file =
"C:/Users/Dorin/OneDrive/MS/02_Processed_Data/Methylation/GSE130029_beta_clean.csv",

  beta_output =
"C:/Users/Dorin/OneDrive/MS/02_Processed_Data/Methylation/cleaned_gse130029_beta_matrix.csv",

  metadata_output =
"C:/Users/Dorin/OneDrive/MS/02_Processed_Data/Methylation/GSE130029_phenotype_metadata_clean.csv"
)

# ==========================
# CD8
# ==========================

process_methylation(
  input_file =
"C:/Users/Dorin/OneDrive/MS/02_Processed_Data/Methylation/GSE130030_beta_clean.csv",

  beta_output =
"C:/Users/Dorin/OneDrive/MS/02_Processed_Data/Methylation/cleaned_gse130030_beta_matrix.csv",

  metadata_output =
"C:/Users/Dorin/OneDrive/MS/02_Processed_Data/Methylation/GSE130030_phenotype_metadata_clean.csv"
)

cat("\nDone.\n")