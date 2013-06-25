require 'bundler/setup'
require 'dino'

class MorseLEDBoard
  attr_accessor :led
  def initialize (pin)
    board = Dino::Board.new(Dino::TxRx::Serial.new)
    @led = Dino::Components::Led.new(pin: pin, board: board)
  end

  def short
    @led.send(:on)
    sleep 0.4
    @led.send(:off)
    sleep 0.1
  end

  def long
    @led.send(:on)
    sleep 0.9
    @led.send(:off)
    sleep 0.1
  end

  def morse_end
    sleep 1.5
  end

  def morse_s
    3.times do
      short
    end
  end

  def morse_o
    3.times do
      long
    end
  end

end
