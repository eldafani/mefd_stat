
<img src="man/figures/accuee.png" align="right" width="150"/>

# Mantenimiento

``` r
library(mefdind)
library(tidyverse)
```

## ¿Cómo expandir la base de meta datos?

La base de meta datos, *meta_mefd*, se genera implementando la función
*mefd_meta* a la base *par_url*. Para expandir la base de meta datos es
necesario modificar *par_url*.

``` r
glimpse(par_url)
#> Rows: 15
#> Columns: 4
#> $ titulo_1 <chr> "Alumnado matriculado", "Alumnado matriculado", "Alumnado mat…
#> $ titulo_2 <chr> "Enseñanzas Régimen General", "Enseñanzas Régimen General", "…
#> $ titulo_3 <chr> "Alumnado matriculado por enseñanza", "Porcentaje de alumnado…
#> $ url      <chr> "https://estadisticas.educacion.gob.es/EducaDynPx/educabase/i…
head(par_url)
#>               titulo_1                    titulo_2
#> 1 Alumnado matriculado  Enseñanzas Régimen General
#> 2 Alumnado matriculado  Enseñanzas Régimen General
#> 3 Alumnado matriculado  Enseñanzas Régimen General
#> 4 Alumnado matriculado  Enseñanzas Régimen General
#> 5 Alumnado matriculado  Enseñanzas Régimen General
#> 6 Alumnado matriculado Enseñanzas Régimen Especial
#>                                                        titulo_3
#> 1                            Alumnado matriculado por enseñanza
#> 2        Porcentaje de alumnado matriculado en centros públicos
#> 3              Porcentaje de mujeres en el alumnado matriculado
#> 4 Tasas netas de escolarización en Enseñanzas no universitarias
#> 5                                   Tasas de idoneidad por edad
#> 6                            Alumnado matriculado por enseñanza
#>                                                                                                                                                                       url
#> 1       https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/gen-alumnado&file=pcaxis&l=s0
#> 2     https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/gen-porcen-gen&file=pcaxis&l=s0
#> 3 https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/gen-porcen-mujeres&file=pcaxis&l=s0
#> 4        https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/gen-escolar&file=pcaxis&l=s0
#> 5      https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/gen-idoneidad&file=pcaxis&l=s0
#> 6           https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/alumnado/matriculado/series/especial&file=pcaxis&l=s0
```

Entonces, si hay una página web nueva con indicadores, podemos agregarla
así.

``` r
par_url <- par_url %>% 
  add_row(url = "mi url nuevo")
```

Y luego podemos volver a generar el archivo con los meta datos

``` r
meta_list <- lapply(par_url$url, mefd_meta)
meta_mefd <- do.call(bind_rows, meta_list)
```

## ¿Cómo cambiar la página web principal?

La página web principal es *<https://estadisticas.educacion.gob.es/>*.
Este y otros parámetros pueden ser modificados en el script *conf.R*.

``` r
conf
#> $tit_p
#> [1] "\"titulo t2\">(.*?) *<"
#> 
#> $file_p
#> [1] ".*&file= *(.*?) *.px&"
#> 
#> $tabpx
#> [1] "Tabla.htm"
#> 
#> $url_1
#> [1] "https://estadisticas.educacion.gob.es/"
#> 
#> $url_2
#> [1] "EducaJaxiPx/files/_px/es/csv_bdsc"
#> 
#> $pre_p
#> [1] ".*Tabla.htm[?]path= *(.*?) *.&file"
#> 
#> $suf_url
#> [1] "_bdsc?nocab=1"
```

Por ejemplo, la página web principal puede cambiarse así.

``` r
enlace_nuevo <- "https://estadisticas.educacion.indicadores.gob.es/"
conf$url_1 <- enlace_nuevo
```

Las funciones para generar meta datos y leer datos utilizan este nuevo
argumento.
