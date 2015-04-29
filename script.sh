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

rm Pictures/*
# Extraemos a imaxe que está dentro do modelo base
unzip -o $1 "Pictures/*"

# Gardamos o nome que ten a imaxe interna 
#NOME=$(ls Pictures)

ls Pictures/ > files.txt
NOME=$(head files.txt)

case "$2" in

1) 
	NOME=$(head -1 files.txt)
	;;

2)
	NOME=$(head -2 files.txt | tail -1)
	;;

3)
	NOME=$(head -3 files.txt | tail -1)
	;;
esac


# Agora temos que percorrer as imaxes do cartafol Logos e crear un novo ODF con cada unha delas
for image in logos/*
do
	cp $image Pictures/$NOME

	zip $1 Pictures/$NOME
	
	cp $1 finais/$(basename "$image")-$1

done

cp $1.bak $1
rm files.txt
