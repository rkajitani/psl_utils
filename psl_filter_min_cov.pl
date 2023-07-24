#!/usr/bin/perl

(@ARGV != 3) and die "usage: $0 in.psl min_query_cov min_identity(#matches/(#matches+#mismatches))\n";

$min_query_cov = $ARGV[1];
$min_idt = $ARGV[2];

open($in, $ARGV[0]);
while (chomp($l = <$in>)) {
	@f = split(/\t/, $l);

	$aln_len = 0;
	for (split(/,/, $f[18])) {
		$aln_len += $_;
	}

	if (($aln_len / $f[10] >= $min_query_cov or $aln_len / $f[14] >= $min_query_cov)
			and $f[0] / ($f[0] + $f[1]) >= $min_idt) {
		print "$l\n";
	}
}
close $in;
		
