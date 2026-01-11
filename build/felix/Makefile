#!/usr/bin/env make

# grep '>' train_set.fasta | cut -d '|' -f 2 | sort | uniq -c | sort -nr
#  16396 EUKARYA
#   2764 NEGATIVE
#    935 POSITIVE
#    195 ARCHAEA
# 
# grep '>' train_set.fasta | cut -d '|' -f 3 | sort | uniq -c | sort -nr
#  15625 NO_SP
#   2582 SP
#   1615 LIPO
#    365 TAT
#     70 PILIN
#     33 TATLIPO

CPUS := 64
LEN := 100

CLASSES := EUKARYA NEGATIVE POSITIVE ARCHAEA
FAAS := $(patsubst %,%.faa,$(CLASSES))
  
all : $(FAAS) POSITIVE.afa ARCHAEA.afa

%.afa : %.faa
	clustalo -i $< -o $@ --outfmt=fa \
	--auto --threads=$(shell nproc) \
	--verbose --seqtype=protein
    
%.faa : ALL.fasta
	cat $< \
	| paste - - \
	| grep -F '|$*' \
	| tr "\t" "\n" \
	| cut -c 1-$(LEN) \
	> $@

ALL.fasta : train_set.fasta
	paste - - - < $< | cut -f1,2 > $@

clean :
	rm -f ALL.fasta *.faa *.afa *.aln
	
