#Stacks para análisis de datos obtenidos a partir de datos de representación reducida del genoma. 
Duhyadi Oliva García
##Introducción

Actualmente existe un número significativo de ensambladores de genoma de novo. La elección del ensamblador más apropiado dependera del tamaño, la complejidad del genoma (contenido de repetición, ploidía, etc.)  y del tipo de secuenciación utilizada para producir las lecturas de entrada. Cada ensamblador implementa diferentes metodos para tratar repeticiones en el genoma y lecturas quiméricas, cobertura desigual y errores de secuenciación. Razón por la que resulta complejo seleccionar el ensamblador ideal (Alhakami et al., 2017), tarea que se complica aún más cuando se trata de genomas completos (Mapleson et al., 2015). Aunando a la sintenia que acarrea la presencia de genes parálogos y ortólogos (Farrer, 2017).

Más allá de los genomas completos lo metodos de representación reducida del genoma se han  convertido en herramientas que permiten dar repuesta a preguntas en relación a la genética de poblaciones y la filpgenética. RAD-Seq, biblioteca genómicas basadas en sitios de restricción si bien  puede generar miles de loci por individuo, también pueden perderse datos (missing data). Razón por la que resulta prescindible analizar el tipo de datos generados al cambiar los parametros requeridos en una herramienta para analizar SNPs producto de RAD-Seq, el caso de STACKS 1.09 (Chattopadhyay
et al., 2014).

#Discusión

   La elección de los paramentros puede se de carácter biologico;   polimorfismo, nivel de ploidía y la hipótesis biológica que se está probando. O bien depender del tipo de estudio; número de individuos multiplexados, tipo (RAD, ddRAD, 2bRAD), la enzima de restricción utilizada (incluyendo el número de sitios de corte) , el número y la longitud de las lecturas sin procesar, la cobertura y  la plataforma de secuenciación utilizada. Así como de la calidad del ADN (Paris et al., 2017). Los tipos de parametros y  el tipo de decisión asociada se detallan a continuación:

    1) m (3-7) :
       - Si la cobertura es < 15x incrementa.
            - Si la contaminación incrementa.
            - Si se realizaran análisis filogenéticos.

    2) M (1-8):
       - Si los polimorfismos incrementan.
       - Si exsite alta divergencia genómica.
       - Si la porciones repetitivas o ploidía dismunuyen.
    3) n (=M, = M +1, =, M-1)
       -  Si se presenta alto polimorfismo.
       - Si la muestra procede de la misma población.
       - Si se realizaran análisis filogenéticos.

El parámetro m se refiere al número de lecturas requeridas para formar alelos, de manera general se sabe que usar valores altos aumenta la cobertura promedio de la muestra. Se guiere usarlo a partir de 3 . Cabe remarcar que aunque se utilice el valor más alto, no se podrán detectar polimorfismos. Respecto a M se sugiere usar valores bajos para alelos que provienen del mismo locus y valores altos con alto porcentanje de paralogos, importante tomar en cuenta que en valores altos decrece el número de loci emsamblados, además de que los loci repetitivos (parálagos)  se fusionarían erroenamente. Cabe señalar que este parámetro es sensible al nivel de polimorfismo y a los errores producidos por por la preparación y sencuenciaón RAD-seq.En el caso n=M se sugiere usarlo en individuos homocigotos.

Dado lo anterior se sugiere elegir el parámeto y variar lo valores  en base a genes paŕalagos, tamaño  secuenciado y estado del genoma homócigota o heterócigota.

##Script
ustacks -f ./samples/f0_male.fq.gz -o ./stacks -i 1 -m 3 -M 4 -p 15
 ustacks -f ./samples/f0_female.fq.gz -o ./stacks -i 2 -m 3 -M 4 -p 15
 ustacks -f ./samples/progeny_01.fq.gz -o ./stacks -i 3 -m 3 -M 4 -p 15
ustacks -f ./samples/progeny_02.fq.gz -o ./stacks -i 4 -m 3 -M 4 -p 15

# Referencias:
    • Alhakami et al (2017). A comparative evaluation of genome assembly reconciliation tools. Genome biology, 18(1), 93.
    • Mapleson et al (2015). RAMPART: a workflow management system for de novo genome assembly. Bioinformatics, 31(11), 1824-1826.
    • Farrer (2017). Synima: a Synteny imaging tool for annotated genome assemblies. BMC bioinformatics, 18(1), 507.
    • Chattopadhyay et al (2014). Effect of diversity and missing data on genetic assignment with RAD-Seq markers. BMC research notes, 7(1), 841.
