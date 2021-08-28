require 'thor'

class Rgr < Thor 
  desc 'Run the program'
  option :lang, :required => true, :type: :string
  def run
    puts 'Run the thor program'
  end
  desc 'Print the help'
  def help
    'Help will go here'
  end

  private

  def read_defaults
    puts 'Read the defaults file respect XDG '
  end
end
