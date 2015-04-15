require 'mericope'
require 'cli/base'

class Mericope
  class CLI
    attr_reader :options, :input

    ALLOWED_COMMANDS = %w{help normalize parse substitute reverse-substitute usage}

    def self.run(command, *args)
      if ALLOWED_COMMANDS.member?(command)
        command = command.gsub(/-/, '_').to_sym
        CLI.new(*args).send(command)
      else
        CLI.new(*args).usage
      end
    end

    def help
      print <<-HELP

Glossary

  pericope        A Bible reference (e.g. Romans 3:6-11)
  mericope        A Mormon Pericope
  verse ID        An integer that uniquely identifies a Bible verse      

      HELP
    end

    def normalize
      begin
        mericope = Mericope.new(input)
        print mericope.to_s
      rescue
        print $!.to_s
      end
    end

    def parse
      begin
        mericope = Mericope.new(input)
        print mericope.to_a.join("\n")
      rescue
        print $!.to_s
      end
    end

    def substitute
      begin
        print Mericope.sub(input)
      rescue
        print $!.to_s
      end
    end

    def reverse_substitute
      begin
        print Mericope.rsub(input)
      rescue
        print $!.to_s
      end
    end

    def usage
      print <<-USAGE

Usage

  mericope [Command] [Input]

Commands

  help                Prints more information about mericope
  normalize           Accepts a mericope and returns a properly-formatted mericope
  parse               Accepts a mericope and returns a list of verse IDs
  substitute          Accepts a block of text and replaces all mericopes in the text with verse IDs
  reverse-substitute  Accepts a block of text and replaces collections of verse IDs with mericopes
  usage               Prints this message

      USAGE
    end

  private

    def initialize(*args)
      @options = extract_options!(*args)
      @input = args.first
      @input = $stdin.read if $stdin.stat.pipe?
    end

    def extract_options!(*args)
      {} # No options accepted yet
    end
  end
end