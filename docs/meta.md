
<img src="man/figures/accuee.png" align="right" width="150"/>

# Metadatos

``` r
library(tidyverse)
library(mefdind)
```

## *mefd_name*: Nombre de archivos

Esta función permite leer el nombre de las bases de datos *.csv* con los
indicadores.

``` r
mi_url <-"https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/centros/centrosyunid/series/unidades_esc&file=pcaxis&l=s0"
mefd_name(mi_url)
#>  [1] "series_1_01.csv" "series_1_02.csv" "series_1_03.csv" "series_1_04.csv"
#>  [5] "series_1_05.csv" "series_1_06.csv" "series_1_07.csv" "series_1_08.csv"
#>  [9] "series_1_09.csv" "series_1_10.csv" "series_2_01.csv" "series_2_02.csv"
#> [13] "series_2_03.csv" "series_2_04.csv" "series_2_05.csv" "series_2_06.csv"
#> [17] "series_2_07.csv" "series_2_08.csv" "series_2_09.csv" "series_2_10.csv"
```

## *mefd_url*: urls de bases de datos

Esta función genera un objeto con los *urls* de las bases de datos
*.csv* con los indicadores

``` r
mi_url <- "https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/centros/sice/series&file=pcaxis&l=s0"
mefd_url(mi_url)
#>  [1] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_1_1.csv_bdsc?nocab=1"
#>  [2] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_1_2.csv_bdsc?nocab=1"
#>  [3] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_1_3.csv_bdsc?nocab=1"
#>  [4] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_1_4.csv_bdsc?nocab=1"
#>  [5] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_1_5.csv_bdsc?nocab=1"
#>  [6] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_2_1.csv_bdsc?nocab=1"
#>  [7] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_2_2.csv_bdsc?nocab=1"
#>  [8] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_2_3.csv_bdsc?nocab=1"
#>  [9] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_2_4.csv_bdsc?nocab=1"
#> [10] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_2_5.csv_bdsc?nocab=1"
#> [11] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_2_6.csv_bdsc?nocab=1"
#> [12] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_3_1.csv_bdsc?nocab=1"
#> [13] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_3_2.csv_bdsc?nocab=1"
#> [14] "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/centros/sice/series/l0/series_3_3.csv_bdsc?nocab=1"
```

## *mefd_meta*: Genera metadatos de indicadores

La función *mefd_meta* genera una base de metadatos a partir del vínculo
de la página web con indicadores (*url_web*).

``` r
mi_url <-"https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/centros/centrosyunid/series/unidades_esc&file=pcaxis&l=s0"
df <- mefd_meta(url_web = mi_url)
glimpse(df)
#> Rows: 20
#> Columns: 4
#> $ indicador <chr> " Unidades de E. Infantil por titularidad del centro, comuni…
#> $ archivo   <chr> "series_1_01.csv", "series_1_02.csv", "series_1_03.csv", "se…
#> $ url       <chr> "https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px…
#> $ titulo    <chr> "ENSEÑANZAS NO UNIVERSITARIAS / CENTROS Y SERVICIOS EDUCATIV…
```

## *meta_mefd*: Base de datos con metadatos

Además, el paquete contiene una data frame con los metadatos de todas
las series principales, *meta_mefd*.

``` r
head(meta_mefd)
#>                                                                                                      indicador
#> 1  Alumnado de Enseñanzas de Régimen General por titularidad del centro, comunidad autónoma y curso académico.
#> 2                    Alumnado de Enseñanzas de Régimen General por sexo, comunidad autónoma y curso académico.
#> 3                    Alumnado de E. Infantil por titularidad del centro, comunidad autónoma y curso académico.
#> 4                                      Alumnado de E. Infantil por sexo, comunidad autónoma y curso académico.
#> 5    Alumnado de Primer ciclo de E. Infantil por titularidad del centro, comunidad autónoma y curso académico.
#> 6   Alumnado de Segundo ciclo de E. Infantil por titularidad del centro, comunidad autónoma y curso académico.
#>             archivo
#> 1 alumnado_1_01.csv
#> 2 alumnado_1_02.csv
#> 3 alumnado_2_01.csv
#> 4 alumnado_2_02.csv
#> 5 alumnado_2_03.csv
#> 6 alumnado_2_04.csv
#>                                                                                                                                                                   url
#> 1 https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/alumnado_1_01.csv_bdsc?nocab=1
#> 2 https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/alumnado_1_02.csv_bdsc?nocab=1
#> 3 https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/alumnado_2_01.csv_bdsc?nocab=1
#> 4 https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/alumnado_2_02.csv_bdsc?nocab=1
#> 5 https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/alumnado_2_03.csv_bdsc?nocab=1
#> 6 https://estadisticas.educacion.gob.es/EducaJaxiPx/files/_px/es/csv_bdsc/no-universitaria/alumnado/matriculado/series/gen-alumnado/l0/alumnado_2_04.csv_bdsc?nocab=1
#>                                                                                         titulo
#> 1 ENSEÑANZAS NO UNIVERSITARIAS / ALUMNADO MATRICULADO / SERIES / ENSEÑANZAS DE RÉGIMEN GENERAL
#> 2 ENSEÑANZAS NO UNIVERSITARIAS / ALUMNADO MATRICULADO / SERIES / ENSEÑANZAS DE RÉGIMEN GENERAL
#> 3 ENSEÑANZAS NO UNIVERSITARIAS / ALUMNADO MATRICULADO / SERIES / ENSEÑANZAS DE RÉGIMEN GENERAL
#> 4 ENSEÑANZAS NO UNIVERSITARIAS / ALUMNADO MATRICULADO / SERIES / ENSEÑANZAS DE RÉGIMEN GENERAL
#> 5 ENSEÑANZAS NO UNIVERSITARIAS / ALUMNADO MATRICULADO / SERIES / ENSEÑANZAS DE RÉGIMEN GENERAL
#> 6 ENSEÑANZAS NO UNIVERSITARIAS / ALUMNADO MATRICULADO / SERIES / ENSEÑANZAS DE RÉGIMEN GENERAL
#>               titulo_1                   titulo_2
#> 1 Alumnado matriculado Enseñanzas Régimen General
#> 2 Alumnado matriculado Enseñanzas Régimen General
#> 3 Alumnado matriculado Enseñanzas Régimen General
#> 4 Alumnado matriculado Enseñanzas Régimen General
#> 5 Alumnado matriculado Enseñanzas Régimen General
#> 6 Alumnado matriculado Enseñanzas Régimen General
#>                             titulo_3 idserie
#> 1 Alumnado matriculado por enseñanza   11101
#> 2 Alumnado matriculado por enseñanza   11102
#> 3 Alumnado matriculado por enseñanza   11103
#> 4 Alumnado matriculado por enseñanza   11104
#> 5 Alumnado matriculado por enseñanza   11105
#> 6 Alumnado matriculado por enseñanza   11106
```
