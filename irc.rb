require "socket"

server = "irc.bitmakerlabs.com"
port = "6667"
nick = "HelloBot"
channel = "#cohort5"
greeting_prefix = "privmsg #bitmaker :"
greetings = ["Howdy!"]

irc_server = TCPSocket.open(server,port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server. puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!

until irc_server.eof? do #eof is end of file
msg = irc_server.gets.downcase
puts msg 

wasGreeted = false
greetings.each { |g| wasGreeted = true if msg.include? g }

if msg.include? greeting_prefix and wasGreeted
response = "Hey,whats up?"
irc_server.puts "PRIVMSG # {channel} :# {response}"

end
end