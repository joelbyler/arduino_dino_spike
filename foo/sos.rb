require 'bundler/setup'
require 'dino'

board = Dino::Board.new(Dino::TxRx::Serial.new)
led = Dino::Components::Led.new(pin: 13, board: board)


def short(led)
  led.send(:on)
  sleep 0.4
  led.send(:off)
  sleep 0.1
end

def long(led)
  led.send(:on)
  sleep 0.9
  led.send(:off)
  sleep 0.1
end

def morse_end
  sleep 1.5
end

def morse_s(led)
  3.times do
    short(led)
  end
end

def morse_o(led)
  3.times do
    long(led)
  end
end

begin
  morse_s(led)
  morse_o(led)
  morse_s(led)
  morse_end
end while true
