#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my $filename = "draw.js";

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
 
my $minus_x = 90.236000;
my $minus_y = 36.000000;


my $method;
my %methods;

while (my $row = <$fh>) {
    chomp $row;        # Remove the line end stuff
    
    if ( $row =~ / +(\w+)\(/ )
    {
        $method = $1;
#        print "$1\n";
    }
    
    my ($x,$y) = ($row =~ /moveTo\((\d+\.\d+)\, (\d+\.\d+)\)/);
    if ( $x && $y )
    {
        $x -= $minus_x;
        $y -= $minus_y;
        push(@{$methods{$method}},"$x,$y");
#        print "ctx.moveTo(offsetX + $x * multiplier, offsetY + $y * multiplier)\n";
        
        
    }

    my ($x,$y) = ($row =~ /lineTo\((\d+\.\d+)\, (\d+\.\d+)\)/);
    if ( $x && $y )
    {
        $x -= $minus_x;
        $y -= $minus_y;
        push(@{$methods{$method}},"$x,$y");
#        print "ctx.lineTo(offsetX + $x * multiplier, offsetY + $y * multiplier);\n";
        
        
    }
    my ($p1x,$p1y,$p2x,$p2y,$x,$y) = ($row =~ /bezierCurveTo\((\d+\.\d+)\, (\d+\.\d+)\, (\d+\.\d+)\, (\d+\.\d+)\, (\d+\.\d+)\, (\d+\.\d+)\)/);
    if ( $p1x && $p1y && $p2x && $p2y && $x && $y )
    {
        $p1x -= $minus_x;
        $p1y -= $minus_y;
        $p2x -= $minus_x;
        $p2y -= $minus_y;
        $x -= $minus_x;
        $y -= $minus_y;
        push(@{$methods{$method}},"$p1x,$p1y,$p2x,$p2y,$x,$y");
#        print "ctx.bezierCurveTo(offsetX + $p1x * multiplier, offsetY + $p1y * multiplier, offsetX + $p2x * multiplier, offsetY + $p2y * multiplier, offsetX + $x * multiplier, offsetY + $y * multiplier)\n";
    }
    
    
    
    
    
}

print Dumper(\%methods);


