#!/usr/bin/perl
# $Id$

use ExtUtils::MakeMaker;

WriteMakefile
  ( NAME           => 'POE::Session::MessageBased',

    ( ($^O eq 'MacOS')
      ? ()
      : ( AUTHOR   => 'Rocco Caputo <rcaputo@cpan.org>',
          ABSTRACT => 'Message-based events for POE (no @_ slices)',
        )
    ),

    VERSION_FROM   => 'MessageBased.pm',
    PM             => { 'MessageBased.pm' => '$(INST_LIBDIR)/MessageBased.pm'
                      },
    dist           =>
    { 'COMPRESS' => 'gzip -9f',
      'SUFFIX'   => 'gz',
      PREOP      => ( 'cvs-log.perl | ' .
                      'tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
                    ),
    },
    PREREQ_PM      => { 'POE' => 0.25,
                      },
  );
