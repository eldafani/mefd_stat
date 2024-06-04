
# *mefd_search*: Busqueda de indicadores

La función *mefd_search* permite identificar indicadores a partir de
palabras claves. El usuaRio provee la palabra clave y la función busca
esta palabra en la lista de indicadores del archivo de meta datos,
*meta_mefd*. Como resultado, la función otorga el id de la serie,
*idserie*, que puede utilizarse posteriormente para leer los datos con
la función [*mefd_read*](import.md).

A continuación presentamos ejemplos.

``` r
library(mefdind)
```

Buscamos indicadores que contengan la palabra “idoneidad”:

``` r
mefd_search("idoneidad")
#>    idserie
#> 93   11501
#> 94   11502
#> 95   11503
#> 96   11504
#> 97   11505
#>                                                                                    indicador
#> 93   Tasas de idoneidad en la edad de 8 años por sexo, comunidad autónoma y curso académico.
#> 94  Tasas de idoneidad en la edad de 10 años por sexo, comunidad autónoma y curso académico.
#> 95  Tasas de idoneidad en la edad de 12 años por sexo, comunidad autónoma y curso académico.
#> 96  Tasas de idoneidad en la edad de 14 años por sexo, comunidad autónoma y curso académico.
#> 97  Tasas de idoneidad en la edad de 15 años por sexo, comunidad autónoma y curso académico.
```

Como resultado obtenemos el nombre de los indicadores y el *idserie*,
que nos permite identificarlos.

También podemos buscar indicadores que contengan varias palabras.

Por ejemplo, indicadores que contienen la palabra “extranjero” O
“idoneidad”.

``` r
mefd_search("extranjero|idoneidad")
#>     idserie
#> 93    11501
#> 94    11502
#> 95    11503
#> 96    11504
#> 97    11505
#> 144   13601
#> 145   13602
#> 146   13603
#> 147   13604
#> 148   13605
#> 149   13606
#> 150   13607
#> 151   13608
#> 152   13609
#> 153   13610
#> 154   13611
#> 155   13612
#> 156   13613
#> 157   13614
#> 158   13615
#> 159   13616
#> 160   13617
#> 161   13618
#> 162   13619
#> 163   13620
#> 164   13621
#>                                                                                                                                                       indicador
#> 93                                                                      Tasas de idoneidad en la edad de 8 años por sexo, comunidad autónoma y curso académico.
#> 94                                                                     Tasas de idoneidad en la edad de 10 años por sexo, comunidad autónoma y curso académico.
#> 95                                                                     Tasas de idoneidad en la edad de 12 años por sexo, comunidad autónoma y curso académico.
#> 96                                                                     Tasas de idoneidad en la edad de 14 años por sexo, comunidad autónoma y curso académico.
#> 97                                                                     Tasas de idoneidad en la edad de 15 años por sexo, comunidad autónoma y curso académico.
#> 144  Alumnado extranjero en Enseñanzas de Régimen General y en Enseñanzas de Régimen Especial por titularidad del centro, comunidad autónoma y curso académico.
#> 145                                      Alumnado extranjero en Enseñanzas de Régimen General por titularidad del centro, comunidad autónoma y curso académico.
#> 146                    Porcentaje de alumnado extranjero escolarizado en centros públicos. Enseñanzas de Régimen General, comunidad autónoma y curso académico.
#> 147                          Porcentaje de alumnado extranjero en el alumnado matriculado. Enseñanzas de Régimen General, comunidad autónoma y curso académico.
#> 148                                                 Alumnado extranjero en Educación Infantil por titularidad del centro, comunidad autónoma y curso académico.
#> 149                                             Alumnado extranjero en Educación Primaria/EGB por titularidad del centro, comunidad autónoma y curso académico.
#> 150                                                 Alumnado extranjero en Educación Especial por titularidad del centro, comunidad autónoma y curso académico.
#> 151                                   Alumnado extranjero en Educación Secundaria Obligatoria por titularidad del centro, comunidad autónoma y curso académico.
#> 152                                                      Alumnado extranjero en Bachilleratos por titularidad del centro, comunidad autónoma y curso académico.
#> 153                                              Alumnado extranjero en Formación Profesional por titularidad del centro, comunidad autónoma y curso académico.
#> 154                                           Alumnado extranjero del que no consta enseñanza por titularidad del centro, comunidad autónoma y curso académico.
#> 155                                     Alumnado extranjero en Enseñanzas de Régimen Especial por titularidad del centro, comunidad autónoma y curso académico.
#> 156                                                                     Alumnado extranjero de la Unión Europea por sexo, comunidad autónoma y curso académico.
#> 157                                                                     Alumnado extranjero del Resto de Europa por sexo, comunidad autónoma y curso académico.
#> 158                                                                               Alumnado extranjero de África por sexo, comunidad autónoma y curso académico.
#> 159                                                                    Alumnado extranjero de América del Norte por sexo, comunidad autónoma y curso académico.
#> 160                                                                      Alumnado extranjero de América Central por sexo, comunidad autónoma y curso académico.
#> 161                                                                      Alumnado extranjero de América del Sur por sexo, comunidad autónoma y curso académico.
#> 162                                                                                 Alumnado extranjero de Asia por sexo, comunidad autónoma y curso académico.
#> 163                                                                              Alumnado extranjero de Oceanía por sexo, comunidad autónoma y curso académico.
#> 164                                                                     Alumnado extranjero de país no definido por sexo, comunidad autónoma y curso académico.
```

O indicadores que contengan ambas palabras, “primaria” Y “sexo”

``` r
mefd_search("primaria.*sexo")
#>     idserie
#> 8     11108
#> 197   25901
#> 199   25903
#> 201   25905
#> 203   25907
#> 205   25909
#> 207   25911
#>                                                                                                                   indicador
#> 8                                    Alumnado de E. Primaria/EGB de 1º a 6º por sexo, comunidad autónoma y curso académico.
#> 197  Porcentaje de alumnado de primero de Educación Primaria que promociona por sexo, comunidad autónoma y curso académico.
#> 199  Porcentaje de alumnado de segundo de Educación Primaria que promociona por sexo, comunidad autónoma y curso académico.
#> 201  Porcentaje de alumnado de tercero de Educación Primaria que promociona por sexo, comunidad autónoma y curso académico.
#> 203   Porcentaje de alumnado de cuarto de Educación Primaria que promociona por sexo, comunidad autónoma y curso académico.
#> 205   Porcentaje de alumnado de quinto de Educación Primaria que promociona por sexo, comunidad autónoma y curso académico.
#> 207    Porcentaje de alumnado de sexto de Educación Primaria que promociona por sexo, comunidad autónoma y curso académico.
```
