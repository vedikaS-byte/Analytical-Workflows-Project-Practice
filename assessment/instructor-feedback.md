# Instructor Feedback

## Exceeds Spec

-   **Automate: Running the entire analysis requires rendering one Quarto document**
    -   The Quarto document renders a complete document that contains the entire analysis, including an explanation of how `moving_avg()` was constructed using minimization and refactoring. This script allows for locally sourcing a function in another file, clearing space and enabling a cleaner analysis section in `paper.qmd`.
-   **Automate: Data import/cleaning is handled in its own script(s)**
    -   A separate script is stored in the `scratch` folder and contains code and additional comments (documentation) for data cleaning/tidying. This script can be referenced for data cleaning steps.
-   **Document: The README includes a flowchart and text explaining how the analysis works**
    -   The README is detailed and contains all required sections. The flowchart is included for reference, and the analysis includes insights on data cleaning/functional application to the entire data set utilized in `paper.qmd.`

# Collaboration

Collaborating with a fellow coder was an enriching experience. This experience introduced the opportunity to remotely collaborate via GitHub and practice forking/pulling and creating issues to improve elements of the analysis. For example, I provided feedback on what was missing to meet the requirements of the project, such as creating a data cleaning/tidying script that could be sourced locally for a cleaned dataset to save space.I also received helpful feedback, such as sections that were missing in my README.

1.  [Issue #16](https://github.com/vedikaS-byte/Analytical-Workflows-Project-Practice/issues/16)
2.  [Issue #15](https://github.com/vedikaS-byte/Analytical-Workflows-Project-Practice/issues/15)
3.  [Issue #18](https://github.com/vedikaS-byte/Analytical-Workflows-Project-Practice/issues/18)
4.  [Merged request for moving_avg() on 9/27/2025](https://github.com/vedikaS-byte/Analytical-Workflows-Project-Practice/commit/741efcef9abc7892ad5c1f5aa38f5b2f848e989a)
5.  [Resolved merge conflict #3](https://github.com/vedikaS-byte/Analytical-Workflows-Project-Practice/pull/3) with collaborator
6.  [Resolved merge conflict #12](https://github.com/vedikaS-byte/Analytical-Workflows-Project-Practice/pull/12) with collaborator

# Instructor feedback

## Automate

[E] **Running the entire analysis requires rendering one Quarto document**

[M] The analysis runs without errors

[M] **The analysis produces the expected output**

[E] **Data import/cleaning is handled in its own script(s)**

## Organize

[NY] Raw data is contained in its own folder - `project-practice.qmd` in `data` folder

[NY] Intermediate outputs are created and saved to a separate folder from raw data - No `outputs` or alike folder

[M] **At least one piece of functionality has been refactored into a function in its own file**

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs - Content in README is similar to what would be expected in `paper.qmd`

[E] **The README includes a flowchart and text explaining how the analysis works**

[M] **The code is appropriately commented**

[NY] **Variable and function names are descriptive and follow a consistent naming convention** - Column names varied from `nutrients` to `Sample_Date` likely because case conversion did not occur

## Scale

After cloning the repo on Workbench:

[M] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub Pages
