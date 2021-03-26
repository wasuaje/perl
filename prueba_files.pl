use strict;
use warnings;
my $f = "data.sql";
my $result = open my $fh, "<", $f;

if(!$result) {
	die "Couldn't open '".$f."' for reading because: ".$!;
}

# while(1) {
# 	my $line = readline $fh;
# 	print $line;
# 	last unless defined $line;
# 	# process the line...
# }
my $cnt = 0;
while(my $line = <$fh>) {
	if ($line =~ m/CREATE TABLE \`(\w+)\`/){
		my $t = $1;
		$cnt++; 
		$t =~ s/cf_|fc_//;
		print "Table: ", $t , "\n";
	}
}
print "\nTotal tablas creadas:", $cnt , "\n";