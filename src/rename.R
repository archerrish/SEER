

library(plyr)
csv <- read.csv("data/export.csv")
csv2 <- plyr::rename(
  csv,
  c(
    "Race.recode..White..Black..Other." = "Race",
    "Age.at.diagnosis" = "Age",
    "Year.of.diagnosis" = "Year",
    "NSCLC.His.grouped" = "Histology",
    "Derived.AJCC.Stage.Group..7th.ed..2010.." = "Stage7th",
    "Derived.AJCC.Stage.Group..6th.ed..2004.." = "Stage6th",
    "Derived.AJCC.T..7th.ed..2010.." = "T_7th",
    "Derived.AJCC.N..7th.ed..2010.." = "N_7th",
    "Derived.AJCC.T..6th.ed..2004.." = "T_6th",
    "Derived.AJCC.N..6th.ed..2004.." = "N_6th",
    "Radiation.sequence.with.surgery" = "Radiation",
    "Chemotherapy.recode..yes..no.unk." = "Chemo",
    "CS.tumor.size..2004.." = "Size",
    "CS.site.specific.factor.1..2004..varying.by.schema." = "Multifocal",
    "CS.site.specific.factor.2..2004..varying.by.schema." = "PL",
    "Lymph.vascular.Invasion..2004..varying.by.schema." = "LVI",
    "Survival.months" = "Months",
    "Vital.status.recode..study.cutoff.used." = "OS",
    "Patient.ID" = "ID"
  )
)

write.csv(csv2, file = "./data/csv.renamed.csv", row.names = F)
