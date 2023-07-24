#!/usr/bin/perl

(@ARGV != 2) and die "usage: $0 in.psl min_query_cov\n";

$min_query_cov = $ARGV[1];

open($in, $ARGV[0]);
while (chomp($l = <$in>)) {
	@f = split(/\t/, $l);

	$aln_len = 0;
	for (split(/,/, $f[18])) {
		$aln_len += $_;
	}

	if ($aln_len / $f[10] >= $min_query_cov) {
		print "$l\n";
	}
}
close $in;
		
