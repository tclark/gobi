require 'socket'
require 'gopher_response'

class GopherServer
  def initialize(*args)
    @host = args[0]
    if args.size == 2
      @port = args[1]
    else
      @port = 70
    end
  end
  
  def request(r)
    request_string = r.chop + "\r\n"
    sock = TCPSocket.open(@host, @port)
    sock.print(request_string)
    resp = GopherResponse.new(sock.read)
    sock.close
    return resp
  end
end
