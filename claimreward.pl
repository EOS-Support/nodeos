#!/usr/bin/perl

use strict;
use warnings;
my $wallet_pass="/root/pass";  # wallet password file
my $wallet_name = "test";      # wallet name

my $unlock_cmd="cat $wallet_pass |cleos wallet unlock -n $wallet_name";

while(1)
{
`$unlock_cmd`;
my $account = "eossupportbp";
my $output = `cleos -u https://api.eossupport.io system claimrewards $account`;

print $output;
sleep(86400); 
}
