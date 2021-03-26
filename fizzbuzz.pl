#!/usr/bin/perl
use strict;
use warnings;
# "Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” 
# instead of the number and for the multiples of five print “Buzz”.
#  For numbers which are multiples of both three and five print “FizzBuzz”."

my $cnt=1;

while ( $cnt <  101) {
    
    if ( $cnt % 3 == 0 and $cnt % 5 == 0 ) {
    	print "fizzbuzz". "\n";
    }elsif ( $cnt % 3 == 0 ) {
    	print "fizz". "\n";
    }elsif ( $cnt % 5 == 0 ) {
    	print "buzz". "\n";
    }else{
    	print $cnt . "\n";
    }
    
    $cnt++;

}