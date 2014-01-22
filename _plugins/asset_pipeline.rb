require 'japr'

module JAPR
    class CoffeeScriptConverter < JAPR::Converter
      require 'coffee-script'

      def self.filetype
        '.coffee'
      end

      def convert
        return CoffeeScript.compile(@content)
      end
    end
end

module JAPR
  class SassConverter < JAPR::Converter
    require 'sass'

    def self.filetype
      '.scss'
    end

    def convert
      return Sass::Engine.new(@content, syntax: :scss).render
    end
  end
end