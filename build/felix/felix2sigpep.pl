#!/usr/bin/env perl
use strict;

while (not eof() ) {
  my $id = <>;
  my $aa = <>;
  my $ss = <>;
  next unless $id =~ m/\|SP\|/;
  next unless $ss =~ m/^(S+)/;
  print $id, substr($aa, 0, length($1)),"\n";
}
