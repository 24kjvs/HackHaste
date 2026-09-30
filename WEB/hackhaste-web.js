/* HackHaste public site: live board + physical-QWERTY try-it.
   Glyphs follow the published map by hand. If the map changes, edit
   LAYOUTS here. The package generator never writes WEB/. */

(function () {
  "use strict";

  const CODE_TO_XKB = {
    Backquote: "TLDE",
    Digit1: "AE01", Digit2: "AE02", Digit3: "AE03", Digit4: "AE04",
    Digit5: "AE05", Digit6: "AE06", Digit7: "AE07", Digit8: "AE08",
    Digit9: "AE09", Digit0: "AE10", Minus: "AE11", Equal: "AE12",
    KeyQ: "AD01", KeyW: "AD02", KeyE: "AD03", KeyR: "AD04",
    KeyT: "AD05", KeyY: "AD06", KeyU: "AD07", KeyI: "AD08",
    KeyO: "AD09", KeyP: "AD10", BracketLeft: "AD11", BracketRight: "AD12",
    Backslash: "BKSL",
    KeyA: "AC01", KeyS: "AC02", KeyD: "AC03", KeyF: "AC04",
    KeyG: "AC05", KeyH: "AC06", KeyJ: "AC07", KeyK: "AC08",
    KeyL: "AC09", Semicolon: "AC10", Quote: "AC11",
    IntlBackslash: "LSGT",
    KeyZ: "AB01", KeyX: "AB02", KeyC: "AB03", KeyV: "AB04",
    KeyB: "AB05", KeyN: "AB06", KeyM: "AB07", Comma: "AB08",
    Period: "AB09", Slash: "AB10",
    Space: "SPCE"
  };

  const LAYOUTS = {
    haha: {
      TLDE: ["`", "~"], AE01: ["1", "!"], AE02: ["2", "@"], AE03: ["3", "#"],
      AE04: ["4", "$"], AE05: ["5", "%"], AE06: ["6", "^"],
      AE07: ["[", "{"], AE08: ["]", "}"], AE09: ["v", "V"], AE10: ["x", "X"],
      AE11: ["z", "Z"], AE12: ["q", "Q"],
      AD01: ["7", "&"], AD02: ["8", "*"], AD03: ["9", "("], AD04: ["0", ")"],
      AD05: ["-", "_"], AD06: ["k", "K"], AD07: ["l", "L"], AD08: ["c", "C"],
      AD09: ["g", "G"], AD10: ["y", "Y"], AD11: ["w", "W"], AD12: [";", ":"],
      BKSL: ["\\", "|"],
      AC01: ["u", "U"], AC02: ["i", "I"], AC03: ["a", "A"], AC04: ["e", "E"],
      AC05: ["o", "O"], AC06: ["h", "H"], AC07: ["r", "R"], AC08: ["s", "S"],
      AC09: ["t", "T"], AC10: ["n", "N"], AC11: ["p", "P"],
      AB01: ["'", '"'], AB02: [",", "<"], AB03: [".", ">"], AB04: ["/", "?"],
      AB05: ["=", "+"], AB06: ["j", "J"], AB07: ["m", "M"], AB08: ["d", "D"],
      AB09: ["b", "B"], AB10: ["f", "F"],
      LSGT: ["-", "_"], SPCE: [" ", " "]
    },
    "haha-left": {
      TLDE: ["`", "~"], AE01: ["x", "X"], AE02: ["v", "V"], AE03: ["z", "Z"],
      AE04: ["q", "Q"], AE05: ["w", "W"], AE06: [";", ":"],
      AE07: ["1", "!"], AE08: ["2", "@"], AE09: ["3", "#"], AE10: ["4", "$"],
      AE11: ["5", "%"], AE12: ["6", "^"],
      AD01: ["p", "P"], AD02: ["g", "G"], AD03: ["c", "C"], AD04: ["l", "L"],
      AD05: ["k", "K"], AD06: ["-", "_"], AD07: ["7", "&"], AD08: ["8", "*"],
      AD09: ["9", "("], AD10: ["0", ")"], AD11: ["[", "{"], AD12: ["]", "}"],
      BKSL: ["\\", "|"],
      AC01: ["n", "N"], AC02: ["t", "T"], AC03: ["s", "S"], AC04: ["r", "R"],
      AC05: ["h", "H"], AC06: ["o", "O"], AC07: ["e", "E"], AC08: ["a", "A"],
      AC09: ["i", "I"], AC10: ["u", "U"], AC11: ["y", "Y"],
      AB01: ["f", "F"], AB02: ["b", "B"], AB03: ["d", "D"], AB04: ["m", "M"],
      AB05: ["j", "J"], AB06: ["=", "+"], AB07: ["'", '"'], AB08: [",", "<"],
      AB09: [".", ">"], AB10: ["/", "?"],
      LSGT: ["-", "_"], SPCE: [" ", " "]
    }
  };

  const FINGER = {
    haha: {
      TLDE: "lpink", AE01: "lpink", AE02: "lring", AE03: "lmid",
      AE04: "lidx", AE05: "lidx", AE06: "ridx",
      AE07: "ridx", AE08: "rmid", AE09: "rpink", AE10: "rpink",
      AE11: "rpink", AE12: "rpink",
      AD01: "lpink", AD02: "lring", AD03: "lmid", AD04: "lidx",
      AD05: "lidx", AD06: "ridx", AD07: "ridx", AD08: "rmid",
      AD09: "rring", AD10: "rpink", AD11: "rpink", AD12: "rpink",
      BKSL: "rpink",
      AC01: "lpink", AC02: "lring", AC03: "lmid", AC04: "lidx",
      AC05: "lidx", AC06: "ridx", AC07: "ridx", AC08: "rmid",
      AC09: "rring", AC10: "rpink", AC11: "rpink",
      AB01: "lpink", AB02: "lring", AB03: "lmid", AB04: "lidx",
      AB05: "lidx", AB06: "ridx", AB07: "ridx", AB08: "rmid",
      AB09: "rring", AB10: "rpink",
      SPCE: "thumbs"
    },
    "haha-left": {
      TLDE: "lpink", AE01: "lpink", AE02: "lring", AE03: "lmid",
      AE04: "lidx", AE05: "lidx", AE06: "ridx",
      AE07: "ridx", AE08: "rmid", AE09: "rring", AE10: "rpink",
      AE11: "rpink", AE12: "rpink",
      AD01: "lpink", AD02: "lring", AD03: "lmid", AD04: "lidx",
      AD05: "lidx", AD06: "ridx", AD07: "ridx", AD08: "rmid",
      AD09: "rring", AD10: "rpink", AD11: "rpink", AD12: "rpink",
      BKSL: "rpink",
      AC01: "lpink", AC02: "lring", AC03: "lmid", AC04: "lidx",
      AC05: "lidx", AC06: "ridx", AC07: "ridx", AC08: "rmid",
      AC09: "rring", AC10: "rpink", AC11: "rpink",
      AB01: "lpink", AB02: "lring", AB03: "lmid", AB04: "lidx",
      AB05: "lidx", AB06: "ridx", AB07: "ridx", AB08: "rmid",
      AB09: "rring", AB10: "rpink",
      SPCE: "thumbs"
    }
  };

  const PHRASE = {
    haha: {
      lpink: "SEVEN-Up to quote the ONE!",
      lring: "I EIGHT @ TWO COMMAS.",
      lmid: "A THIRD period of the NINTH degree.",
      lidx: "So divide the Egg to subtract the gO0se and equate it with dirt.",
      ridx: "Realise oLd \"HoMe\" was Just a Kite.",
      rmid: "Stay Calm, Dude.",
      rring: "VeGeTaBle.",
      rpink: "No Problem, You're Welcome, Friend. Xeno Zenith Questions.",
      thumbs: "Space is both thumbs. It already had a job."
    },
    "haha-left": {
      lpink: "No Problem, Friend.",
      lring: "VeGeTaBle.",
      lmid: "Stay Calm, Dude.",
      lidx: "Realise oLd \"HoMe\" was Just a Kite.",
      ridx: "So divide the Egg to subtract the gO0se and equate it with dirt.",
      rmid: "ANTHONY EIGHT @ TWO COMMAS.",
      rring: "I am the THIRD period of the NINTH degree.",
      rpink: "YOU, 10 brackets, slash?",
      thumbs: "Space is both thumbs. It already had a job."
    }
  };

  const HOME = {
    haha: { AC01: 1, AC02: 1, AC03: 1, AC04: 1, AC05: 1, AC06: 1, AC07: 1, AC08: 1, AC09: 1, AC10: 1, AC11: 1 },
    "haha-left": { AC01: 1, AC02: 1, AC03: 1, AC04: 1, AC05: 1, AC06: 1, AC07: 1, AC08: 1, AC09: 1, AC10: 1, AC11: 1 }
  };

  const CHOIR = {
    haha: { AC01: 1, AC02: 1, AC03: 1, AC04: 1, AC05: 1 },
    "haha-left": { AC06: 1, AC07: 1, AC08: 1, AC09: 1, AC10: 1, AC11: 1 }
  };

  const ENGINE = {
    haha: { AC06: 1, AC07: 1, AC08: 1, AC09: 1, AC10: 1, AC11: 1 },
    "haha-left": { AC01: 1, AC02: 1, AC03: 1, AC04: 1, AC05: 1 }
  };

  const ROWS = [
    [
      { id: "TLDE", span: 1 }, { id: "AE01", span: 1 }, { id: "AE02", span: 1 },
      { id: "AE03", span: 1 }, { id: "AE04", span: 1 }, { id: "AE05", span: 1 },
      { id: "AE06", span: 1 }, { id: "AE07", span: 1 }, { id: "AE08", span: 1 },
      { id: "AE09", span: 1 }, { id: "AE10", span: 1 }, { id: "AE11", span: 1 },
      { id: "AE12", span: 1 }, { id: "BKSP", span: 2, label: "Backspace", mod: true }
    ],
    [
      { id: "TAB", span: 1.5, label: "Tab", mod: true },
      { id: "AD01", span: 1 }, { id: "AD02", span: 1 }, { id: "AD03", span: 1 },
      { id: "AD04", span: 1 }, { id: "AD05", span: 1 }, { id: "AD06", span: 1 },
      { id: "AD07", span: 1 }, { id: "AD08", span: 1 }, { id: "AD09", span: 1 },
      { id: "AD10", span: 1 }, { id: "AD11", span: 1 }, { id: "AD12", span: 1 },
      { id: "BKSL", span: 1.5 }
    ],
    [
      { id: "CAPS", span: 1.75, label: "Ctrl", mod: true },
      { id: "AC01", span: 1 }, { id: "AC02", span: 1 }, { id: "AC03", span: 1 },
      { id: "AC04", span: 1 }, { id: "AC05", span: 1 }, { id: "AC06", span: 1 },
      { id: "AC07", span: 1 }, { id: "AC08", span: 1 }, { id: "AC09", span: 1 },
      { id: "AC10", span: 1 }, { id: "AC11", span: 1 },
      { id: "ENTER", span: 2.25, label: "Enter", mod: true }
    ],
    [
      { id: "LSH", span: 2.25, label: "Shift", mod: true },
      { id: "AB01", span: 1 }, { id: "AB02", span: 1 }, { id: "AB03", span: 1 },
      { id: "AB04", span: 1 }, { id: "AB05", span: 1 }, { id: "AB06", span: 1 },
      { id: "AB07", span: 1 }, { id: "AB08", span: 1 }, { id: "AB09", span: 1 },
      { id: "AB10", span: 1 },
      { id: "RSH", span: 2.75, label: "Shift", mod: true }
    ],
    [
      { id: "LCTL", span: 1.25, label: "Caps", mod: true },
      { id: "LALT", span: 1.25, label: "Alt", mod: true },
      { id: "SPCE", span: 7.25, label: "Space", mod: true },
      { id: "RALT", span: 1.25, label: "AltGr", mod: true },
      { id: "RCTL", span: 1.25, label: "Ctrl", mod: true }
    ]
  ];

  let variant = "haha";

  function $(sel, root) {
    return (root || document).querySelector(sel);
  }

  function $all(sel, root) {
    return Array.prototype.slice.call((root || document).querySelectorAll(sel));
  }

  function glyphPair(id) {
    const pair = LAYOUTS[variant][id];
    return pair || ["", ""];
  }

  function renderBoard() {
    const mount = $("#hh-board");
    if (!mount) return;
    mount.replaceChildren();
    ROWS.forEach(function (row) {
      const line = document.createElement("div");
      line.className = "hh-row";
      row.forEach(function (spec) {
        const btn = document.createElement("button");
        btn.type = "button";
        btn.className = "hh-key";
        btn.style.setProperty("--span", String(spec.span));
        btn.dataset.xkb = spec.id;
        if (spec.mod) btn.classList.add("hh-key-mod");
        if (HOME[variant][spec.id]) btn.classList.add("hh-key-home");
        if (CHOIR[variant][spec.id]) btn.classList.add("hh-key-choir");
        if (ENGINE[variant][spec.id]) btn.classList.add("hh-key-engine");
        const finger = FINGER[variant][spec.id];
        if (finger) btn.dataset.finger = finger;
        const pair = glyphPair(spec.id);
        if (spec.label && spec.mod) {
          btn.innerHTML = "<span>" + spec.label + "</span>";
          btn.setAttribute("aria-label", spec.label);
        } else {
          const hi = pair[1] && pair[1] !== pair[0].toUpperCase() ? pair[1] : "";
          btn.innerHTML = (hi ? "<small>" + escapeHtml(hi) + "</small>" : "<small></small>") +
            "<span>" + escapeHtml(pair[0]) + "</span>";
          btn.setAttribute("aria-label", pair[0] + (hi ? " " + hi : ""));
        }
        btn.addEventListener("click", function () {
          showPhrase(spec.id);
          light(spec.id);
        });
        line.appendChild(btn);
      });
      mount.appendChild(line);
    });
  }

  function escapeHtml(s) {
    return String(s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function showPhrase(id) {
    const el = $("#hh-phrase");
    if (!el) return;
    const finger = FINGER[variant][id];
    el.textContent = (finger && PHRASE[variant][finger]) || "";
  }

  function clearLit() {
    $all(".hh-key.hh-lit, .hh-key.hh-lit-choir, .hh-key.hh-lit-engine").forEach(function (k) {
      k.classList.remove("hh-lit", "hh-lit-choir", "hh-lit-engine");
    });
  }

  function light(id) {
    clearLit();
    const key = $('.hh-key[data-xkb="' + id + '"]');
    if (!key) return;
    key.classList.add("hh-lit");
    if (CHOIR[variant][id]) key.classList.add("hh-lit-choir");
    if (ENGINE[variant][id]) key.classList.add("hh-lit-engine");
  }

  function setVariant(next) {
    variant = next;
    $all("[data-hh-variant]").forEach(function (btn) {
      btn.setAttribute("aria-pressed", btn.getAttribute("data-hh-variant") === variant ? "true" : "false");
    });
    const img = $("#hh-specimen");
    if (img) {
      img.src = variant === "haha"
        ? "../source/visuals/hackhaste-haha.png"
        : "../source/visuals/hackhaste-haha-left.png";
      img.alt = variant === "haha" ? "HackHaste main board" : "HackHaste left board";
    }
    renderBoard();
    const hint = $("#hh-phrase");
    if (hint) {
      hint.textContent = variant === "haha"
        ? "The left hand sings. The right hand stops and starts the air."
        : "Same religion, other church. Roles swapped with the hands.";
    }
  }

  function insertMapped(area, event) {
    if (event.ctrlKey || event.metaKey || event.altKey) return false;
    if (event.key === "Backspace") return false;
    if (event.key === "Enter") {
      event.preventDefault();
      insertAtCaret(area, "\n");
      return true;
    }
    if (event.key === "Tab") {
      event.preventDefault();
      insertAtCaret(area, "\t");
      return true;
    }
    const xkb = CODE_TO_XKB[event.code];
    if (!xkb) return false;
    const pair = glyphPair(xkb);
    if (!pair[0] && pair[0] !== " ") return false;
    event.preventDefault();
    const ch = event.shiftKey ? pair[1] : pair[0];
    insertAtCaret(area, ch);
    light(xkb);
    showPhrase(xkb);
    return true;
  }

  function insertAtCaret(area, text) {
    const start = area.selectionStart;
    const end = area.selectionEnd;
    const value = area.value;
    area.value = value.slice(0, start) + text + value.slice(end);
    area.selectionStart = area.selectionEnd = start + text.length;
  }

  function applyTheme(name) {
    if (name === "auto") {
      document.documentElement.removeAttribute("data-hh-theme");
    } else {
      document.documentElement.setAttribute("data-hh-theme", name);
    }
    try { localStorage.setItem("hh-theme", name); } catch (e) { /* private mode */ }
    $all("button[data-hh-theme]").forEach(function (btn) {
      btn.setAttribute("aria-pressed", btn.getAttribute("data-hh-theme") === name ? "true" : "false");
    });
  }

  function yearStamp() {
    const el = $("#hh-year");
    if (el) el.textContent = String(new Date().getFullYear());
  }

  document.addEventListener("DOMContentLoaded", function () {
    yearStamp();
    let theme = "night";
    try { theme = localStorage.getItem("hh-theme") || "night"; } catch (e) { theme = "night"; }
    applyTheme(theme);

    $all("button[data-hh-theme]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        applyTheme(btn.getAttribute("data-hh-theme"));
      });
    });

    $all("[data-hh-variant]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        setVariant(btn.getAttribute("data-hh-variant"));
      });
    });

    setVariant("haha");

    const area = $("#hh-try");
    if (area) {
      area.addEventListener("keydown", function (event) {
        insertMapped(area, event);
      });
      area.addEventListener("keyup", function (event) {
        if (event.key === "Backspace" || event.key === "Escape") clearLit();
      });
    }
  });
})();
