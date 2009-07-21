class GopherResponse
  def initialize(r)
   @response_lines = r.split(/\r\n/).map { |l| GopherResponseLine.new(l) }
  end
  
  def print
    #@response_lines.each {|line| puts line.type + " " + line.port + "\n"}
    @response_lines.each {|line| puts line.type + " " + line.label + " " + line.path + " " + line.host + " " + line.port }
  end
end

class GopherResponseLine
  attr_reader :text, :type, :port, :host, :path, :label
  def initialize(line)
    @text = line
    match = line.match(/(\w)(.+?)\t(.+?)\t(\S+)\t(\d+)\t*\+{0,1}$/)
    if match
      @type = match[1]
      @label = match[2]
      @path = match[3]
      @host = match[4]
      @port = match[5]
    else
      @type = ''
      @label = ''
      @path = ''
      @host = ''
      @port = ''
    end
  end
end