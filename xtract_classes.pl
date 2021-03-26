use strict;
use warnings;
my $f = "models.txt";
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
my $cls = my $fld = my $mth = 0;
my %data;
my $mths;
my @arrFields =[];
my @arrMethods =[];

while(my $line = <$fh>) {
	if ($line =~ m/class (\w+)/){
		#my $t = "Model:" . $1 . "\n";
		$cls++; 
		if ($1 ne "Meta"){
			$mths=$1;
			my @arrFields=[];
			my @arrMethods=[] ;
			#print "MTH:" . $mth;
			#print "Fields:" . "\n";
			#%data{$mth} = ();
		}
		#$t =~ s/cf_|fc_//;
		#print "Table: ", $t , "\n";
	}elsif ($line =~ m/(.*) \= models\..*\(.*\)/){
		#my $t =  $1 . "\n";
		$fld++; 
		#print $;
		#print "MTH:" . $mth;

		push(@arrFields , $1) ;
		$data{$mths}{fields} = [ @arrFields ];
	}elsif ($line =~ m/def\s+(\w+)/){
		#my $t =  $1 . "\n"; 
		#print $mth;
		push(@arrMethods ,  $1);
		#print @arrMethods;
		$data{$mths}{methods} = [ @arrFields ];
		$mth++;
	}
}


 #print @arrMethods;
#  print "\n";
#  print @arrFields;

#print $data{"Auction"}{"methods"};
foreach   ( $data{"Auction"}{"methods"} )
 		{
          #print $data{"Auction"}{"methods"}[$i];
          print $_;
 		}

# for my $model (sort keys %data) {
#     print "Model '$model' \n";
#     print "Fields: \n" ;
    
#     for my $i (0 .. $data{$model}{"fields"})
# 		{
#          print $arrFields[$i];
# 		}
#     print "Methods: \n" ;
#     for my $method (sort $data{$model}{"methods"})
#     	{
#     		print "\n";
#     		print $method ;
    		
#     	}   
# }

#  # print %data; 
#  #    print  "\n";
#  #    print %data ;
#  #    print  "\n";

# print "\nTotal Models:", $cls , "\n";
# print "\nTotal Fields:", $fld , "\n";
# print "\nTotal Methods:", $mth , "\n";

# #print $data{"Auction"}{"methods"};



