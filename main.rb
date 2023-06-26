require_relative 'app'
require_relative 'display'
require_relative 'option'
require_relative 'input'

class Main
  include Display
  include Option

  def initialize
    @app = App.new
  end

  def main
    app = App.new
    loop do
      display_menu
      option = Input.new.input_int
      break if option == 7

      choose_option(option, app)
    end
  end
end

main = Main.new
main.main
