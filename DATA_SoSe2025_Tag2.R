### DATA Uebung Tag 2
# Ahrabhi Kathirgamalingam

# Working directory 
getwd()
setwd("/Users/ahrabhi.kathirgamalingam/Documents/03_LEHRE/HHU/DATA HHU/SoSe_2025/data")

# Packages und Daten importieren
install.packages("rio")
library(rio)
install_formats()

# Daten importieren
allbus <- import("ALLBUS2018komplett.sav")

# ODER, was wir uns sparen, weil wir eine WD gesetzt haben!
# allbus <- import("...PFAD.../ALLBUS2018komplett.sav")


### ---- SKALENNIVEAUS ----

# Variablen anschauen
variable.names(allbus)

allbus$german
allbus$eastwest
allbus$xr20
allbus$xt10

attributes(allbus$german)
attributes(allbus$eastwest)
attributes(allbus$xr20)
attributes(allbus$xt10)

attributes(allbus$respid)

?attributes

### ---- DATENAUFBEREITUNG mit TIDYVERSE ----

install.packages("tidyverse")
library(tidyverse)

# Wie viele Missings gibt es bei der Variable german?
# mit base
is.na(allbus$german)

sum(is.na(allbus$german))

# mit tidyverse
allbus$german %>%
  is.na() %>%
  sum()

# SUBSETTING
# Beispiel: Wir wollen nur Teilnehmer*innen mit dt. Staatsangehörigkeit
attributes(allbus$ep01)
allbus %>% german, ep01

allbus %>% 
  select(german, ep01)

allbus_sub <- allbus %>%
  select(german, ep01) 

allbus %>% german # funktioniert nicht
allbus %>% german == 1 # funktioniert nicht

table(allbus$german)

allbus %>% 
  filter(german == 1) # Output in der Konsole

allbus_german <- allbus %>% 
  filter(german == 1) # neu zuweisen als allbus_german (jedoch noch nicht abgespeichert)

allbus <- allbus %>%
  filter(german == 1) # überschreibt den Datensatz

# Beispiel: Wir wollen nur Teilnehmer*innen mit dt. Staatsangehörigkeit UND länger als 100 Minuten Interviewdauer

allbus_german <- allbus %>% # überschreibt allbus_german
  filter(german == 2,
         xt10 <= 50) # Achtung: Operator!

# REKODIERUNG
# wieder mit vollem Datensatz

attributes(allbus$ep01)

table(allbus$ep01) # Häufigkeiten

# Neue Variable erstellen _r (für recode) und umzuweisen
allbus <- allbus %>% 
  mutate(ep01_r = case_when(
    ep01 == 1 ~ 5, 
    ep01 == 2 ~ 4, 
    ep01 == 3 ~ 3, 
    ep01 == 4 ~ 2, 
    ep01 == 5 ~ 1))

table(allbus$ep01_r) # Häufigkeiten checken und vergleichen mit oben


### ---- DATENVISUALISIERUNG mit TIDYVERSE ----

# Encoding
allbus %>% ggplot(aes(x = ep01))
                  
# Geometric
plot1 <- allbus %>% ggplot(aes(x = ep01_r)) +
  geom_bar()

# Scale
plot1 <- allbus %>% ggplot(aes(x = ep01_r)) +
  geom_bar() + 
  scale_x_continuous(breaks = c(1,2,3,4,5),
                     labels = c("sehr schlecht", "schlecht", "teils/teils",
                                "gut", "sehr gut"))


# Beschriftungen und Titel
allbus %>% ggplot(aes(x = ep01_r)) +
  geom_bar() + 
  scale_x_continuous(breaks = c(1,2,3,4,5),
                     labels = c("sehr schlecht", "schlecht", "teils/teils",
                                "gut", "sehr gut")) + 
  labs(x = "Einschätzung wirtschaftliche Lage",
       y = "Absolute Häufigkeit",
       title = "Abbildung 1: Subjektive Einschätzung der 	Wirtschaftlichen Lage") 

# Einem Objekt zuweisen

plot_1 <- allbus %>% ggplot(aes(x = ep01_r)) +
  geom_bar() + 
  scale_x_continuous(breaks = c(1,2,3,4,5),
                     labels = c("sehr schlecht", "schlecht", "teils/teils",
                                "gut", "sehr gut")) + 
  labs(x = "Einschätzung wirtschaftliche Lage",
       y = "Absolute Häufigkeit",
       title = "Abbildung 1: Subjektive Einschätzung der 	Wirtschaftlichen Lage") 

# Extras
plot_1 + coord_flip() 

plot_1 + theme_minimal()

plot_1 + theme_dark()

plot_1 <- plot_1 + theme(axis.text.x = element_text(angle = 180))

### ---- DESKRIPTIVE STATISTIK ----

# Absolute Häufigkeit
table(allbus$eastwest)

# Relative Häufigkeit
prop.table(table(allbus$east))

# Prozentuale Häufigkeit
prop.table(table(allbus$east)) * 100

# Manchmal unübersichtlich, Beispiel:
table(allbus$age)

# Mittelwert/ Mean
mean(allbus$age)
mean(allbus$age, na.rm = TRUE)

# Median
median(allbus$age)
median(allbus$age, na.rm = TRUE)

# Modus / Modal
modal_tabelle <- table(allbus$age)
names(modal_tabelle)[which(modal_tabelle == max (modal_tabelle))]

# Varianz
var(allbus$age, na.rm = TRUE)

# Standardabweichung
sd(allbus$age, na.rm = TRUE)

# Überblick mit summary() Funktion!
summary(allbus$age)
