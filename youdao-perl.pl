#!/usr/bin/perl
#########     Author:guotf@Guotft
#########       Time:2012/11/25 07:56:57

use strict;
#use warnings;
use 5.010;

use Encode;
use LWP::Simple;
use Data::Dumper;
use XML::Simple;

binmode(STDIN, ':encoding(utf8)');
binmode(STDOUT, ':encoding(utf8)');
binmode(STDERR, ':encoding(utf8)');

my $API_KEY = "";
my $KEYFROM = "";

open CONF, "<./youdao-perl.ini" or die("youdao-perl.ini file is not");

my @conf = <CONF>;

for my $ini (@conf){
  if($ini =~ m/^API_KEY=(.*)$/){
	say $1;
	$API_KEY = $1;
  }
  if($ini =~ m/^KEYFROM=(.*)$/){
	say $1;
	$KEYFROM = $1;
  }
}

my $DISPLAY_SIZE = 20;

foreach my $word (@ARGV){
  my $result = get("http://fanyi.youdao.com/openapi.do?keyfrom=" . $KEYFROM . "&key=" . $API_KEY . "&type=data&doctype=xml&version=1.1&q=" . $word);

#say somthing
#my $result = get("http://www.baidu.com");
#say $result;
#say "-------------------------";


  # 强制 将子个数为 1 的元素替换为一个数组
  my $config = XMLin($result, ForceArray => ['ex']);

#  print Dumper($config);

  my $BASIC_EXPLAINS = $config->{basic}->{explains}->{ex};

  my $_size_dis = ($DISPLAY_SIZE - length $word) / 2;

  printf " "x$_size_dis . "\033[7m " . $word . "\033[m" . " "x$_size_dis . "\n";
  foreach (@{$BASIC_EXPLAINS}) {
	say $_;
  }

#  say $config->{basic}->{explains}->{ex}->[1];
}
