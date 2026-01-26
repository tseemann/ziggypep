[![CI](https://github.com/tseemann/ziggypep/workflows/CI/badge.svg)](https://github.com/tseemann/ziggypep/actions)
[![GitHub release](https://img.shields.io/github/release/tseemann/ziggypep.svg)](https://github.com/tseemann/ziggypep/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Conda](https://img.shields.io/conda/dn/bioconda/ziggypep.svg)](https://anaconda.org/bioconda/ziggypep)
[![Language: Perl 5](https://img.shields.io/badge/Language-Perl%205-blue.svg)](https://www.perl.org/)

# ziggypep

Identify signal peptides in protein sequnces

## Description

I want to make an free, unencumbered tool to
identify signal peptides in protein sequences.
The existing tools are either not open source,
require an academic licence, only have a 
webserver, or not installable in Bioconda.

Ziggypep uses a very simplistic method 
which achieves
1026/1320 (72%) on a 
[positive test set](https://github.com/tseemann/ziggypep/blob/main/test/pos.faa)
and 1234/1334 (93%) on a
[negative test set](https://github.com/tseemann/ziggypep/blob/main/test/neg.faa.bz2).

## Installation

```
conda install -c bioconda -c conda-forge ziggypep
```

## Quick start

```
% ziggypep test/test.faa.gz

WP_456262590.1  0
WP_407478045.1  14      MDTLQAIILAIVEG
WP_456262591.1  0
WP_456262592.1  38      MKQLPTITDSYKKEVQKSVLSIILFFTVYFILILFSLA
WP_249063066.1  0
WP_016200366.1  0
WP_078792968.1  20      MKKIAVLITMLMTGIIFAQV

# only list those with signal peptides
% ziggypep -s test/test.faa.gz

WP_407478045.1  14      MDTLQAIILAIVEG
WP_456262592.1  38      MKQLPTITDSYKKEVQKSVLSIILFFTVYFILILFSLA
WP_078792968.1  20      MKKIAVLITMLMTGIIFAQV
```

## Usage

### Input

You must provide protein FASTA files:
```
>WP_016198972.1 
MEQNITLVWENCLSFMRDNLNSIEEKEGVNKLDDSFDLL
LSLLSAALKKNIGKGVKLWYSVMENKPVGKIPPVTIQK
>WP_271151124.1
MVNIDSQLNAMLTFDNFIEGESNKFASTVARTIAKRPG
PDKVVLYVSSEKFIQQFVSAAKAQNKTDF
...
```
They can be compressed with `.gz` or `.bz2`.
You can provide multiple files if you like.
```
% ziggypep test/test.ffa.gz test/pos.faa test/neg.faa.bz2 
```

### Output

Output is tab-separated 3 columnns with no header.
* Column 1 = sequence name, from the `>` FASTA header
* Column 2 = length of signal peptide, 0 if none
* Column 3 = signal peptide sequence, empty if none
```
WP_407478045.1  14      MDTLQAIILAIVEG
WP_456262591.1  0
WP_456262592.1  38      MKQLPTITDSYKKEVQKSVLSIILFFTVYFILILFSLA
WP_249063066.1  0
```

### Options

```
  -h       Print this help
  -v       Print version and exit
  -C       Show citation and exit
  -q       No output while running, only errors
  -s       Only print postive results
```

## Etymology

This tool finds signal peptides.
I like the name 
["Ziggy"](https://en.wiktionary.org/wiki/Ziggy) - I have
a family member with that name, I love 
[David Bowie's](https://en.wikipedia.org/wiki/David_Bowie) 
[Ziggy Stardust](https://en.wikipedia.org/wiki/Ziggy_Stardust_(character)),
Also, it rhymes with 
[Iggy Pop](https://en.wikipedia.org/wiki/Iggy_Pop)
who is also a rock legend who worked with Bowie in
his early career.
Ziggy was the 
["A.I"](https://en.wikipedia.org/wiki/List_of_Quantum_Leap_(1989_TV_series)_characters#Ziggy)
in the classic 1989 sci-fi series 
[Quantum Leap](https://en.wikipedia.org/wiki/Quantum_Leap_(1989_TV_series)).

## References

* [SignalP](https://github.com/fteufel/signalp-6.0)
* [Phobius](https://phobius.sbc.su.se/data.html)
* [Wikipredia](https://en.wikipedia.org/wiki/Signal_peptide)

## Feedback

File questions, bugs, or ideas on the 
[Issues page](https://github.com/tseemann/ziggypep/issues)

## License

[GPLv3](https://raw.githubusercontent.com/tseemann/ziggypep/master/LICENSE)

## Author

[Torsten Seemann](https://tseemann.github.io)
