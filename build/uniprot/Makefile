#!/usr/bin/env make

.SECONDARY:
.DELETE_ON_ERROR:
.ONESHELL:

SHELL := bash
WGET := wget --continue

DAT := uniprot_sprot_bacteria.dat.gz
FASTA := uniprot_sprot.fasta.gz

all : signal.faa

# >sp|Q6GZX4|001R_FRG3G Putative tr
# ^          ^^^^^^^^^^ ^^^^^^^^^^^

signal.faa : signal.fasta signal.tsv
	seqkit fx2tab --only-id $< \
	| cut -f1,2 \
	| csvtk join -t -f 1 $(word 2,$^) /dev/stdin \
	| awk '{ print ">" $$1 " " $$2 "aa signal peptide" "\n" substr($$3,1,$$2) }' \
	> $@

signal.fasta : signal.ids $(FASTA)
	gzip -d -c $(word 2,$^) \
	| sed 's/^>sp.*|/>/' \
	| seqkit fx2tab \
	| grep -f $< -F \
	| seqkit tab2fx -w 0 \
	> $@

signal.ids : signal.tsv
	cut -f1 $< | sort > $@

#OPAK_NEIGO	<1..1
#PAM_STRPY	<1..29

signal.tsv : $(DAT)
	zgrep -E '^(ID|FT   SIGNAL)' $< \
	| grep --no-group-separator -B 1 ' SIGNAL' \
	| paste - - \
	| awk '{ print $$2 "\t" $$8 }' \
	| grep -v  '[<?]' \
	| sed 's/1\.\.//' \
	> $@

$(DAT) :
	$(WGET) https://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/taxonomic_divisions/$(@)

$(FASTA) : 
	$(WGET) https://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/complete/$(@)

clean :
	rm -f signal.*
