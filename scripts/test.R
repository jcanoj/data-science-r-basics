corrtest <- function(directory, files, threshold = 0) {
        
        # archivos <- list.files(file.path(directory))
        datos <- data.frame()
        vector.correlacion <- numeric()
        puntero <- 0
        for (item in files){
                datos <- read.csv(file.path(directory, item), stringsAsFactors = FALSE)
                index.completos <- complete.cases(datos)
                completos <- sum(index.completos)
                if (completos > threshold){
                        puntero <- puntero + 1
                        datos.completos <- datos[index.completos,]
                        datos.correlacion <- cor(datos.completos$nitrate, datos.completos$sulfate)
                        vector.correlacion[puntero] <- datos.correlacion
                }
        }
        
        vector.correlacion
}