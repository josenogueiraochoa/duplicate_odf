#!/bin/bash

# As imaxes deben estar gardadas no directorio «logos»
######################################################################
# Este script funcionará sempre que o documento conteña unha soa imaxe
######################################################################
# Os documentos finais serán gardados no directorio «finais»
# comprobamos se existe, en caso contrario, é creado.

######################################################################
### IMAGEMAGICK
######################################################################

convert -resize x136 -background white -gravity west -extent 743x136 presidencia_cor.png resize_presidencia.png

######################################################################

if [ ! -d finais ]; then
	mkdir finais
fi

# Facemos unha copia do documento base

if [ ! -f $1.bak ]; then
	cp $1 $1.bak
fi

rm Pictures/*
# Extraemos a imaxe que está dentro do modelo base
unzip -o $1 "Pictures/*"

# Gardamos o nome que ten a imaxe interna 
#NOME=$(ls Pictures)

ls Pictures/ > files.txt
NOME=$(head files.txt)

if [ $2 == 1 ]; then
	NOME=$(head -1 files.txt)
else
	NOME=$(head -2 files.txt | tail -1 files.txt)
fi

# Agora temos que percorrer as imaxes do cartafol Logos e crear un novo ODF con cada unha delas
for image in logos/*
do
	cp $image Pictures/$NOME

	zip $1 Pictures/$NOME
	
	#imagename=$(basename "$image")
	#echo $imagename

	cp $1 finais/$(basename "$image")-$1

done

cp $1.bak $1
rm files.txt
