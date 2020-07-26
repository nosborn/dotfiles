#!/bin/sh

set -o errexit
set -o nounset

[ "$(hostname -s)" = "19SGD-MAC11" ] && exit

/usr/local/bin/cpan -T \
  Digest::SHA1 \
  IO::Socket::SSL \
  JSON \
  JSON::Parse \
  Log::Log4perl
