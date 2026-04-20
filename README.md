# Reproducing EcoEnsemble Figures Using R

This repository contains an R Markdown workflow that reproduces Figure 1 and Figure 2 from the EcoEnsemble paper using the built-in example datasets included in the `EcoEnsemble` package.

The analysis combines observed spawning-stock biomass data with outputs from four ecosystem simulators to create an overall ensemble prediction with uncertainty.

## Overview

EcoEnsemble combines several ecosystem models into one overall prediction rather than relying on a single model.

The example in this repository focuses on four North Sea fish species:

* Norway pout
* Herring
* Cod
* Sole

The analysis uses outputs from four ecosystem simulators:

* EwE (Ecopath with Ecosim)
* LeMans
* mizer
* FishSUMS

## Repository Contents

```text
EcoEnsemble_Figures.Rmd
Figure1_paper_style.png
Figure2_paper_style.png
README.md
```

* `EcoEnsemble_Figures.Rmd` contains the full R Markdown workflow
* `Figure1_paper_style.png` is the prior predictive figure
* `Figure2_paper_style.png` is the posterior predictive figure

## Figures

### Figure 1: Prior Predictive Distribution

Figure 1 shows the model before it has used the observed data. The uncertainty bands are therefore wider.

![Figure 1](Figure1_paper_style.png)

### Figure 2: Posterior Predictive Distribution

Figure 2 shows the model after it has been fitted to the observed data. The uncertainty is reduced and the final ensemble prediction becomes clearer.

![Figure 2](Figure2_paper_style.png)


## Reference

The scientific paper was provided by Prof. Duccio Rocchini


---

Author: Iris Nana Obeng
Global Change Ecology master's student.

