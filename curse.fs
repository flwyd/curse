#! /usr/bin/env gforth
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \
\ Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, \
\     English teacher at Center Grove High School in Greenwood, Indiana.     \
\ Public domain implementations by Trevor Stone http://trevorstone.org/curse \
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \

\ Initialize random seed and throw out the first random number, which always to
\ be the same.
require random.fs
utime drop seed !
1 random drop

\ Word lists and their lengths
73 constant #adjective1
create adjective1 s" artless" 2, s" bawdy" 2, s" beslubbering" 2,
  s" bootless" 2, s" brazen" 2, s" churlish" 2, s" cockered" 2, s" clouted" 2,
  s" craven" 2, s" currish" 2, s" dankish" 2, s" dissembling" 2,
  s" distempered" 2, s" droning" 2, s" errant" 2, s" fawning" 2, s" fitful" 2,
  s" fobbing" 2, s" froward" 2, s" frothy" 2, s" gleeking" 2, s" gnarling" 2,
  s" goatish" 2, s" gorbellied" 2, s" greasy" 2, s" grizzled" 2, s" haughty" 2,
  s" hideous" 2, s" impertinent" 2, s" infectious" 2, s" jaded" 2,
  s" jarring" 2, s" knavish" 2, s" lewd" 2, s" loggerheaded" 2, s" lumpish" 2,
  s" mammering" 2, s" mangled" 2, s" mewling" 2, s" paunchy" 2, s" peevish" 2,
  s" pernicious" 2, s" prating" 2, s" pribbling" 2, s" puking" 2, s" puny" 2,
  s" purpled" 2, s" quailing" 2, s" queasy" 2, s" rank" 2, s" reeky" 2,
  s" roguish" 2, s" roynish" 2, s" ruttish" 2, s" saucy" 2, s" sottish" 2,
  s" spleeny" 2, s" spongy" 2, s" surly" 2, s" tottering" 2, s" unmuzzled" 2,
  s" vacant" 2, s" vain" 2, s" venomed" 2, s" villainous" 2, s" waggish" 2,
  s" wanton" 2, s" warped" 2, s" wayward" 2, s" weedy" 2, s" wenching" 2,
  s" whoreson" 2, s" yeasty" 2,

72 constant #adjective2
create adjective2 s" base-court" 2, s" bat-fowling" 2, s" beef-witted" 2,
  s" beetle-headed" 2, s" boil-brained" 2, s" bunched-backed" 2,
  s" clapper-clawed" 2, s" clay-brained" 2, s" common-kissing" 2,
  s" crook-pated" 2, s" dismal-dreaming" 2, s" dizzy-eyed" 2, s" dog-hearted" 2,
  s" dread-bolted" 2, s" earth-vexing" 2, s" elf-skinned" 2,
  s" empty-hearted" 2, s" evil-eyed" 2, s" eye-offending" 2, s" fat-kidneyed" 2,
  s" fen-sucked" 2, s" flap-mouthed" 2, s" fly-bitten" 2, s" folly-fallen" 2,
  s" fool-born" 2, s" full-gorged" 2, s" guts-griping" 2, s" half-faced" 2,
  s" hasty-witted" 2, s" heavy-handed" 2, s" hedge-born" 2, s" hell-hated" 2,
  s" horn-mad" 2, s" idle-headed" 2, s" ill-breeding" 2, s" ill-composed" 2,
  s" ill-nurtured" 2, s" iron-witted" 2, s" knotty-pated" 2, s" lean-witted" 2,
  s" lily-livered" 2, s" mad-bread" 2, s" milk-livered" 2, s" motley-minded" 2,
  s" muddy-mettled" 2, s" onion-eyed" 2, s" pale-hearted" 2, s" paper-faced" 2,
  s" pinch-spotted" 2, s" plume-plucked" 2, s" pottle-deep" 2, s" pox-marked" 2,
  s" raw-boned" 2, s" reeling-ripe" 2, s" rough-hewn" 2, s" rude-growing" 2,
  s" rug-headed" 2, s" rump-fed" 2, s" shag-eared" 2, s" shard-borne" 2,
  s" sheep-biting" 2, s" shrill-gorged" 2, s" spur-galled" 2, s" sour-faced" 2,
  s" swag-bellied" 2, s" tardy-gaited" 2, s" tickle-brained" 2,
  s" toad-spotted" 2, s" unchin-snouted" 2, s" weak-hinged" 2,
  s" weather-bitten" 2, s" white-livered" 2,

73 constant #noun
create noun s" apple-john" 2, s" baggage" 2, s" barnacle" 2, s" bladder" 2,
  s" boar-pig" 2, s" bugbear" 2, s" bum-bailey" 2, s" canker-blossom" 2,
  s" clack-dish" 2, s" clotpole" 2, s" coxcomb" 2, s" codpiece" 2, s" crutch" 2,
  s" cutpurse" 2, s" death-token" 2, s" dewberry" 2, s" dogfish" 2,
  s" egg-shell" 2, s" flap-dragon" 2, s" flax-wench" 2, s" flirt-gill" 2,
  s" foot-licker" 2, s" fustilarian" 2, s" giglet" 2, s" gudgeon" 2,
  s" gull-catcher" 2, s" haggard" 2, s" harpy" 2, s" hedge-pig" 2,
  s" hempseed" 2, s" horn-beast" 2, s" hugger-mugger" 2, s" jack-a-nape" 2,
  s" jolthead" 2, s" lewdster" 2, s" lout" 2, s" maggot-pie" 2,
  s" malignancy" 2, s" malkin" 2, s" malt-worm" 2, s" mammet" 2, s" manikin" 2,
  s" measle" 2, s" minimus" 2, s" minnow" 2, s" miscreant" 2, s" moldwarp" 2,
  s" mumble-news" 2, s" nut-hook" 2, s" pantaloon" 2, s" pigeon-egg" 2,
  s" pignut" 2, s" puttock" 2, s" pumpion" 2, s" rabbit-sucker" 2,
  s" rampallion" 2, s" ratsbane" 2, s" remnant" 2, s" rudesby" 2, s" ruffian" 2,
  s" scantling" 2, s" scullion" 2, s" scut" 2, s" skainsmate" 2, s" snipe" 2,
  s" strumpet" 2, s" varlot" 2, s" vassal" 2, s" waterfly" 2, s" whey-face" 2,
  s" whipster" 2, s" wagtail" 2, s" younker" 2,

\ Return string address and length from an array of strings u1 long.
: random-word ( addr1 u1 -- addr2 u2 ) random 2 * cells + 2@ ;

\ Append u chars from srcaddr to destaddr, leaving destaddr+u on the stack.
: append-string ( destaddr srcaddr u -- destaddr+u )
  dup chars >r rot dup >r swap move r> r> + ;

\ Construct a curse in pad.
: curse ( -- pad length )
  pad s" Thou " append-string
  adjective1 #adjective1 random-word append-string s"  " append-string
  adjective2 #adjective2 random-word append-string s"  " append-string
  noun #noun random-word append-string s" !" append-string
  pad - pad swap ;

\ Write a curse and newline to output.
: print-curse ( -- ) curse type cr ;

\ Write u curses to output.
: print-curses ( u -- ) 0 do print-curse loop ;

\ Get the number of curses from command line args if given, otherwise prompt.
: get-count ( -- u )
  begin next-arg 2dup 0. d=
  if ." Number of curses: " pad 20 accept cr pad swap then
  0. 2swap >number 2drop drop
  dup 0 > if exit then again ;

\ Print 'em out.
get-count print-curses
bye
