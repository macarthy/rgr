require 'thor'

##################################################
#  A comment
##################################################
class Rgr < Thor
  class_option :verbose, :type => :boolean
  include Thor::Actions
  option :kata, required: true, type: :string
  option :lang, required: true, type: :string
  option :test_framework, required: true, type: :string
  option :editor, type: :string
  
  desc 'hello NAME', 'say hello to NAME'
  def new
    build!
  end



  def build!
   
    directory name
    destination_root=name  
    directory "spec"
    create_test_file
    empty_directory "lib"
    create_lib_file
    copy_file('Gemfile')
    copy_file('.rspec')
    copy_file('Guardfile')

  end 

  def self.source_root
    File.dirname(__FILE__)
  end

  def self.template_root
    "#{source_root}/#{options[:name]}"
  end 
 

  def name 
    options[:name].downcase
  end 

  def create_lib_file
    template('templates/class.tt', "#{name}/lib/#{name}.rb")
  end

  def create_test_file
    test = options[:test_framework] == "rspec" ? :spec : :test
    file = "#{name}/#{test}/#{name}_#{test}.rb"
    if test == :spec
      template('templates/class_spec.tt', file)
    else
      template('templates/class_test.tt', file)
    end
  end








end

Rgr.start(ARGV)
