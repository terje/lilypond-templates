% A chord/lyric sheet template by Terje Tjervaag (http://thedailyt.com)

% http://github.com/terje/lilypond-templates
% 
% Lilypond documentation: http://lilypond.org
% Thanks to: http://www.geoffhorton.com/lilypond.html#moreverses
%
% Quick tips:
%  * Flats are written with -es and sharps with -is (e.g. ges, cis)
%  * Durations: 1 for whole note, 2 for half note, 4 for quarter note
%  * Common chord modifiers are documented here:
%    http://lilypond.org/doc/v2.12/Documentation/user/lilypond/Common-chord-modifiers
%  * Chord durations are remembered until changed
%  * Adjust the line breaks using the \break directive, but 
%    finish writing the chords before adjusting the formatting

\header {
  title = "The beautiful song"
  subtitle = "A duet for five singers"
  composer = "http://thedailyt.com"
}

% Set paper size
% a6, a5, a4, a3, legal, letter, 11x17
#(set-default-paper-size "letter")
\paper {
  #(set-paper-size "letter")
}

\new ChordNames \with {
  \override BarLine #'bar-size = #4
  \consists "Bar_engraver"
}

\chordmode {
  \transpose c c { % Change second note to transpose piece
    % Text alignment
    \override Score.RehearsalMark #'break-align-symbol = #'(key-signature)
    \override Score.RehearsalMark #'self-alignment-X = #-1
    
    % Chords
    \mark "Intro"
    c2 d:m c d:7

    \repeat volta 2 \chordmode {
      \mark \markup {
        \musicglyph #"scripts.segno"
        "To be, or not to be..."
      }
      a2:m7 d/ges g1 a2:m7 d/ges g1:7 \break
      a2:m7 d/ges g1:sus a2:m7 d/ges g1:7 \break
      \mark \markup { \musicglyph #"scripts.coda" }
    } \alternative {
      { d1:m e:m f f/g }
      { d1:m e:m f g:7 }
    }
    \bar "||" \break

    \mark "That patient merit..."
    c2:maj7 d:dim e:7 c:maj7 d1:dim c2/e f \mark "D.S. al Coda" f1/g \bar "||"
    \break

    \mark \markup { \musicglyph #"scripts.coda" }
    d1:m e:m f f/g \bar "||"
    \mark "Outro"
    d4 d/c d/b bes:7 d1:sus \bar "|."
  }

}

% Lyrics
\markup {
  \vspace #3.0 % Space between chords and lyrics
  \normalsize { % \teeny \tiny \small \normalsize \large \huge
    \fill-line {
      \column {
        "1. To be, or not to be, that is the question:"
        "Whether 'tis nobler in the mind to suffer"
        "The slings and arrows of outrageous fortune,"
        "Or to take arms against a sea of troubles"
        "And by opposing end them. To die -- to sleep,"
        "No more; and by a sleep to say we end"
        "The heart-ache and the thousand natural shocks"
        "That flesh is heir to: 'tis a consummation"
        "Devoutly to be wish'd. To die, to sleep;"
        \hspace #1.0 % Space between verses
        "2. To sleep, perchance to dream -- ay, there's the rub:"
        "For in that sleep of death what dreams may come,"
        "When we have shuffled off this mortal coil,"
        "Must give us pause -- there's the respect"
        "That makes calamity of so long life."
        "For who would bear the whips and scorns of time,"
        "Th'oppressor's wrong, the proud man's contumely,"
        "The pangs of dispriz'd love, the law's delay,"
        "The insolence of office, and the spurns"
      }
      \hspace #1.0 % Space between columns
      \column {
        "3. That patient merit of th'unworthy takes,"
        "When he himself might his quietus make"
        "With a bare bodkin? Who would fardels bear,"
        "To grunt and sweat under a weary life,"
        "But that the dread of something after death,"
        "The undiscovere'd country, from whose bourn"
        "No traveller returns, puzzles the will,"
        "And makes us rather bear those ills we have"
        "Than fly to others that we know not of?"
        \hspace #1.0 % Space between verses
        "4. Thus conscience does make cowards of us all,"
        "And thus the native hue of resolution"
        "Is sicklied o'er with the pale cast of thought,"
        "And enterprises of great pitch and moment"
        "With this regard their currents turn awry"
        "And lose the name of action."
      }
    }
  }
}

\version "2.12.3"  % necessary for upgrading to future LilyPond versions.
