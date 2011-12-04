class Hash
  def method_missing(n)
    self[n.to_s]
  end
end