#!/bin/sh

set -o errexit
set -o nounset

case "$(hostname -s)" in
  19SGD-*) exit ;;
esac

/usr/local/bin/cpan -T \
  Digest::SHA1 \
  IO::Socket::SSL \
  JSON \
  JSON::Parse \
  Log::Log4perl
