require 'bundler/setup'
Bundler.setup

require 'padron' # and any other gems you need

Padron.pkey 		= "spec/fixtures/test.key"
Padron.cert 		= "spec/fixtures/test.crt"
Padron.environment 	= :test
Padron.cuit 		= "20368642682"
Padron.openssl_bin = "/usr/bin/openssl"
