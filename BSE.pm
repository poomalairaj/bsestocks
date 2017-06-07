#!/usr/bin/perl -w

package Finance::Quote::BSE;
require 5.004;

use strict;

use LWP::Simple;
use Time::Local;
use POSIX qw(strftime);

sub methods { return (bsestocks => \&bsestocks); }

{
    my @labels = qw/method source link name currency date isodate nav rprice sprice/;
    sub labels { return (bsestocks => \@labels); }
}

sub bsestocks {
    my $quoter = shift;
    my @symbols = @_;
  
    return unless @symbols;

    my(%fundquote, $url);

    foreach my $symbol (@symbols) {
        $fundquote{$symbol, "symbol"} = $symbol;
        $fundquote{$symbol, "currency"} = "INR";
        my $da = strftime "%d-%b-%y", localtime;
        $fundquote{$symbol, "date"} = $da;

        $url = "http://www.bseindia.com/stock-share-price/SiteCache/IrBackupStockReach.aspx?scripcode=$symbol";
        use LWP::Simple;
        my $content = get $url;
        my $currentPrice;
        if($content =~ /(tbmainred|tbmaingreen)\'\>([0-9]+\.[0-9]+?)\</) {
            $currentPrice = $2;
        }

        if ($currentPrice) {
            $fundquote{$symbol, "nav"} = $currentPrice;
            $quoter->store_date(\%fundquote, $symbol, {eurodate => $da});
            $fundquote{$symbol, "success"} = 1;
        } else {
            $fundquote{$symbol, "success"} = 0;
            $fundquote{$symbol, "errormsg"} = "Fund not found";
        }
    } 
    return wantarray ? %fundquote : \%fundquote;
}

1;
