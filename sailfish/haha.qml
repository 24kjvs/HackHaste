import QtQuick 2.0
import ".."

// HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
KeyboardLayout {
    splitSupported: false
    KeyboardRow {
        CharacterKey { caption: "1"; captionShifted: "!"; symView: "!"; symView2: "!" }
        CharacterKey { caption: "2"; captionShifted: "@"; symView: "@"; symView2: "@" }
        CharacterKey { caption: "3"; captionShifted: "#"; symView: "#"; symView2: "#" }
        CharacterKey { caption: "4"; captionShifted: "$"; symView: "$"; symView2: "$" }
        CharacterKey { caption: "5"; captionShifted: "%"; symView: "%"; symView2: "%" }
        CharacterKey { caption: "6"; captionShifted: "^"; symView: "^"; symView2: "^" }
        CharacterKey { caption: "["; captionShifted: "{"; symView: "{"; symView2: "{" }
        CharacterKey { caption: "]"; captionShifted: "}"; symView: "}"; symView2: "}" }
        CharacterKey { caption: "v"; captionShifted: "V"; symView: "V"; symView2: "V" }
        CharacterKey { caption: "x"; captionShifted: "X"; symView: "X"; symView2: "X" }
        CharacterKey { caption: "z"; captionShifted: "Z"; symView: "Z"; symView2: "Z" }
        CharacterKey { caption: "q"; captionShifted: "Q"; symView: "Q"; symView2: "Q" }
    }
    KeyboardRow {
        CharacterKey { caption: "7"; captionShifted: "&"; symView: "&"; symView2: "&" }
        CharacterKey { caption: "8"; captionShifted: "*"; symView: "*"; symView2: "*" }
        CharacterKey { caption: "9"; captionShifted: "("; symView: "("; symView2: "(" }
        CharacterKey { caption: "0"; captionShifted: ")"; symView: ")"; symView2: ")" }
        CharacterKey { caption: "-"; captionShifted: "_"; symView: "_"; symView2: "_" }
        CharacterKey { caption: "k"; captionShifted: "K"; symView: "K"; symView2: "K" }
        CharacterKey { caption: "l"; captionShifted: "L"; symView: "L"; symView2: "L" }
        CharacterKey { caption: "c"; captionShifted: "C"; symView: "C"; symView2: "C" }
        CharacterKey { caption: "g"; captionShifted: "G"; symView: "G"; symView2: "G" }
        CharacterKey { caption: "y"; captionShifted: "Y"; symView: "Y"; symView2: "Y" }
        CharacterKey { caption: "w"; captionShifted: "W"; symView: "W"; symView2: "W" }
        CharacterKey { caption: ";"; captionShifted: ":"; symView: ":"; symView2: ":" }
    }
    KeyboardRow {
        CharacterKey { caption: "u"; captionShifted: "U"; symView: "U"; symView2: "U" }
        CharacterKey { caption: "i"; captionShifted: "I"; symView: "I"; symView2: "I" }
        CharacterKey { caption: "a"; captionShifted: "A"; symView: "A"; symView2: "A" }
        CharacterKey { caption: "e"; captionShifted: "E"; symView: "E"; symView2: "E" }
        CharacterKey { caption: "o"; captionShifted: "O"; symView: "O"; symView2: "O" }
        CharacterKey { caption: "h"; captionShifted: "H"; symView: "H"; symView2: "H" }
        CharacterKey { caption: "r"; captionShifted: "R"; symView: "R"; symView2: "R" }
        CharacterKey { caption: "s"; captionShifted: "S"; symView: "S"; symView2: "S" }
        CharacterKey { caption: "t"; captionShifted: "T"; symView: "T"; symView2: "T" }
        CharacterKey { caption: "n"; captionShifted: "N"; symView: "N"; symView2: "N" }
        CharacterKey { caption: "p"; captionShifted: "P"; symView: "P"; symView2: "P" }
    }
    KeyboardRow {
        ShiftKey {}
        CharacterKey { caption: "'"; captionShifted: "\"" }
        CharacterKey { caption: ","; captionShifted: "<" }
        CharacterKey { caption: "."; captionShifted: ">" }
        CharacterKey { caption: "/"; captionShifted: "?" }
        CharacterKey { caption: "="; captionShifted: "+" }
        CharacterKey { caption: "j"; captionShifted: "J" }
        CharacterKey { caption: "m"; captionShifted: "M" }
        CharacterKey { caption: "d"; captionShifted: "D" }
        CharacterKey { caption: "b"; captionShifted: "B" }
        CharacterKey { caption: "f"; captionShifted: "F" }
        BackspaceKey {}
    }
    SpacebarRow {}
}
