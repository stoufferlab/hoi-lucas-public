library(tidyverse)
library(brms)



# Read data
# you may also download our data from https://doi.org/10.25898/sv0n-sw84 
dat_brms <- read_csv("data/data_clean.csv")




# brms model --------------------------------------------------------------

# prior sets
priors_null <- 
  prior(constant(2), class = nu) +
  prior(normal(0, 1), nlpar = a) +
  prior(normal(0, 1), nlpar = b) +
  prior(normal(0, 1), nlpar = c) +
  prior(normal(0, 1), dpar = sigma, class = b, lb = 0)
priors <- 
  prior(constant(2), class = nu) +
  prior(normal(0, 1), nlpar = a) +
  prior(normal(0, 1), nlpar = b) +
  prior(normal(0, 1), nlpar = c) +
  prior(horseshoe(par_ratio = 0.1), nlpar = g) +
  prior(normal(0, 1), dpar = sigma, class = b, lb = 0)

# model formulae
nlform1 <- 
  bf(G ~ a + exp(b)*log(D1) - exp(c)*D1 + e) +
  lf(a + b + c ~ 1 + (1 | Focal),
     e ~ 0 + (1 | Plot),
     sigma ~ 1 + log(D1)) +
  set_nl(TRUE)
nlform2 <- 
  bf(G ~ a + exp(b)*log(D1) - exp(c)*D1 + g + e) +
  lf(a + b + c ~ 1 + (1 | Focal),
     g ~ 0 + Focal:(
       (temp_meanAnn + vpd_mar)
     ), 
     e ~ 0 + (1 | Plot),
     sigma ~ 1 + log(D1)) +
  set_nl(TRUE)
nlform3 <- 
  bf(G ~ a + exp(b)*log(D1) - exp(c)*D1 + g + e) +
  lf(a + b + c ~ 1 + (1 | Focal),
     g ~ 0 + Focal:(
       (DACCUP + FUSCLI + LOPMEN + 
          PODLAE + QUISER + WEIRAC + OTHERS)
     ), 
     e ~ 0 + (1 | Plot),
     sigma ~ 1 + log(D1)) +
  set_nl(TRUE)
nlform4 <- 
  bf(G ~ a + exp(b)*log(D1) - exp(c)*D1 + g + e) +
  lf(a + b + c ~ 1 + (1 | Focal),
     g ~ 0 + Focal:(
       (DACCUP + FUSCLI + LOPMEN + 
          PODLAE + QUISER + WEIRAC + OTHERS +
          I(DACCUP^2) + I(FUSCLI^2) + I(LOPMEN^2) + 
          I(PODLAE^2) + I(QUISER^2) + I(WEIRAC^2) + I(OTHERS^2) +
          DACCUP:FUSCLI + DACCUP:LOPMEN + DACCUP:PODLAE + 
          DACCUP:QUISER + DACCUP:WEIRAC + DACCUP:OTHERS +
          FUSCLI:LOPMEN + FUSCLI:PODLAE + FUSCLI:QUISER + 
          FUSCLI:WEIRAC + FUSCLI:OTHERS +
          LOPMEN:PODLAE + LOPMEN:QUISER + LOPMEN:WEIRAC + LOPMEN:OTHERS +
          PODLAE:QUISER + PODLAE:WEIRAC + PODLAE:OTHERS +
          QUISER:WEIRAC + QUISER:OTHERS +
          WEIRAC:OTHERS)
     ), 
     e ~ 0 + (1 | Plot),
     sigma ~ 1 + log(D1)) +
  set_nl(TRUE)
nlform5 <- 
  bf(G ~ a + exp(b)*log(D1) - exp(c)*D1 + g + e) +
  lf(a + b + c ~ 1 + (1 | Focal),
     g ~ 0 + Focal:(
       (temp_meanAnn + vpd_mar) * 
         (DACCUP + FUSCLI + LOPMEN + 
            PODLAE + QUISER + WEIRAC + OTHERS)
     ), 
     e ~ 0 + (1 | Plot),
     sigma ~ 1 + log(D1)) +
  set_nl(TRUE)
nlform6 <- 
  bf(G ~ a + exp(b)*log(D1) - exp(c)*D1 + g + e) +
  lf(a + b + c ~ 1 + (1 | Focal),
     g ~ 0 + Focal:(
       (temp_meanAnn + vpd_mar) * 
         (DACCUP + FUSCLI + LOPMEN + 
            PODLAE + QUISER + WEIRAC + OTHERS +
            I(DACCUP^2) + I(FUSCLI^2) + I(LOPMEN^2) + 
            I(PODLAE^2) + I(QUISER^2) + I(WEIRAC^2) + I(OTHERS^2) +
            DACCUP:FUSCLI + DACCUP:LOPMEN + DACCUP:PODLAE + 
            DACCUP:QUISER + DACCUP:WEIRAC + DACCUP:OTHERS +
            FUSCLI:LOPMEN + FUSCLI:PODLAE + FUSCLI:QUISER + 
            FUSCLI:WEIRAC + FUSCLI:OTHERS +
            LOPMEN:PODLAE + LOPMEN:QUISER + LOPMEN:WEIRAC + LOPMEN:OTHERS +
            PODLAE:QUISER + PODLAE:WEIRAC + PODLAE:OTHERS +
            QUISER:WEIRAC + QUISER:OTHERS +
            WEIRAC:OTHERS)
     ), 
     e ~ 0 + (1 | Plot),
     sigma ~ 1 + log(D1)) +
  set_nl(TRUE)

# fit models
# plan(multisession, workers = 4)

m6 <- 
  brm(formula = nlform6,
      family = student(link = "log"),
      data = dat_brms,
      prior = priors,
      core = 4, chains = 4,
      control = list(adapt_delta = 0.999,
                     max_treedepth = 15),
      warmup = 5000, 
      iter = 6000,
      stan_model_args = list(model_name = "m6")
  )
saveRDS(m6, "out/brms_m6.rds")

m5 <- 
  brm(formula = nlform5,
      family = student(link = "log"),
      data = dat_brms,
      prior = priors,
      core = 4, chains = 4,
      control = list(adapt_delta = 0.999,
                     max_treedepth = 15),
      warmup = 5000, 
      iter = 6000,
      stan_model_args = list(model_name = "m5")
  )
saveRDS(m5, "out/brms_m5.rds")

m4 <- 
  brm(formula = nlform4,
      family = student(link = "log"),
      data = dat_brms,
      prior = priors,
      core = 4, chains = 4,
      control = list(adapt_delta = 0.999,
                     max_treedepth = 15),
      warmup = 5000, 
      iter = 6000,
      stan_model_args = list(model_name = "m4")
  )
saveRDS(m4, "out/brms_m4.rds")

m3 <- 
  brm(formula = nlform3,
      family = student(link = "log"),
      data = dat_brms,
      prior = priors,
      core = 4, chains = 4,
      control = list(adapt_delta = 0.999,
                     max_treedepth = 15),
      warmup = 5000, 
      iter = 6000,
      stan_model_args = list(model_name = "m3")
  )
saveRDS(m3, "out/brms_m3.rds")

m2 <- 
  brm(formula = nlform2,
      family = student(link = "log"),
      data = dat_brms,
      prior = priors,
      core = 4, chains = 4,
      control = list(adapt_delta = 0.999,
                     max_treedepth = 15),
      warmup = 5000, 
      iter = 6000,
      stan_model_args = list(model_name = "m2")
  )
saveRDS(m2, "out/brms_m2.rds")

m1 <- 
  brm(formula = nlform1,
      family = student(link = "log"),
      data = dat_brms,
      prior = priors_null,
      core = 4, chains = 4,
      control = list(adapt_delta = 0.999,
                     max_treedepth = 15),
      warmup = 5000, 
      iter = 6000,
      stan_model_args = list(model_name = "m1")
  )
saveRDS(m1, "out/brms_m1.rds")

