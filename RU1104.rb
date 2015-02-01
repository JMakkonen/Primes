# RU1104 - Windows experimentation.
# This now pops up a window into which you can type a number and get it factored.

require 'tk'
require 'tkextlib/tile'
$LOAD_PATH << '.'
require 'P1004.rb'  # Factoring subroutines in here.

root = TkRoot.new {title "Factoring a number"}
content = Tk::Tile::Frame.new(root) {padding "3 3 12 12"}.grid( :sticky => 'nsew')
TkGrid.columnconfigure root, 0, :weight => 1; TkGrid.rowconfigure root, 0, :weight => 1

$feet = TkVariable.new; $meters = TkVariable.new
f = Tk::Tile::Entry.new(content) {width 7; textvariable $feet}.grid( :column => 2, :row => 1, :sticky => 'we' )
Tk::Tile::Label.new(content) {textvariable $meters}.grid( :column => 2, :row => 2, :columnspan => 2, :sticky => 'we');
Tk::Tile::Button.new(content) {text 'Calculate'; command {calculate}}.grid( :column => 3, :row => 3, :sticky => 'w')

Tk::Tile::Label.new(content) {text 'The Number'}.grid( :column => 1, :row => 1, :sticky => 'w')
Tk::Tile::Label.new(content) {text 'factors to'}.grid( :column => 1, :row => 2, :sticky => 'e')

TkWinfo.children(content).each {|w| TkGrid.configure w, :padx => 5, :pady => 5}
f.focus
root.bind("Return") {calculate}

def calculate
  begin
     primes = ReadPrimes()
     $meters.value = Factor($feet,primes)
  rescue
     $meters.value = ''
  end
end

Tk.mainloop