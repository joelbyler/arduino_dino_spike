require './lib/morse_led_board'

board = MorseLEDBoard.new(13)

begin
  #TODO board.send('SOS')
  board.morse_s
  board.morse_o
  board.morse_s
  board.morse_end
end while true
