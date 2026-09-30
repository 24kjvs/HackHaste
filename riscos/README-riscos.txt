HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

RISC OS 5 (Pi, Titanium, RPC) loads keyboard handlers from the
InternationalKeyboard module. User-loadable maps without a ROM rebuild
go through MoreKeys (heyrick.eu):

  Copy mappings/UK/HackHaste to Choices:MoreKeys.mappings.UK.HackHaste
  *Country UK
  *Alphabet Latin1

columns in the mapping file are Set-1 scancode, unshift, shift, ctrl, alt
as hex bytes. Physical I (17) is 63 'c' on main.

To bake it into the ROM module, copy IntKey/haha into the IntKey layout
directory and rebuild InternationalKeyboard, then *RMReInit.

Caps Lock is a RISC OS lock, not a character. This map does not turn Caps
into Ctrl. *Configure CapsAction / Keyboard (where present) is the
modifier path.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
