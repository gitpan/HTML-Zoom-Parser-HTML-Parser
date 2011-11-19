
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Glue to power HTML::Zoom with HTML Parser",
  "AUTHOR" => "Matthew Phillips <mattp\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "HTML::Zoom" => 0,
    "HTML::Zoom::CodeStream" => 0,
    "HTML::Zoom::FilterBuilder" => 0,
    "HTML::Zoom::FilterStream" => 0,
    "HTML::Zoom::Producer::BuiltIn" => 0,
    "HTML::Zoom::SelectorParser" => 0,
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "HTML-Zoom-Parser-HTML-Parser",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "HTML::Zoom::Parser::HTML::Parser",
  "PREREQ_PM" => {
    "HTML::Entities" => 0,
    "HTML::TokeParser" => 0,
    "HTML::Zoom::SubObject" => 0,
    "base" => 0,
    "strictures" => 1
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t t/bugs/*.t t/synopsis/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



