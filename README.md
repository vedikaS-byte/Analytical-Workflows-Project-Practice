---
bibliography: references.bib
---

# Analytical-Workflows-Project-Practice

This project serves to replicate a prior figure completed by [@schaefer2000] based on data published by McDowell et al. (2024). Moving nine-week averages were created for each concentration of contaminants (hereby referred to as "nutrients") at different streams in Puerto Rico before and after Hurricane Hugo. The primary objective is to establish a reproducible workflow that is replicable for interested environmental enthusiasts.

# Background

Hurricane Hugo (1989) greatly affected Puerto Rico's freshwater systems. The extent of the hurricane's impact can be visualized as moving averages (smoothed estimations) of changes in concentrations of contaminants over time at differently sampled streams. This can be replicated from an existing figure created by Schaefer et al.:

<img src="https://eds-214-workflows-reproducibility.github.io/course-materials/interactive/images/Schaefer_etal_2020_fig3.png"/>

# Data

The data is publicly available on the EDI Data Portal and appears as separate files for each sampling site. For this analysis, the "QuebradaCuenca1-Bisley.csv", "QuebradaCuenca2-Bisley.csv", "QuebradaCuenca3-Bisley.csv", and "RioMameyesPuenteRoto.csv" were downloaded for the Q1, Q2, Q3, and RMP sample sites. Each dataset contained the following shared columns necessary for the analysis:

-   `Sample_Date`: The specific sample date stored as a "date" type in YYYY-MM-DD format. Sampling was not evenly spaced out; for example some samples were sometimes taken months apart.

-   `Sample_ID`: The sample location, taken at four different locations in the Puerto Rico watershed.

-   `nutrients`: Categorical variable storing each nutrient that was sampled at each site as levels. The original data files stored these

# Contents

-   \scratch: Remote functions used for calculations are stored here. Currently, the primary script "project-practice.R" is stored here.

-   \figs: Contains graphs associated with yearly and nine-week moving averages per contaminant at each site.

-   \data: All raw data is stored here.

# Analysis

The\

# Citation

McDowell, William H., and USDA Forest Service. International Institute Of Tropical Forestry (IITF). 2024. “Chemistry of Stream Water from the Luquillo Mountains.” Environmental Data Initiative. <https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458>.
