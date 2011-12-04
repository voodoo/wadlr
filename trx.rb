#!/usr/bin ruby

#require 'yaml'
require 'active_support/core_ext'

class YamlToXml
  def self.yaml_to_xml file_to_read, file_to_write
    doc = String.new
    File.open( file_to_read ) { |yf| doc << YAML.parse( yf ).transform.to_xml }
    File.open( file_to_write, 'w' ) { |f| f.write( doc ) } 
  end

  def self.xml_to_yaml file_to_read, file_to_write 
    doc = Hash.new 
    File.open( file_to_read ) { |xf| doc = Hash.from_xml( xf ) } 
    File.open( file_to_write, 'w' ) { |f| f.write( doc.to_yaml ) } 
  end
end

#YamlToXml.xml_to_yaml('xml/yahoo.wadl.xml', 'yml/yahoo.wadl.yml')
YamlToXml.yaml_to_xml('yml/yahoo.wadl.yml', 'xml/yahoo_trxd.wadl.xml')
