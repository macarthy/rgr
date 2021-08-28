require 'thor'

##################################################
#  A comment
##################################################
class Rgr < Thor
  class_option :verbose, :type => :boolean
  include Thor::Actions
  option :kata, required: true, type: :string
  desc 'hello NAME', 'say hello to NAME'
  def doit
    puts "Run the thor program with #{options[:kata]} "
  end

  private

  def default_options
    {
      editor: 'nvim',
      lang: 'ruby',
      test_framework: 'rspec',
      dir: name
    }
  end

  def read_defaults
    puts 'Read the defaults file respect XDG '
  end
end

Rgr.start(ARGV)
