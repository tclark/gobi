#!/usr/local/bin/ruby

require 'gopher_server'
hostname = 'gopher.quux.org'
port = 70

server = GopherServer.new(hostname, port)
resp = server.request("")
resp.print
