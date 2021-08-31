require 'thor'

##################################################
#  A comment
##################################################
class Rgr < Thor
  class_option :verbose, type: :boolean
  include Thor::Actions
  option :name, required: true, type: :string
  option :lang, required: true, type: :string
  option :test_framework, required: true, type: :string
  option :editor, type: :string

  desc 'NEW', 'create a new RGR'
  def new
    build!
  end

  no_commands do
    def build!
      destination_root=options[:name]
      directory 'spec', 'spec', :recursive => false
      create_test_file
      empty_directory 'lib'
      create_lib_file
      copy_file('Gemfile',"#{options[:name]}/Gemfile")
      copy_file('.rspec',"#{options[:name]}/.rspec")
      copy_file("Guardfile","#{options[:name]}/Guardfile")

    end

    def source_paths
      ["#{File.dirname(__FILE__).split('/')[0..-2].join('/')}/templates/ruby/templates","./templates/ruby/templates"]
    end
    

    def self.source_root
      File.dirname(__FILE__)
    end

    def self.template_root
      "#{source_root}/#{options[:name]}"
    end


    def create_lib_file
      name = options[:name]
      template('class.tt', "#{name}/lib/#{name}.rb")
    end

    def create_test_file
      name = options[:name]
      test = options[:test_framework] == 'rspec' ? :spec : :test
      file = "#{name}/#{test}/#{name}_#{test}.rb"
      if test == :spec
        template('class_spec.tt', file)
      else
        template('class_test.tt', file)
      end
    end

    def self.exit_on_failure?
      true
    end
  end
end
