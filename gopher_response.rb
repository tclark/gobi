class GopherResponse
  def initialize(r)
    @full_response = r.split(/\r\n/)
  end
  
  def print
    @full_response.each {|line| puts line.chop + "\n"}
  end
end