#!/usr/bin/perl
use v5.14;

# Version 0.0.3
my %options = getOptions();


# Arguments to cwwav
my $wpm = 15;
my $farnsworth_wpm = 10;
my $frequency = 800;

my $word_length = 5;

my $morse_list = "";
my %morse = "";
initMorseHash();
my $audio_dir = $options{"morse_output_audio_dir"};
my $output_dir = "$audio_dir${word_length}LETTER/";
my $word_file = "word_files/Words(${word_length}Letter).txt";
my $output_file_ext = ".wav";
# my $anki_file_ext = ".ogg";
my $anki_file_ext = ".wav";


open my $words, $word_file or die "Could not open $word_file: $!";

while( my $line = <$words>)  { 
	chomp $line;
	my $morse = text2morse($line);
	my $filname = "WD_${word_length}_${line}_${frequency}hz_${wpm}wpm_${farnsworth_wpm}F";
	print $line . " = " . $morse  . "\n";
	# wav
	`echo "$line" | cwwav -f "$frequency" -F "$farnsworth_wpm" -w "$wpm" -o "$output_dir$filname$output_file_ext"`;
	
	# Write then import file to use mp3 then
	# Use this line to convert wav to mp3 afterwards
	# for f in *.wav ; do ffmpeg -i "$f" -acodec libmp3lame -q:a 2 "${f%.*}.mp3"; done

	# Add to the string that will be printed to the Anki import tsv
	$morse_list .= "$line\t$morse\t\t[sound:$filname$anki_file_ext]\t\t\t${word_length}LETTER\n";
	
}

close $words;

# Wite Anki import tsv
my $filename = $output_dir."MorseWordList_${word_length}Letter.tsv";
open(FH, '>', $filename) or die $!;
print FH $morse_list;
close(FH);

sub text2morse() {
	my $return_string = "";
	my @chars = split(//, $_[0]);
	foreach (@chars) {
		$return_string .= $morse{$_};
	}
	return $return_string;
}

sub getOptions() {
	my %options;
	my $file = ".static/options.txt";
	open my $OPTIONS, $file or die "Could not open $file: $!";
	my @tokens;
	while( my $option = <$OPTIONS>)  {
		chomp $option;
		@tokens = split("=", $option);
		$options{$tokens[0]} = $tokens[1];
	}
	return %options;
}

sub initMorseHash() {
%morse =   ('A' => '*- ',
			'B' => '-*** ',  
			'C' => '-*-* ', 
			'D'=> '-** ', 
			'E' => '* ', 
			'F' => '**-* ', 
			'G' => '--* ', 
			'H' => '**** ', 
			'I' => '** ', 
			'J' => '*--- ',
			'K' => '-*- ',
			'L' => '*-** ',
			'M' => '-- ',
			'N' => '-* ',
			'O' => '--- ',
			'P' => '*--* ',
			'Q' => '--*- ',
			'R' => '*-* ',
			'S' => '*** ',
			'T' => '- ',
			'U' => '**- ',
			'V' => '***- ',
			'W' => '*-- ',
			'X' => '-**- ',
			'Y' => '-*-- ',
			'Z' => '--** ',
			'.' => '*-*-*- ',
			',' => '--**-- ',
			"'" => '*----* ',
			'?' => '**--** ',
			'@' => '*--*-* ');
}
