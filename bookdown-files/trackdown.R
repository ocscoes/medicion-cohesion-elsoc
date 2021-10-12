library(trackdown)

# Sube el archivo
upload_file(file = "02-cambios.Rmd",
            gpath = "cap2-cohesion",
            hide_code = TRUE,
)


# Actualiza el rmd con los cambios en el drive
trackdown::download_file(file = "02-cambios.Rmd",
                         gpath = "cap2-cohesion")

## Ojo, problemas. No se copian los tildes, negritas, cursivas.

# Actualiza el drive con los cambios del rmd
trackdown::update_file(file = "02-cambios.Rmd",
                       gpath = "cap2-cohesion")
