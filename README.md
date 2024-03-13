[![DOI](https://zenodo.org/badge/608901431.svg)](https://zenodo.org/doi/10.5281/zenodo.10656043)

## GENERAL INFORMATION

### A. Paper associated with this archive
**Citation:** Lai et al. (2024) Detecting non-additive biotic interactions and assessing their biological relevance among temperate rainforest trees. *The American Naturalist*. 

**Brief abstract:** Interactions between and within abiotic and biotic processes generate non-additive density-dependent effects on species performance that can vary in strength or direction across environments. If ignored, non-additivities can lead to inaccurate predictions of species responses to environmental and compositional changes. While there are increasing empirical efforts to test the constancy of pairwise biotic interactions along environmental and compositional gradients, few assess both simultaneously. Using a nationwide forest inventory that spans broad ambient temperature and moisture gradients throughout New Zealand, we address this gap by analysing diameter growth of six focal tree species as a function of neighbour densities and climate, as well as neighbour $\times$ climate and neighbour $\times$ neighbour statistical interactions. The most complex model featuring all interaction terms had the highest predictive accuracy. Compared to climate variables, biotic interactions typically had stronger effects on diameter growth, especially when subjected to non-additivities from local climatic conditions and the density of intermediary species. Furthermore, statistically strong (or weak) non-additivities could be biologically irrelevant (or significant) depending on whether a species pair typically interacted under average or more extreme conditions. Our study highlights the importance of considering both the statistical potential and the biological relevance of non-additive biotic interactions when assessing species performance under global change.

### B. Originators
- Hao Ran Lai^a,b^
- Peter J. Bellingham^c,d^
- James K. McCarthy^c^
- Sarah J. Richardson^c^
- Susan K. Wiser^c^
- Daniel B. Stouffer^a^

*Affiliations:* \
^a^ Centre for Integrative Ecology, School of Biological Sciences, University of Canterbury, Christchurch 8140, Aotearoa New Zealand \
^b^ Bioprotection Aotearoa, Centre of Research Excellence, Aotearoa New Zealand \
^c^ Manaaki Whenua--Landcare Research, PO Box 69040, Lincoln 7640, Aotearoa New Zealand \
^d^ School of Biological Sciences, University of Auckland, Auckland 1142, Aotearoa New Zealand 
  
### C. Contact information
Name: Hao Ran Lai \
Mailing address: School of Biological Sciences, University of Canterbury, Christchurch 8140, New Zealand \
Email: hrlai.ecology@gmail.com

### D. Dates of data collection
2002-2014

### E. Geographic Location(s) of data collection
New Zealand

### F. Funding Sources
Marsden Fund Council from New Zealand Government funding managed by the Royal Society Te Apārangi (grant MFP-UOC2102 to HRL and 16-UOC-008 to DBS), Bioprotection Aotearoa Centre of Research Excellence (HRL), and the New Zealand Ministry of Business, Innovation and Employment's Strategic Science Investment Fund (PJB, JKM, SJR, SKW)

## ACCESS INFORMATION
### 1. Licenses/restrictions placed on the data or code
Creative Commons licences (3.0 NZ, 4.0 International), see also https://datastore.landcareresearch.co.nz/terms_of_use

### 2. Data derived from other sources
NA

### 3. Recommended citation for this data/code archive
Code: https://zenodo.org/doi/10.5281/zenodo.10656043 \
Data: https://doi.org/10.25898/sv0n-sw84

## DATA & CODE FILE OVERVIEW
This repository mainly consist of 1 data file and 1 code script and this README document, with the following data and code filenames and variables:

1. data_clean.csv (also available for download from the National Vegetation Survey Databank (NVS) https://doi.org/10.25898/sv0n-sw84, which is hosted by Manaaki Whenua Landcare Research of New Zealand to permanently store publicly available data; the link also contains some information about the raw data that was used to generate this cleaned data)
    - `Plot`: forest plot ID
    - `Focal`: focal species ID
    - `D1`: focal tree diameter	
    - `G`: focal diameter growth
    - `DACCUP`: neighbour density of Dacrydium cupressinum
    - `OTHERS`: neighbour density of other species	
    - `WEIRAC`: neighbour density of Weinmannia racemosa	
    - `LOPMEN`: neighbour density of Lophozonia menziesii	
    - `PODLAE`: neighbour density of Podocarpus laetus	
    - `FUSCLI`: neighbour density of Fuscospora cliffortioides	
    - `QUISER`: neighbour density of Quintinia serrata	
    - `temp_meanAnn`: mean annual temperature
    - `vpd_mar`: vapour pressure deficit
    - Note: all predictors are scaled as described in the main text
2. fit_models.R
    - `R` script to read data, fit all candidate models, and save models as outputs
    - please see the script for more comments
        
Code scripts and workflow

1. The single R script will read data, fit all candidate models, and save models as outputs
2. The brms model takes a while to run

## SOFTWARE VERSIONS
`R` v4.2.1, `brms` v2.18.3, `loo` v2.5.1
