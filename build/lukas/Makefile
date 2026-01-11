#!/usr/bin/env make

.SECONDARY:
.DELETE_ON_ERROR:
.ONESHELL:

#1. Transmembrane proteins with signal peptides: `m [0-9].faa`
#2. Transmembrane proteins without signal peptides:  `t[0-9].faa`
#3. Non-transmembrane proteins with signal peptides : `s[0-9].faa`
#4. Non-transmembrane proteins without signal pepti des: `g[0-9].faa`

SHELL := bash
CLASSES := m s t g
# $(patsubst %,%.fasta,$(CLASSES))

all : lukas.faa

lukas.faa : pos.faa neg.faa
	cat $^ > $@
	
pos.faa : m.fasta s.fasta
	cat $^ > $@

neg.faa : g.fasta t.fasta
	cat $^ > $@
	
%.fasta : $(shell echo %?.faa)
	cat $^ \
	| paste - - - \
	| cut -f 1,2 \
	| tr "\t" "\n" \
	| sed 's/^ *//g' \
	> $@	
	
clean :
	rm -f *.fasta 
	rm -f lukas.faa pos.faa neg.faa

