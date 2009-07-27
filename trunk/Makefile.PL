#!/usr/bin/perl
# $Id$

use ExtUtils::MakeMaker;

# Touch CHANGES so MakeMaker will see it.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
	NAME          => 'POE::Session::MessageBased',
	AUTHOR        => 'Rocco Caputo <rcaputo@cpan.org>',
	ABSTRACT      => 'Message-based events for POE (no @_ slices)',
	LICENSE       => 'perl',
	VERSION_FROM  => 'MessageBased.pm',
	PM            => {
		'MessageBased.pm' => '$(INST_LIBDIR)/MessageBased.pm'
	},
	META_ADD     => {
		resources  => {
			license    => 'http://dev.perl.org/licenses/',
			repository => 'http://thirdlobe.com/svn/pose-messagebased/trunk'
		},
	},
	dist          => {
		'COMPRESS'  => 'gzip -9f',
		'SUFFIX'    => 'gz',
		PREOP       => (
			'svn-log.perl --repo https://thirdlobe.com/svn/pose-messagebased | ' .
			'tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
		),
	},
	PREREQ_PM     => {
		'POE'        => 0.31,
		'Test::More' => 0,
	},
);
