#!/usr/bin/perl

use strict;
use warnings;
my $wallet_pass="/home/ubuntu/eosio-wallet/support.pass";
my $wallet_name = "support";

my $unlock_cmd="cat $wallet_pass |cleos wallet unlock -n $wallet_name";
my $free_powerup_cmd = "curl https://api.eospowerup.io/freePowerup/eossupportbp";

while(1)
{
`$unlock_cmd`;
my $output;
for (my $i = 0; $i < 2; $i++) {
`$free_powerup_cmd`;
my $account = "eossupportbp";
$output = `cleos system claimrewards $account -p $account\@claimer`;
}

print $output;
sleep(86400); 
}
