#!/usr/bin ruby

$:.unshift File.dirname(__FILE__) + '/lib'

%w[wadlr hash yaml builder pp].each{|r| require r}

hadl = YAML.load_file('resource.yml')

pp hadl

Wadlr.new(hadl)




