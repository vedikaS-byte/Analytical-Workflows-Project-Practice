# Automate

#### Running the entire analysis requires rendering one Quarto document
Not met - There needs to be work done with ggplot possibly? Could not render on my computer. See below for reasoning. 

Error in `facet_wrap()`:
! `nrow` must be a whole number or `NULL`, not a <formula> object.
Backtrace:
    ▆
 1. ├─... %>% facet_wrap(~ factor(nutrients), )
 2. └─ggplot2::facet_wrap(nrow = ~factor(nutrients))
 3.   └─ggplot2:::check_number_whole(nrow, allow_null = TRUE, min = 1)
 4.     └─ggplot2:::.stop_not_number(...)
 5.       └─ggplot2:::stop_input_type(...)
 6.         └─rlang::abort(message, ..., call = call, arg = arg)

#### The analysis runs without errors
Not met - see the following above.

#### The analysis produces the expected output
Meet spec - the figures in the figs folder seem to be accurately portrait comparing to figure 3 from the original paper

#### Data import/cleaning is handled in its own script(s)
Not met - Data may been sufficiently cleaned, but cannot be rendered on my end. It may need to be go over 

# Organize

#### Raw data is contained in its own folder
Meet spec - All their raw data is contained in data folder

#### Intermediate outputs are created and saved to a separate folder from raw data
Meet spec - Visualization for the projects are all in the figs folder

#### At least one piece of functionality has been refactored into a function in its own file
Not met - There is moving_avg() in it's own R file in the R folder but has not been called in with source(). 

# Document

#### The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs
Not met - No output and supporting code mentions yet. Just needs to be updated 

#### The README includes a flowchart and text explaining how the analysis works
Not met - No flowchart or nor explanation of analysis in the README yet

#### The code is appropriately commented
Meet spec - Almost done, just needs to be cleaned up on paper.qmd. Most of them are all well commented.

#### Variable and function names are descriptive and follow a consistent naming convention
Meet spec - All the variable and function is well written and self-explanatory. 

# Scale

#### Running the environment initialization script installs all required packages
Not met - Add all the # install.packages({package}) for all the packages that has been used
