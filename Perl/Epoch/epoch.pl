#!/usr/bin/perl
use v5.14;
use Date::Parse;
use POSIX;

# print "epoch.pl v 0.0.3\n--------\n";
# TO DO:
#  Add diff bitween 2 epochs


if ($#ARGV == -1) {
	# Default (No args):
	# Print epoch for now()	
	my $iEpoch = time();
	my $splitEpoch = epoch_separate($iEpoch);
	print "\n--------\n$iEpoch ($splitEpoch)\n--------\n\n";
	
} else {	
	if ($ARGV[0] =~ m/^[\d]+$/) {
		# arg is only numerical
		my $sDateTime = localtime($ARGV[0]);
		print "\n--------\n$sDateTime\n--------\n\n";		
	} else {
		# arg is a date string - will fail if the format doesn't make sense
		my $iEpoch = str2time($ARGV[0]) or die "str2time doesn't understand that date $!\n";
		print "\n--------\n$iEpoch\n--------\n\n";
	}
}

sub epoch_separate($epoch) {
	my $returnVal;
	my $epoch = shift;
	my @chars = split //, $epoch;
	my $charCount = length($epoch);
	
	my $i;
	for ($i = 0; $i < scalar @chars; ++$i) {
		$returnVal .= @chars[$i];
		if ($i == floor(scalar @chars / 2)-1) {$returnVal .= " ";}
	}
	return $returnVal
}
