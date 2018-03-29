csv <- read.csv("data/csv.renamed.csv")

library(plyr)

csv$Race <-
  plyr::revalue(csv$Race,
                c("Other (American Indian/AK Native, Asian/Pacific Islander)" = "Other"))

csv$Grade <-
  plyr::revalue(
    csv$Grade,
    c(
      "Well differentiated; Grade I" = "Well",
      "Moderately differentiated; Grade II" = "Well",
      "Poorly differentiated; Grade III" = "Poorly",
      "Undifferentiated; anaplastic; Grade IV" = "Poorly"
    )
  )

csv$Histology <-
  plyr::revalue(
    csv$Histology,
    c(
      "8013/3: Large cell neuroendocrine carcinoma" = "Other",
      "8022/3: Pleomorphic carcinoma" = "Other",
      "8031/3: Giant cell carcinoma" = "Other",
      "8032/3: Spindle cell carcinoma, NOS" = "Other",
      "8070/3: Squamous cell carcinoma, NOS" = "SqCC",
      "8082/3: Lymphoepithelial carcinoma" = "Other",
      "8083/3: Basaloid squamous cell carcinoma" = "SqCC",
      "8084/3: Squamous cell carcinoma, clear cell type" = "SqCC",
      "8123/3: Basaloid carcinoma" = "Other",
      "8140/3: Adenocarcinoma, NOS" = "ACC",
      "8230/3: Solid carcinoma, NOS" = "ACC",
      "8250/3: Bronchiolo-alveolar adenocarcinoma, NOS" = "ACC",
      "8255/3: Adenocarcinoma with mixed subtypes" = "ACC",
      "8260/3: Papillary adenocarcinoma, NOS" = "ACC",
      "8550/3: Acinar cell carcinoma" = "ACC",
      "ASC" = "ASC"
    )
  )

csv$Laterality <-
  plyr::revalue(
    csv$Laterality,
    c(
      "Left - origin of primary" = "Left",
      "Right - origin of primary" = "Right"
    )
  )

csv$Radiation <-
  plyr::revalue(
    csv$Radiation,
    c(
      "No radiation and/or cancer-directed surgery" = 0,
      "Radiation after surgery" = 1
    )
  )

csv$Chemo <-
  plyr::revalue(csv$Chemo,
                c("No/Unknown" = 0,
                  "Yes" = 1))

csv$PL <-
  plyr::revalue(
    csv$PL,
    c(
      "000" = 0,
      "010" = 1,
      "020" = 1,
      "030" = 1,
      "040" = 1,
      "998" = "Blank(s)",
      "999" = "Blank(s)"
    )
  )

csv$OS <-
  plyr::revalue(csv$OS,
                c("Alive" = 0,
                  "Dead" = 1))

csv$Size <- csv$Size/10

write.csv(csv, file = "./data/csv.renamed.revalued.csv", row.names = F)
# summary(csv$OS)

# summary(as.factor(csv$Multifocal))
# head(csv$Race)
