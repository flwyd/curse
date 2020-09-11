#!/usr/bin/env zsh
##############################################################################
# Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, #
#     English teacher at Center Grove High School in Greenwood, Indiana.     #
# Public domain implementations by Trevor Stone http://trevorstone.org/curse #
##############################################################################

# Define arrays of words
adjective1=(artless bawdy beslubbering bootless brazen churlish cockered \
  clouted craven currish dankish dissembling distempered droning errant \
  fawning fitful fobbing froward frothy gleeking gnarling goatish gorbellied \
  greasy grizzled haughty hideous impertinent infectious jaded jarring knavish \
  lewd loggerheaded lumpish mammering mangled mewling paunchy peevish \
  pernicious prating pribbling puking puny purpled quailing queasy rank reeky \
  roguish roynish ruttish saucy sottish spleeny spongy surly tottering \
  unmuzzled vacant vain venomed villainous waggish wanton warped wayward weedy \
  wenching whoreson yeasty)

adjective2=(base-court bat-fowling beef-witted beetle-headed boil-brained \
  bunched-backed clapper-clawed clay-brained common-kissing crook-pated \
  dismal-dreaming dizzy-eyed dog-hearted dread-bolted earth-vexing elf-skinned \
  empty-hearted evil-eyed eye-offending fat-kidneyed fen-sucked flap-mouthed \
  fly-bitten folly-fallen fool-born full-gorged guts-griping half-faced \
  hasty-witted heavy-handed hedge-born hell-hated horn-mad idle-headed \
  ill-breeding ill-composed ill-nurtured iron-witted knotty-pated lean-witted \
  lily-livered mad-bread milk-livered motley-minded muddy-mettled onion-eyed \
  pale-hearted paper-faced pinch-spotted plume-plucked pottle-deep pox-marked \
  raw-boned reeling-ripe rough-hewn rude-growing rug-headed rump-fed \
  shag-eared shard-borne sheep-biting shrill-gorged spur-galled sour-faced \
  swag-bellied tardy-gaited tickle-brained toad-spotted unchin-snouted \
  weak-hinged weather-bitten white-livered)

noun=(apple-john baggage barnacle bladder boar-pig bugbear bum-bailey \
  canker-blossom clack-dish clotpole coxcomb codpiece crutch cutpurse \
  death-token dewberry dogfish egg-shell flap-dragon flax-wench flirt-gill \
  foot-licker fustilarian giglet gudgeon gull-catcher haggard harpy hedge-pig \
  hempseed horn-beast hugger-mugger jack-a-nape jolthead lewdster lout \
  maggot-pie malignancy malkin malt-worm mammet manikin measle minimus minnow \
  miscreant moldwarp mumble-news nut-hook pantaloon pigeon-egg pignut puttock \
  pumpion rabbit-sucker rampallion ratsbane remnant rudesby ruffian scantling \
  scullion scut skainsmate snipe strumpet varlot vassal waterfly whey-face \
  whipster wagtail younker)

# Sets $_word to a random selection of the function's arguments.
function randomword() {
  _word=$*[$(($RANDOM % $#* + 1))]
}

# Prints a random curse
function curse() {
  local a1 a2 n
  randomword $adjective1
  a1=$_word
  randomword $adjective2
  a2=$_word
  randomword $noun
  n=$_word
  echo "Thou $a1 $a2 $n!"
}

if [[ $#* == 0 ]]; then
  # No command line args, prompt for number of curses
  read "count?Number of curses: "
else
  count=$1
fi

# Print 'em out!
repeat $count do
  curse
done
