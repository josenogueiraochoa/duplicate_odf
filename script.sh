#!/bin/bash

# As imaxes deben estar gardadas no directorio «logos»
######################################################################
# Este script funcionará sempre que o documento conteña unha soa imaxe
######################################################################
# Os documentos finais serán gardados no directorio «finais»
# comprobamos se existe, en caso contrario, é creado.

if [ ! -d finais ]; then
	mkdir finais
fi

# Facemos unha copia do documento base

if [ ! -f $1.bak ]; then
	cp $1 $1.bak
fi

# Extraemos a imaxe que está dentro do modelo base
unzip -o $1 "Pictures/*"

# Gardamos o nome que ten a imaxe interna 
NOME=$(ls Pictures)

# Agora temos que percorrer as imaxes do cartafol Logos e crear un novo ODF con cada unha delas
for image in logos/*
do
	cp $image Pictures/$NOME

	zip $1 Pictures/$NOME
	
	imagename=$(basename "$image")
	echo $imagename

	cp $1 finais/$(basename "$image")-$1

done
