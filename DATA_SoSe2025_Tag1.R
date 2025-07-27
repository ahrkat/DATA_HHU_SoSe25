### DATA Uebung Tag 1
# Ahrabhi Kathirgamalingam


### ---- OBJEKTE UND FUNKTIONEN ----

# OBJEKTE UND ZUWEISUNGEN
# Ein paar Tests, um zu verstehen, wie Objekte und Zuweisungen funktionieren

x <- 3
x <- 3+4 # x wird überschrieben!

X <- 3 # neue Variable X

y <- 1, 5, 6, 7 # falsch

y <- c(1, 5, 6, 7) # Vier Zahlen werden zugewiesen

z <- "Hallo" # Text - Achtung: Anführungszeichen!

texts <- c("Hallo", "WER", "BIST", "du") #Vier "Strings" werden zugewiesen
text <- "Hallo, wer bist du?"



# FUNKTIONEN
?c
?mean
mean(x)
mean(y)
mean(z)


### ---- BASE UND PACKAGES ----

# BASE R
library(help = "base")

# PACKAGES
# Welche Packages sind aktiviert?
sessionInfo() 

# Befehl, um dplyr zu installieren
install.packages("dplyr") 
# Package aktivieren
library(dplyr) 

sessionInfo()  

# Package deinstallieren
remove.packages("dplyr") 

sessionInfo()


### ---- OBJEKT KLASSEN UND FORMATE ----

# Funktion, um Klasse zu checken
class(x) 

class(y)

class(z)

class(b)

is.numeric(z) # Ist die Variable numeric?

is.character(z) # Ist die Variable string?


# MISSING VALUES UND IHRE CLASS/ KLASSEN
missing <- NA

class(missing)

is.na(missing)

var <- c(1, 3, NA, 6, NA, 100)

is.na(var)


### ---- WORKING DIRECTORY ----
# In welcher WD sind wir?
getwd()

# WD setzen
setwd("...")
getwd() # nochmal checken


### ---- DATA IMPORT ----
# Beispieldatensatz 
df <- mtcars

print(df)
# Mittelwert berechnen
mean(mtcars) # was passiert? Mittelwert von einem gesamten Datensatz führt zu Error
mean(df$cyl) # Mittelwert für Variable funktioniert


# ALLBUS Datensatz
install.packages("rio")
library(rio)
install_formats()

setwd("/Users/ahrabhi.kathirgamalingam/Documents/03_LEHRE/HHU/DATA HHU/SoSe_2025/data")
allbus <- import("ALLBUS2018komplett.sav")

# ODER, was wir uns sparen, weil wir eine WD gesetzt haben!
allbus <- import(".../ALLBUS2018komplett.sav")

