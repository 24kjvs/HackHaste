# Learning HackHaste

*Expedited Typing Across* **OS***es* *Integrated Natively Salvaging Home Rows*

Fingers first: [MNEMONICS.md](MNEMONICS.md) (main) and [MNEMONICS-LEFT.md](MNEMONICS-LEFT.md) (left). Doctrine: [README.md](../README.md). Install the layout itself from [HackHaste-MANUAL.md](../HackHaste-MANUAL.md) *before* a tutor, or the tutor will drill QWERTY positions and call them HackHaste letters.

The tutors do not replace the phrases. They ask for letters. You supply the sentence that teaches the fingers their jobs.

Copy the file named for your program into that program’s lesson or layout directory. Names are unique on purpose: `gtypist-hackhaste.typ` will not collide with `gtypist-hackhaste-left.typ`, nor with a Colemak course already installed.


| Program                | Licence (typical) | Files                                                                                                                                | What to do                                                                                            |
| ---------------------- | ----------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------- |
| GNU Typist (`gtypist`) | GPL               | `gtypist-hackhaste.typ`, `gtypist-hackhaste-left.typ`                                                                                | `gtypist gtypist-hackhaste.typ`                                                                       |
| KDE KTouch             | GPL               | `ktouch-hackhaste.keyboard.xml`, `ktouch-hackhaste.course.xml` (and `-left`)                                                         | KTouch → Course and Keyboard Layout Editor → Import both                                              |
| Klavaro                | GPL               | `klavaro-hackhaste_us.kbd`, `klavaro-hackhaste-left_us.kbd`, `klavaro-hackhaste.words`, `klavaro-hackhaste.paragraphs` (and `-left`) | Copy `.kbd` / `.words` / `.paragraphs` into `~/.local/share/klavaro/` (Windows: `%APPDATA%\klavaro\`) |
| TIPP10                 | GPL               | `tipp10-hackhaste.txt`, `tipp10-hackhaste-left.txt`                                                                                  | Lesson → Import; UTF-8, Unix newlines                                                                 |
| Tux Typing (`tuxtype`) | GPL               | `tuxtype-hackhaste.txt`, `tuxtype-hackhaste-left.txt`                                                                                | Copy into TuxType’s `words/` as a word list                                                           |
| TypeSpeed              | GPL               | `typespeed-hackhaste`, `typespeed-hackhaste-left`                                                                                    | Word list; one word per line                                                                          |
| Amphetype              | GPL               | `amphetype-hackhaste.txt`, `amphetype-hackhaste-left.txt`                                                                            | Add as a text source                                                                                  |
| Monkeytype             | GPL               | `monkeytype-hackhaste.json`, `monkeytype-hackhaste-left.json`, `monkeytype-english-hackhaste.json`                                   | Layout JSON under `frontend/static/layouts/`; word list as a language JSON                            |
| keybr.com              | AGPL              | `keybr-hackhaste.json`, `keybr-hackhaste-left.json`                                                                                  | Custom layout: KeyboardEvent `code` → up to four characters                                           |
| keyzen                 | MIT               | `keyzen-hackhaste.js`                                                                                                                | Replace or concat the `words` array                                                                   |
| OpenTyping             | GPL               | `opentyping-hackhaste.json`, `opentyping-hackhaste-left.json`                                                                        | Import as a course                                                                                    |
| Qwerty Learner         | MIT               | `qwerty-learner-hackhaste.json`                                                                                                      | Custom dictionary                                                                                     |
| Emacs `speed-type`     | GPL               | `emacs-speed-type-hackhaste.txt`                                                                                                     | `speed-type-text` on the buffer                                                                       |
| ttyper / toipe / wpm   | MIT/Apache        | `ttyper-hackhaste.txt`                                                                                                               | `--wordlist` or stdin                                                                                 |
| smassh                 | GPL               | `smassh-hackhaste.json`                                                                                                              | Monkeytype-shaped language JSON                                                                       |
| Stamina                | freeware          | `stamina-hackhaste.txt`                                                                                                              | External dictation / word list                                                                        |
| TypeFaster             | GPL               | `typefaster-hackhaste.kbl`                                                                                                           | Import keyboard layout                                                                                |
| RapidTyping            | free              | `rapidtyping-hackhaste.xml`                                                                                                          | Custom lesson XML                                                                                     |


Klavaro’s built-in 43 basic lessons are *positional*: they teach whatever layout file is loaded. Install `klavaro-hackhaste_us.kbd`, then take the basic course. The `.words` / `.paragraphs` files are for the adaptability / fluidity courses.

KTouch will only offer a course when its `keyboardLayout` name matches an imported layout’s `<name>`. Import the keyboard XML first (`haha` or `haha-left`), then the course.

Monkeytype’s on-site layout picker cannot load a random JSON; the layout files are for a local/self-hosted Monkeytype or a fork. The word list can be pasted into custom mode today.

keybr’s JSON uses physical `KeyQ`, `Digit1`, … codes. No click-to-install options.

If a program is missing, use `tuxtype-hackhaste.txt` or `amphetype-hackhaste.txt`: almost every remaining tutor will take a UTF-8 word list or a paragraph.