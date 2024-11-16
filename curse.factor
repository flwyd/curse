#!/usr/bin/env factor
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, !
!     English teacher at Center Grove High School in Greenwood, Indiana.     !
! Public domain implementations by Trevor Stone http://trevorstone.org/curse !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

USING: command-line io kernel make math math.parser random sequences ;
IN: curse

! The next three words are arrays of curse components.

: adjective1 ( -- quot ) [ "artless" "bawdy" "beslubbering" "bootless" "brazen"
  "churlish" "cockered" "clouted" "craven" "currish" "dankish" "dissembling"
  "distempered" "droning" "errant" "fawning" "fitful" "fobbing" "froward"
  "frothy" "gleeking" "gnarling" "goatish" "gorbellied" "greasy" "grizzled"
  "haughty" "hideous" "impertinent" "infectious" "jaded" "jarring" "knavish"
  "lewd" "loggerheaded" "lumpish" "mammering" "mangled" "mewling" "paunchy"
  "peevish" "pernicious" "prating" "pribbling" "puking" "puny" "purpled"
  "quailing" "queasy" "rank" "reeky" "roguish" "roynish" "ruttish" "saucy"
  "sottish" "spleeny" "spongy" "surly" "tottering" "unmuzzled" "vacant" "vain"
  "venomed" "villainous" "waggish" "wanton" "warped" "wayward" "weedy"
  "wenching" "whoreson" "yeasty" ] ;

: adjective2 ( -- quot ) [ "base-court" "bat-fowling" "beef-witted"
  "beetle-headed" "boil-brained" "bunched-backed" "clapper-clawed"
  "clay-brained" "common-kissing" "crook-pated" "dismal-dreaming" "dizzy-eyed"
  "dog-hearted" "dread-bolted" "earth-vexing" "elf-skinned" "empty-hearted"
  "evil-eyed" "eye-offending" "fat-kidneyed" "fen-sucked" "flap-mouthed"
  "fly-bitten" "folly-fallen" "fool-born" "full-gorged" "guts-griping"
  "half-faced" "hasty-witted" "heavy-handed" "hedge-born" "hell-hated"
  "horn-mad" "idle-headed" "ill-breeding" "ill-composed" "ill-nurtured"
  "iron-witted" "knotty-pated" "lean-witted" "lily-livered" "mad-bread"
  "milk-livered" "motley-minded" "muddy-mettled" "onion-eyed" "pale-hearted"
  "paper-faced" "pinch-spotted" "plume-plucked" "pottle-deep" "pox-marked"
  "raw-boned" "reeling-ripe" "rough-hewn" "rude-growing" "rug-headed" "rump-fed"
  "shag-eared" "shard-borne" "sheep-biting" "shrill-gorged" "spur-galled"
  "sour-faced" "swag-bellied" "tardy-gaited" "tickle-brained" "toad-spotted"
  "unchin-snouted" "weak-hinged" "weather-bitten" "white-livered" ] ;

: noun ( -- quot ) [ "apple-john" "baggage" "barnacle" "bladder" "boar-pig"
  "bugbear" "bum-bailey" "canker-blossom" "clack-dish" "clotpole" "coxcomb"
  "codpiece" "crutch" "cutpurse" "death-token" "dewberry" "dogfish"
  "egg-shell" "flap-dragon" "flax-wench" "flirt-gill" "foot-licker"
  "fustilarian" "giglet" "gudgeon" "gull-catcher" "haggard" "harpy"
  "hedge-pig" "hempseed" "horn-beast" "hugger-mugger" "jack-a-nape"
  "jolthead" "lewdster" "lout" "maggot-pie" "malignancy" "malkin" "malt-worm"
  "mammet" "manikin" "measle" "minimus" "minnow" "miscreant" "moldwarp"
  "mumble-news" "nut-hook" "pantaloon" "pigeon-egg" "pignut" "puttock"
  "pumpion" "rabbit-sucker" "rampallion" "ratsbane" "remnant" "rudesby"
  "ruffian" "scantling" "scullion" "scut" "skainsmate" "snipe" "strumpet"
  "varlot" "vassal" "waterfly" "whey-face" "whipster" "wagtail" "younker" ] ;

! Returns a random curse as a string.
: curse ( -- str ) [ "Thou " %
  adjective1 random % " " % adjective2 random % " " % noun random %
  "!" % ] "" make ;

! Get a count of curses from the command line or user input.
(command-line) length 2 >
[ (command-line) last ] [ "Number of curses: " write flush readln ] if
! Print 'em out.
string>number <iota> [ drop curse print ] each
