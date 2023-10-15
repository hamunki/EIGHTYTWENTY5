#!/usr/bin/perl
use v5.14;

print("Reading Options File\n");
my %options = getOptions();
print("Options File OK\n");
print("Filepath: " . $options{"morse-output_audio_dir"} . "\n");

sub getOptions() {
	my %options;
	my $file = ".static/options.txt";
	open my $OPTIONS, $file or die "Could not open $file: $!";
	my @tokens;
	while( my $option = <$OPTIONS>)  {
		@tokens = split("=", $option);
		$options{$tokens[0]} = $tokens[1];
	}
	return %options;
}
