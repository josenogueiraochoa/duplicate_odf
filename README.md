Manual de Usuario
=================
 
Ficheiro 'script.sh'
--------------------
Este script modifica a imaxe do documento. Está preparado para traballar con dúas imaxes. O segundo argumento do script pode ser 1 ou 2. De tal xeito que actualiza a primeira ou a s egunda imaxe que se descomprime en /Pictures. No caso do modelo de proba, primeiro descomprime a marca Galicia, e despois a marca Xunta, polo que para actualizar a marca principal (Xunta), hai que pasarlle como argumento '2'.
Para poder recuperar o nome da primeira ou segunda imaxe, temos que enviar a saída de 'ls' a un ficheiro externo, e así poder executar os comandos 'head' e 'tail'.
Facemos unha copia inicial do modelo a actualizar, e ao final do script restauramos para deixalo na súa versión orixinal.
Se o documento tivera máis imaxes habería que modificar a sección 'if' que executa os 'head' e 'tail' sobre o ficheiro files.txt

Ficheiro 'convert_logo.sh'
--------------------------
Este script recibe como único argumento un directorio onde se atopan as imaxes a modificar (PNG). Executamos o comando 'convert' de ImageMagick para modificar o tamaño a unha altura de 136 px. E tamén modificamos o tamaño do lienzo a 743x136 con fondo branco, e gravidade west. Os ficheiros modificados quedan gardados na mesma ruta coa extensión '.new'

Ficheiro 'modelo_libo.ott'
--------------------------
Este modelo foi empregado para realizar as probas. A marca da Xunta que está dentro ten as proporcións para que as outras marcas poidan ocupar o mesmo espazo (743x136). Fixeronse as probas coa marca da Xunta, pero ao non ter as mesmas dimensións, a imaxe quedaba distorsionada.
