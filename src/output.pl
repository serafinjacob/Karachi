#!/usr/bin/perl
#
#   Packages and modules
#
use strict;
use warnings;
use version;         our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Statistics::R;

# Create a communication bridge with R and start R
my $R = Statistics::R->new();

# Set up the PDF file for plots
$R->run(qq`pdf("Question 1 Plot" , paper="letter")`);

# Load the plotting library
$R->run(q`library(ggplot2)`);

# read in data from a CSV file
$R->run(qq`data <- read.csv("priceIndex.txt")`);

# plot the data as a line plot with each point outlined
###THIS NEEDS TO BE HEAVILY EDITTED STILL
$R->run(q`ggplot(data, aes(x=Month, y=CPI, colour=Category, group=Category)) + geom_line() + geom_point(size=2) + ggtitle("Alcohol vs Education Monthly Trends") + ylab("CPI Value") + xlab("Month") `);

# close down the PDF device
$R->run(q`dev.off()`);

$R->stop();
