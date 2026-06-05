# Transcriptomics Notes

## Dataset

GSE17048

Platform:
Illumina HumanHT-12 V3.0 Expression BeadChip (GPL6947)

Comparison:
RRMS vs SPMS

Samples:

* RRMS = 36
* SPMS = 20

---

## Differential Expression Results

Total probes tested:
37,804

Raw p < 0.05:
1,455 probes

Raw p < 0.01:
260 probes

FDR < 0.05:
0 probes

Interpretation:

Transcriptomic differences between RRMS and SPMS appear modest in whole blood. No genes remained significant after multiple-testing correction.

---

## Transcriptomic Candidate Gene Selection

Original ranking:

* Delta_abs (absolute mean expression difference)

Revised ranking:

* Raw p-value ranking
* Duplicate genes removed
* LOC genes removed where possible

Output file:

04_Results/Transcriptomics/Top100_Unique_Genes_PValue.csv

---

## Top 100 Candidate Genes

CABP7
REEP2
TMEM165
FAM107A
C21orf37
SLC6A5
FLJ40288
KRTAP10-4
IRF5
KIAA0753
CENPH
AMAC1
CGB7
HERV-FRD
C6orf211
TACR2
SERPINC1
PARVA
GSK3A
GPRC6A
CHUK
KIAA1383
GPR45
CDKN3
MGC22014
SLC28A3
OXSM
RCAN2
NEUROG3
XRCC3
PPIL6
HNF4A
LINGO2
SYNPO2L
TPRXL
IL26
TGFB1
C10orf85
MRPL13
KCNJ5
RFPL1S
CCND1
CCDC114
PWP2
NUDT13
C9orf103
DAO
CER1
HES1
PRRX1
ECM1
FAM139A
RAD9B
TPPP3
PSMC1
SNRPD1
GOLT1B
C20orf27
FKSG2
RHCE
C14orf37
GADL1
CCDC112
NOTUM
XRN1
UBE2S
XAGE1E
APOA4
SNHG3
C10orf99
SSR1
DEFB106B
FLJ43692
KRTCAP3
CNTN3
QPRT
CPA4
AZI2
C6orf117
GSTT2
FAM153C
NAF1
LRBA
DLEC1
PDAP1
MEST
ZNF613
KIAA1107
KRT33A
KIF21A
LUZP4
FNDC5
FAM7A3
MAGI1
HEXIM1
MYL5
DPY19L2P4
AMELX
MEOX1
MLZE

---

## Notable Candidate Genes

IRF5

* Strongest immune-related candidate identified.
* Known regulator of innate immune signaling.
* Previously implicated in autoimmune disease and multiple sclerosis.

CHUK

* Encodes IKKα.
* Component of NF-κB signaling pathway.

IL26

* Cytokine involved in immune responses.

TGFB1

* Major immunoregulatory cytokine.
* Relevant to T-cell regulation and neuroinflammation.

GSK3A

* Signaling kinase implicated in immune and inflammatory pathways.

CCND1

* Cell-cycle regulation.

LINGO2

* Neurologically relevant candidate.

---

## Working Hypotheses

1. Extensive epigenetic remodeling occurs during MS progression.

2. Transcriptomic alterations are comparatively modest in whole blood.

3. Whole-blood expression may mask cell-specific biological signals.

4. Methylation changes may precede measurable transcriptional changes.

5. Multi-omic integration may identify biologically important genes even when transcriptomic significance is weak.


## Investigate
IRF5
CHUK
IL26
TGFB1
GSK3A
CCND1
LRBA
LINGO2