use Test::More tests => 4;

eval "#line 7 foo\nuse experimental;";
like $@, qr/^No experimental features specified at foo line 7.\n/,
  'use experimental error';
eval "#line 7 foo\nno experimental;";
like $@, qr/^No experimental features specified at foo line 7.\n/,
  'no experimental error';
eval "use experimental 'scientific';";
like $@, qr/^Feature "experimental::scientific" is not supported/,
  'use experimental "foo" error';
eval "no experimental 'scientific';";
like $@, qr/^Feature "experimental::scientific" is not supported/,
  'no experimental "foo" error';
