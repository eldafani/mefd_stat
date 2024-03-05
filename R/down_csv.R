# Descarga bases de datos en formato .csv
# Ejemplo: Alumnado matriculado por enseñanza

# Cambiar directorio (donde se guardan los datos)
dir <- "/home/eldani/MEGA/Work/Projects/Ongoing/mefd_stat/datos"

library(xml2)
library(rvest)
library(stringr)
library(tidyverse)

# Extrae numbre de bases de datos de la web html
html_source <- "https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/gen-alumnado&file=pcaxis&l=s0"
pg <- read_html(html_source)
href <- html_attr(html_nodes(pg, "a"), "href")
href <- href[!is.na(href)]
href <- href[nchar(href)>1]

pattern <- ".*&file= *(.*?) *.px&"
file <- unique(str_match(href, pattern)[,2])
file <- file[!is.na(file)]
file <- paste0(file, ".csv")

# Genera url de bases de datos en .csv
base_url <- "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/"
suf_url <- "_bdsc?nocab=1"
url <- paste0(base_url, file, suf_url)

# Genera directorio donde guardar los archivos
dir_full <- file.path(dir, file) 

lapply(seq_along(file), function(x) download.file(url = url[[x]], destfile = dir_full[[x]]))

df <- lapply(dir_full, function(x) read.csv2(x))


