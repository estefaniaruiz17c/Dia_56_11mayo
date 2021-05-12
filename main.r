# Estefanía Ruiz Cuartas
# Lenguaje de programación: R
# Tema: Manejo de archivos .txt en R
# Fuentes de consulta:          https://r-coder.com/leer-txt-r/  http://halweb.uc3m.es/esp/Personal/personas/jmmarin/esp/Expertos/Lectura%20Datos%20R.txt

# Archivos *.txt: El archivo txt es un archivo de texto en el que los valores de las columnas están separados por espacios. En R, este tipo de archivos se lee como si fuese una tabla con read.table()
cat("\n
Archivos *.txt
\n")

# Ejercicio 1: para un trabajo investigativo se hizo una encuesta a 7 personas sobre el medio de transporte que usan. Se tiene registro del nombre de la persona, su edad, la ciudad en la que reside, el medio de transporte que usa, y cuántas veces a la semana lo utiliza
cat("\n
- Ejercicio 1: documento transporte.csv
\n")

cat("\n")
# En primera instancia es necesario hacer el llamado de leer el archivo txt, esto se hace con la función read.table(). Dentro de esta función indicaremos header=TRUE, para mostrar los encabezados
doc1 <- read.table("transporte.txt", header=TRUE)

# Mostraremos en la consola el contenido de este archivo
print(doc1)

cat("\n")
# Veremos que esta información aparece almacenada en forma de dataframe
cat("\n 
Es un dataframe? : \n")
print(is.data.frame(doc1))

# En vista que es un dataframe, verificaremos la cantidad de filas y columnas del mismo

cat("\n")
cat("\n")
# Número de filas
cat("\n 
Número de filas del dataframe: \n")
print(nrow(doc1))

cat("\n")
cat("\n")
# Número de columnas
cat("\n 
Número de columnas del dataframe: \n")
print(ncol(doc1))

cat("\n")
cat("\n")
# El encuestador quiere saber la información de las personas que viven en Itagui y usan automovil
cat("\n 
Personas que viven en Itagui y usan automovil: 
\n")

# Para esto se requiere el uso de la función subset() que permite extraer una información específica. Mostraremos lo obtenido
itagui_auto <- subset(doc1, ciudad=="Itagui" & medio_transporte=="automovil")
print(itagui_auto)

cat("\n")
cat("\n")
# El encuestador quiere saber quién es el que más veces usa el medio de transporte que frecuenta en una semana
cat("\n 
Persona que en una semana hace más uso de un medio de transporte: 
\n")

# Para esto se requiere el uso de la función subset() que permite extraer una información específica. Mostraremos lo obtenido
max_transpor <- subset(doc1, uso_semanal==max(uso_semanal))
print(max_transpor)

cat("\n")
cat("\n")
# El encuestador quiere almacenar, a parte en un archivo de texto, todas aquellas personas entrevistadas que se desplazan en moto para contactarlas y verificar si cuentan con todos los equipos de seguridad
cat("\n 
Personas que se desplazan en moto: 
\n")
# Para esto se requiere el uso de la función subset() que permite extraer una información específica. Mostraremos lo obtenido
perso_moto <- subset(doc1, medio_transporte=="moto")
print(perso_moto)

# Este dato, para almacenarlo en txt, lo haremos usando write.table()
write.table(perso_moto,"personas_moto.txt",row.names = FALSE)


# Línea separadora de temas
cat("\n",
"\n")
cat("-------------------------------------------------------------------")
cat("\n")
cat("\n")

# Ejercicio 2: formas de viaje. Una agencia de viajes tiene planes a diferentes destinos donde se puede llegar en avión o barco. 
cat("\n
- Ejercicio 2: documento viajes.txt
\n")

cat("\n")
# En primera instancia es necesario hacer el llamado de leer el archivo txt, esto se hace con la función read.table(). Dentro de esta función indicaremos header=TRUE, para mostrar los encabezados
doc2 <- read.table("viajes.txt", header=TRUE)

# Mostraremos en la consola el contenido de este archivo
print(doc2)

cat("\n")
# Veremos que esta información aparece almacenada en forma de dataframe
cat("\n 
Es un dataframe? : \n")
print(is.data.frame(doc2))

# En vista que es un dataframe, verificaremos la cantidad de filas y columnas del mismo

cat("\n")
cat("\n")
# Número de filas
cat("\n 
Número de filas del dataframe: \n")
print(nrow(doc2))

cat("\n")
cat("\n")
# Número de columnas
cat("\n 
Número de columnas del dataframe: \n")
print(ncol(doc2))

cat("\n")
cat("\n")
# La agencia quiere saber la información de las personas que viajarán en avión
cat("\n 
Personas que viajarán en avión: 
\n")

# Para esto se requiere el uso de la función subset() que permite extraer una información específica. Mostraremos lo obtenido
viaje_avion <- subset(doc2, medio_transporte == "avion")
print(viaje_avion)

cat("\n")
cat("\n")
# La agencia quiere saber también las personas que reservaron para más de 3 personas
cat("\n 
Personas que reservaron para más de 3 personas: 
\n")

# Para esto se requiere el uso de la función subset() que permite extraer una información específica. Mostraremos lo obtenido
reserva_3 <- subset(doc2, cantidad_personas >3)
print(reserva_3)

cat("\n")
cat("\n")
# La agencia preguntará además a las personas inscritas en un plan de viaje, si desean inscribirse en un tour por la ciudad
cat("\n 
Información completa añadiendo si desean o no el tour por la ciudad: 
\n")

doc2$tour <- c("si","si","no","si","si","si","no")
new.doc2 <- doc2
print(new.doc2)

# La agencia necesita el registro de solamente los que si desean el tour para pasar la información a la agencia de tour. Esto se almacenará en un archivo tipo txt
tour_si <- subset(doc2,tour=="si")
write.table(tour_si,"tour_si.txt")

