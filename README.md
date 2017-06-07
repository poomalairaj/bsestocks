# BSE Online Quotes for GnuCash
Perl module to fetch live price from Bombay Stock Exchange (BSE) for Gnucash Finance module Finance::Quote

# What is this?
This is a simple perl module for GnuCash which can fetch live stock quotes from Bombay Stock exchange site bseindia. com

# Prerequisites

Install gnucash before using this module

# Installation

## Linux

1. Copy `BSE.pm` to  `/usr/share/perl5/Finance/Quote` 
 
 ```sudo cp BSE.pm /usr/share/perl5/Finance/Quote```

 2. Add `BSE` to `@modules` array in `/usr/share/perl5/Finance/Quote.pm` file or just copy `Quote.pm` file to `/usr/share/perl5/Finance/` and overwrite the existing file.

## Windows (Not tested):
 
 1. Copy `BSE.pm` to `C:\Perl\site\lib\Finance\Quote`

 2. Add `BSE` to `@modules` array in `C:\Perl\site\lib\Finance\Quote.pm` file or just copy `Quote.pm` file to `C:\Perl\site\lib\Finance\` and overwrite the existing file.

# Usage

When adding or editing a security from the Security Editor, click on the check box "Get Online Quotes". Now select "unknown" radio button. In the dropdown you can select "bsestocks" option.

Once done, whenever you click "Get Quotes" button from the Price Editor window, the price of the stock gets updated from BSE.
