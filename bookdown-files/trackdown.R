library(trackdown)

upload_file(file = "02-cambios.Rmd",
            gpath = "cap2-cohesion",
            hide_code = TRUE,
)

### Update_file actualiza el documento en el drive. no el rmarkdown
update_file(file= "prueba.Rmd",
            gpath = "prueba")

trackdown::download_file(file = "prueba.Rmd",
                         gpath = "prueba")

## Ojo, problemas. No se copian los tildes, negritas, cursivas.