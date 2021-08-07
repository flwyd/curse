#!/bin/sh
"exec" /usr/bin/env vim -c 'Curse '$1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, "
"     English teacher at Center Grove High School in Greenwood, Indiana.     "
" Public domain implementations by Trevor Stone http://trevorstone.org/curse "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: rand() was added in Vim 8.1.2342; this script falls back to
" https://github.com/fleischie/vim-rando

" Lists of words
let s:adjective1 = ['artless', 'bawdy', 'beslubbering', 'bootless', 'brazen',
  \ 'churlish', 'cockered', 'clouted', 'craven', 'currish', 'dankish',
  \ 'dissembling', 'distempered', 'droning', 'errant', 'fawning', 'fitful',
  \ 'fobbing', 'froward', 'frothy', 'gleeking', 'gnarling', 'goatish',
  \ 'gorbellied', 'greasy', 'grizzled', 'haughty', 'hideous', 'impertinent',
  \ 'infectious', 'jaded', 'jarring', 'knavish', 'lewd', 'loggerheaded',
  \ 'lumpish', 'mammering', 'mangled', 'mewling', 'paunchy', 'peevish',
  \ 'pernicious', 'prating', 'pribbling', 'puking', 'puny', 'purpled',
  \ 'quailing', 'queasy', 'rank', 'reeky', 'roguish', 'roynish', 'ruttish',
  \ 'saucy', 'sottish', 'spleeny', 'spongy', 'surly', 'tottering',
  \ 'unmuzzled', 'vacant', 'vain', 'venomed', 'villainous', 'waggish',
  \ 'wanton', 'warped', 'wayward', 'weedy', 'wenching', 'whoreson', 'yeasty']

let s:adjective2 = ['base-court', 'bat-fowling', 'beef-witted',
  \ 'beetle-headed', 'boil-brained', 'bunched-backed', 'clapper-clawed',
  \ 'clay-brained', 'common-kissing', 'crook-pated', 'dismal-dreaming',
  \ 'dizzy-eyed', 'dog-hearted', 'dread-bolted', 'earth-vexing',
  \ 'elf-skinned', 'empty-hearted', 'evil-eyed', 'eye-offending',
  \ 'fat-kidneyed', 'fen-sucked', 'flap-mouthed', 'fly-bitten',
  \ 'folly-fallen', 'fool-born', 'full-gorged', 'guts-griping', 'half-faced',
  \ 'hasty-witted', 'heavy-handed', 'hedge-born', 'hell-hated', 'horn-mad',
  \ 'idle-headed', 'ill-breeding', 'ill-composed', 'ill-nurtured',
  \ 'iron-witted', 'knotty-pated', 'lean-witted', 'lily-livered', 'mad-bread',
  \ 'milk-livered', 'motley-minded', 'muddy-mettled', 'onion-eyed',
  \ 'pale-hearted', 'paper-faced', 'pinch-spotted', 'plume-plucked',
  \ 'pottle-deep', 'pox-marked', 'raw-boned', 'reeling-ripe', 'rough-hewn',
  \ 'rude-growing', 'rug-headed', 'rump-fed', 'shag-eared', 'shard-borne',
  \ 'sheep-biting', 'shrill-gorged', 'spur-galled', 'sour-faced',
  \ 'swag-bellied', 'tardy-gaited', 'tickle-brained',  'toad-spotted',
  \ 'unchin-snouted', 'weak-hinged', 'weather-bitten', 'white-livered']

let s:noun = ['apple-john', 'baggage', 'barnacle', 'bladder', 'boar-pig',
  \ 'bugbear', 'bum-bailey', 'canker-blossom', 'clack-dish', 'clotpole',
  \ 'coxcomb', 'codpiece', 'crutch', 'cutpurse', 'death-token', 'dewberry',
  \ 'dogfish', 'egg-shell', 'flap-dragon', 'flax-wench', 'flirt-gill',
  \ 'foot-licker', 'fustilarian', 'giglet', 'gudgeon', 'gull-catcher',
  \ 'haggard', 'harpy', 'hedge-pig', 'hempseed', 'horn-beast', 'hugger-mugger',
  \ 'jack-a-nape', 'jolthead', 'lewdster', 'lout', 'maggot-pie', 'malignancy',
  \ 'malkin', 'malt-worm', 'mammet', 'manikin', 'measle', 'minimus', 'minnow',
  \ 'miscreant', 'moldwarp', 'mumble-news', 'rabbit-sucker', 'rampallion',
  \ 'ratsbane', 'remnant', 'rudesby', 'ruffian', 'scantling', 'scullion',
  \ 'scut', 'skainsmate', 'snipe', 'strumpet', 'varlot', 'vassal', 'waterfly',
  \ 'whey-face', 'whipster', 'wagtail', 'younker' ]

" Returns a random word from a list
function s:randWord(words)
  if exists('*rand')
    let l:index = rand() % len(a:words)
  else
    let l:index = float2nr(GetRandomNumber() * len(a:words))
  endif
  return a:words[l:index]
endfunction

" Returns one curse as a string
function s:oneCurse()
  return 'Thou ' . s:randWord(s:adjective1) .
    \ ' ' . s:randWord(s:adjective2) .
    \ ' ' .s:randWord(s:noun) . '!'
endfunction

" Curse() returns a single curse as a string
" Curse(n) returns a list of n curses
" In insert mode, CTRL-R=Curse() will insert a curse with no newline
" In insert mode, CTRL-R=Curse(5) will insert 5 curses on five lines
function Curse(...)
  if a:0 == 0
    return s:oneCurse()
  endif
  let l:curses = []
  let l:i = 0
  while l:i < a:1
    let l:curses += [s:oneCurse()]
    let l:i += 1
  endwhile
  return l:curses
endfunction

" Generate a number of curses and print them.  Prompts for a number if no
" arguments are given.
function s:putCurses(...)
  if a:0 == 0
    let l:numCurses = input('Number of curses: ')
    " Insert newline after user input
    echon "\n"
  else
    let l:numCurses = a:1
  endif
  put! =Curse(l:numCurses)
endfunction

" :Curse [n] will print n curses, prompting if n is not specified
command -nargs=? Curse call s:putCurses(<args>)
