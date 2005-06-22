#!/usr/bin/perl
# $Id$

use warnings;
use strict;

use lib './blib/lib';
use lib '../blib/lib';

use POE::Kernel;
use POE::Session::MessageBased;

print "1..11\n";

POE::Session::MessageBased->create(
	inline_states => {
		_start => sub {
			my ($message, @params) = @_;
			print "not " unless $message->isa("POE::Session::Message");
			print "ok 1\n";
			$message->kernel->yield( count => 2 );
		},
		count => sub {
			my ($message, $count) = @_;
			print "ok $count\n";
			if ($count < 10) {
				$message->kernel->yield( count => ++$count );
			}
		},
		_stop => sub {
			print "ok 11\n";
		}
	},
);

$poe_kernel->run();
