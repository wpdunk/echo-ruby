class Echo
  def self.prompt
    puts "Say something:"
  end
  def self.receive
    input = gets.chomp
    return input
  end
  def self.time
   timestamp = Time.now
   return "#{timestamp.strftime("%Y-%m-%d | %H:%M")}"
  end
  def self.run
    input = String.new
    while input != "exit"
      Echo.prompt
      input = Echo.receive
      if input != "exit"
        response = "#{Echo.time} | You said: '#{input}'"
        puts response
      end
    end
    puts "Goodbye!"
  end
end

Echo.run if __FILE__ == $PROGRAM_NAME

# class Echo
#   def self.prompt
#
#   end
#   def self.reply
#
#   end

# >>>

#   def self.run
#
#   end
# end
