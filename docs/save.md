
# *mefd_down*: Descargar datos

La función *mefd_down* permite descargar los datos en formato *.csv* a
un directorio en el ordenador. Al igual que la función *mefd_read* para
leer datos, la descarga puede hacerse con tres métodos, suministrando el
id de la serie (*idserie*), el vínculo de la página web (*url_web*) o el
url del archivo o archivos *.csv* específicos con los datos del
indicador (*url_ind*).

``` r
library(mefdind)
```

Primero debemos crear un objeto con la ruta del directorio donde
queremos descargar los datos. Por ejemplo,

``` r
mi_folder <- "\home\datos"
```

Para descargar datos con *idserie*, hacemos:

``` r
mefd_down(idserie = c(11109, 11125, 37002), folder = mi_folder)
```

Para descargar datos con *url_web*:

``` r
mi_url <-"https://estadisticas.educacion.gob.es/EducaDynPx/educabase/index.htm?type=pcaxis&path=/no-universitaria/centros/centrosyunid/series/unidades_esc&file=pcaxis&l=s0"
mefd_down(url_web = mi_url, folder = mi_folder)
```

Para descargar datos con *url_ind*:

``` r
mefd_down(url_ind=meta_mefd$url[c(1, 3, 5)], folder = mi_folder)
```
