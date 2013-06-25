#
# This is an example of how to use the button class
# You must register helpers and have the main thread
# sleep or in someway keep running or your program
# will exit before any callbacks can be called
#
require 'bundler/setup'
require 'dino'

board = Dino::Board.new(Dino::TxRx::Serial.new)
button = Dino::Components::Button.new(pin: 12, board: board)
led = Dino::Components::Led.new(pin: 13, board: board)

led_status = :on

button.down do
  puts 'down'
  if led_status == :on
    led_status = :off
  else
    led_status = :on
  end
  led.send(led_status)
  # sleep 1
  # led.send(:off)
end

button.up do
  puts 'up'
end

# led.send(:off)
# puts 'waiting'
sleep
