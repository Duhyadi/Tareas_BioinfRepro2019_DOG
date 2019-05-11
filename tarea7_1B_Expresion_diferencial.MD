- - -
#Introducción a la Bioinformática para Biólogos y Genetistas, 2019
-------------------

##Unidad 7 

##Tarea 7.1 “ Expresión diferencial”

###10/05/2019

###Duhyadi Oliva García 
###Doctorado en Ciencias Biológicas 
###Universidad Nacional Autónoma de México 

####Introducción y hipótesis 

Se reconoce que el  ChrY también podría estar vinculado a las diferencias en el perfil de la expresión génica en los corazones de ratones machos adultos . 

####Metodología  

Importar la matriz en R, seleccionar aleatoriamente 5000 filas y exportar el subset de datos en un archivo plano separado por tabulaciones.

#####Muestreo aleatorio
Data.Raw = sample_n(Data.Raw, size=5000, replace=FALSE)

i) En vez de considerar un transcrito presente si la sonda lo detectó en el 50% de las muestras 	de cualquier grupo experimental, hágalo cuando se detectó en al menos el 25% de las muestras 	de todos grupos experimentales.
		
En la instrucción:
present  <- apply(detected_per_group >= 3, 1, any)
se cambió 3 por 2. Si la condición fuera x>= 0 se tendría el 100%, x >=1 ← 75%, x>=2 		← 50%, x>=3 ← 25%, x>4 ← 0%, pues ningún elemento podría cumplir la condición 		en más de 4 grupos al ser 4 el número máximo. 

El bloque correspondiente es el anterior. 

probe_present      <- Data.Raw[,detection] < 0.04
detected_per_group <- t(apply(probe_present, 1, tapply, design$Group, sum))
present  <- apply(detected_per_group >= 3, 1, any)
normdata <- normdata[present,]
annot    <- annot[present, ]
ii) 500 permutaciones 
		
test.cmat <- matest(madata, fit.fix, term="Group", Contrast=cmat, n.perm=500, 		
test.type= "ttest", shuffle.method="sample", verbose=TRUE)

iii) FDR de 0.19.
	
fdr_th     <- 0.19 # Proportion of false discoveries that are acceptable

iv) En vez de seleccionar un gen si cualquier sonda asociada al gen está seleccionada, hágalo 	solo cuando todas las sondas lo están.
 
	genes.int <- tapply(probes.int, results$EntrezID, all)

#####Resultados 

Es comun obtener en los análisis de microarreglos sondas con diferente calidad posterior al alineamiento contra el genoma de referencia. Resulta necesario visualizar graficamente la calidad de los datos crudos. En la figura 1 se observa una menor intensidad en cada uno de los microarreglos con sondas de calidad menor, las cuales deberán ser eliminadas. Mientras que, para aquellas que poseen una mejor calidad se observar una mayor intensidad. 









!["Figura 1"](https://github.com/Duhyadi/Tareas_BioinfRepro2019_DOG/blob/master/boxplot_raw_probe_qc.png)







Figura 1. Diagramas de caja. Datos sin procesar en escala log (eje y) por microarreglo (eje y). Los colores hacen referencia a la calidad de la sonda: rojo, mala calidad y verde buena calidad.  

Además de visualizar la intensidad de la señal para cada uno de los mircroarreloglos, resulta necesario hacerlo para cada uno de los tratamientos. Castrados, C y no castrados (Figura 2). 



!["Figura 2"](https://github.com/Duhyadi/Tareas_BioinfRepro2019_DOG/blob/master/boxplot_raw_treatment.png )







 Figura 2. Diagramas de caja. Datos crudos por microarreglo. Las cajas están coloreadas según tratamiento: rojo (castrados) y verde (no castrados). 
Con la finalidad de comparar la significancia de los valores de p asociados al análisis de varianza se estima el valor de F de manera convencional (F) y con la contracción de la varianza usando múltiples sondas (Fs). En la figura 3 se observan graficas asociadas a las distintintas formas de calcular p. Los graficos observados presentan el mismo comportamiento para genotipo (Geno), tratamiento (Trt) e interacción genotipo por tratamiento (Int). 



!["Figura 3"](https://github.com/Duhyadi/Tareas_BioinfRepro2019_DOG/blob/master/P-values%20Hist.png )










Figura 3. Densidad de la distribución de los valores de p. Ptab: tabular, Pvalperm: permutación, F1: prueba de F convencional, Fs: prueba de F con contracción de la varianza usando información de múltiples sondas. 

En relación al número de genes expresados por genotipo,  tratamiento e interacción en la figura 4 se observa el número de genes expresados diferencialmente, observandose un mayor número de genes para el genotipo. Mientras que en el gráfico 5 se observa la expresión diferencial por tratamiento y genotipo. 




![Figura 4](https://github.com/Duhyadi/Tareas_BioinfRepro2019_DOG/blob/master/vennDiagram_DiffExprs.png)








Figura 4. Genes expresados diferencialmente. 




![Figura 5 ](https://github.com/Duhyadi/Tareas_BioinfRepro2019_DOG/blob/master/vennDiagram_Int.png)








Figura 5. Genes expresados diferencialmente. A, tratamiento y B genotipo. 

Conclusión: 

Los resultados arrojan que las diferencias detectadas están mediadas mayoritariamente por el genotipo de acuerdo a lo reportado por Verdugo et al 2009. 
Referencia: 

    • Llamas B (2009) Chromosome Y variants from different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. Bmc Genomics, 10(1), 150.



