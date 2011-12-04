class Wadlr
  def initialize hadl
    @wadl = Builder::XmlMarkup.new(:target => STDOUT, :indent => 2)
    @hadl = hadl
    generate
  end
  def generate
    @wadl.application(:xmlns => "http://wadl.dev.java.net/2009/02") do |app|
      app.resources do |resources|
        resources.resource(:path => @hadl['method'].path) do |resource|
          resource.method(:name => @hadl['method'].name, :id => @hadl['method']['id']) do |method|
            method.request do |request|
              for param in @hadl['method'].request.params
                name =  param.keys.first
                rname = name.sub(/_required$/,'') # support required shortcut, if _required is of name
                request.param(:name => rname, :type => "xsd:#{param.values.first}", :required => name != rname)
              end
            end        
          end
        end
      end
    end    
  end
end