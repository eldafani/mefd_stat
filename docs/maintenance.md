
``` r
library(mefdind)
library(tidyverse)
```

# ¿Cómo expandir la base de meta datos?

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

# ¿Cómo cambiar la página web principal?

La página web principal es *<https://estadisticas.educacion.gob.es/>*.
Este y otros parámetros pueden ser modificados en el script *conf.R*.
Por ejemplo, la página web principal puede cambiarse así.

``` r
conf$url_1 <- "https://estadisticas.educacion.indicadores.gob.es/"
```

Las funciones para generar meta datos y leer datos utilizan este nuevo
argumento.
