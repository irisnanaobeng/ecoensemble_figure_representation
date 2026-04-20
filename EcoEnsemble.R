# Demonstrating EcoEnsemble Figures in R
# Author: Iris Nana Obeng

# Load packages
library(EcoEnsemble)
library(ggplot2)

# --------------------------------------------------
# 1. Define priors
# --------------------------------------------------

priors <- EnsemblePrior(
  4,
  ind_st_params = IndSTPrior(
    "hierarchical",
    list(-3, 1, 8, 4),
    list(0.1, 0.1, 0.1, 0.1),
    AR_params = c(2, 2)
  ),
  ind_lt_params = IndLTPrior(
    "lkj",
    list(1, 1),
    1
  ),
  sha_st_params = ShaSTPrior(
    "lkj",
    list(1, 10),
    1,
    AR_params = c(2, 2)
  ),
  sha_lt_params = 5
)

# --------------------------------------------------
# 2. Figure 1: Prior predictive distribution
# --------------------------------------------------

prior_fit <- prior_ensemble_model(
  priors = priors,
  M = 4,
  full_sample = TRUE
)

prior_samples <- sample_prior(
  observations = list(SSB_obs, Sigma_obs),
  simulators = list(
    list(SSB_ewe, Sigma_ewe, "EwE"),
    list(SSB_lm, Sigma_lm, "LeMans"),
    list(SSB_miz, Sigma_miz, "mizer"),
    list(SSB_fs, Sigma_fs, "FishSUMS")
  ),
  priors = priors,
  sam_priors = prior_fit,
  num_samples = 1,
  full_sample = TRUE
)

png("Figure1_paper_style.png", width = 1400, height = 900, res = 150)
plot(prior_samples)
dev.off()

# --------------------------------------------------
# 3. Figure 2: Posterior predictive distribution
# --------------------------------------------------

fit <- fit_ensemble_model(
  observations = list(SSB_obs, Sigma_obs),
  simulators = list(
    list(SSB_ewe, Sigma_ewe, "EwE"),
    list(SSB_lm, Sigma_lm, "LeMans"),
    list(SSB_miz, Sigma_miz, "mizer"),
    list(SSB_fs, Sigma_fs, "FishSUMS")
  ),
  priors = priors,
  full_sample = TRUE,
  chains = 1,
  iter = 300,
  warmup = 150,
  cores = 1
)

samples <- generate_sample(fit, num_samples = 1)

png("Figure2_paper_style.png", width = 1400, height = 900, res = 150)
plot(samples)
dev.off()

# --------------------------------------------------
# 4. Check files
# --------------------------------------------------

print(file.exists("Figure1_paper_style.png"))
print(file.exists("Figure2_paper_style.png"))