#!/usr/bin/perl

(@ARGV != 1) and die "usage: $0 in.psl\n";

open($in, $ARGV[0]);
while (chomp($l = <$in>)) {
	@f = split(/\t/, $l);
	unless (defined $max{$f[9]}) {
		push(@order, $f[9]);
	}
	if ($max{$f[9]} < $f[0]) {
		$max{$f[9]} = $f[0];
		$max_line{$f[9]} = $l;
	}
}
close $in;
		
for (@order) {
	print($max_line{$_}, "\n");
}
