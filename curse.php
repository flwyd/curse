<?php
##############################################################################
# Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, #
#     English teacher at Center Grove High School in Greenwood, Indiana.     #
#          Programmed in PHP by tstone(Trevor Stone)@trevorstone.org         #
#                    This script is in the public domain.                    #
##############################################################################

# The following arrays contain the data for the curses

$adjective1 = array( 'artless', 'bawdy', 'beslubbering', 'bootless',
  'brazen', 'churlish', 'cockered', 'clouted', 'craven', 'currish',
  'dankish', 'dissembling', 'distempered', 'droning', 'errant', 'fawning',
  'fitful', 'fobbing', 'froward', 'frothy', 'gleeking', 'gnarling',
  'goatish', 'gorbellied', 'greasy', 'grizzled', 'haughty', 'hideous',
  'impertinent', 'infectious', 'jaded', 'jarring', 'knavish', 'lewd',
  'loggerheaded', 'lumpish', 'mammering', 'mangled', 'mewling', 'paunchy',
  'peevish', 'pernicious', 'prating', 'pribbling', 'puking', 'puny',
  'purpled', 'quailing', 'queasy', 'rank', 'reeky', 'roguish', 'roynish',
  'ruttish', 'saucy', 'sottish', 'spleeny', 'spongy', 'surly', 'tottering',
  'unmuzzled', 'vacant', 'vain', 'venomed', 'villainous', 'waggish',
  'wanton', 'warped', 'wayward', 'weedy', 'wenching', 'whoreson', 'yeasty');

$adjective2 = array( 'base-court', 'bat-fowling', 'beef-witted',
  'beetle-headed', 'boil-brained', 'bunched-backed', 'clapper-clawed',
  'clay-brained', 'common-kissing', 'crook-pated', 'dismal-dreaming',
  'dizzy-eyed', 'dog-hearted', 'dread-bolted', 'earth-vexing',
  'elf-skinned', 'empty-hearted', 'evil-eyed', 'eye-offending',
  'fat-kidneyed', 'fen-sucked', 'flap-mouthed', 'fly-bitten',
  'folly-fallen', 'fool-born', 'full-gorged', 'guts-griping', 'half-faced',
  'hasty-witted', 'heavy-handed', 'hedge-born', 'hell-hated', 'horn-mad',
  'idle-headed', 'ill-breeding', 'ill-composed', 'ill-nurtured',
  'iron-witted', 'knotty-pated', 'lean-witted', 'lily-livered', 'mad-bread',
  'milk-livered', 'motley-minded', 'muddy-mettled', 'onion-eyed',
  'pale-hearted', 'paper-faced', 'pinch-spotted', 'plume-plucked',
  'pottle-deep', 'pox-marked', 'raw-boned', 'reeling-ripe', 'rough-hewn',
  'rude-growing', 'rug-headed', 'rump-fed', 'shag-eared', 'shard-borne',
  'sheep-biting', 'shrill-gorged', 'spur-galled', 'sour-faced',
  'swag-bellied', 'tardy-gaited', 'tickle-brained', 'toad-spotted',
  'unchin-snouted', 'weak-hinged', 'weather-bitten', 'white-livered');

$noun = array( 'apple-john', 'baggage', 'barnacle', 'bladder', 'boar-pig',
  'bugbear', 'bum-bailey', 'canker-blossom', 'clack-dish', 'clotpole',
  'coxcomb', 'codpiece', 'crutch', 'cutpurse', 'death-token', 'dewberry',
  'dogfish', 'egg-shell', 'flap-dragon', 'flax-wench', 'flirt-gill',
  'foot-licker', 'fustilarian', 'giglet', 'gudgeon', 'gull-catcher',
  'haggard', 'harpy', 'hedge-pig', 'hempseed', 'hedge-pig', 'horn-beast',
  'hugger-mugger', 'jack-a-nape', 'jolthead', 'lewdster', 'lout',
  'maggot-pie', 'malignancy', 'malkin', 'malt-worm', 'mammet', 'manikin',
  'measle', 'minimus', 'minnow', 'miscreant', 'moldwarp', 'mumble-news',
  'nut-hook', 'pantaloon', 'pigeon-egg', 'pignut', 'puttock', 'pumpion',
  'rabbit-sucker', 'rampallion', 'ratsbane', 'remnant', 'rudesby',
  'ruffian', 'scantling', 'scullion', 'scut', 'skainsmate', 'snipe',
  'strumpet', 'varlot', 'vassal', 'waterfly', 'whey-face', 'whipster',
  'wagtail', 'younker');

$number = 0;
if (is_numeric($_REQUEST['number'])) {  # curse.php?number=42
	$number = $_REQUEST['number'];
} else if (is_numeric($_SERVER['QUERY_STRING'])) {  # curse.php?42
	$number = $_SERVER['QUERY_STRING'];
}
$number %= 500000;  # prevent really absurd requests

if (!headers_sent()) {
	header("Content-type: text/html");
	header("Pragma: no-cache");
}

echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"';
echo ' "http://www.w3.org/TR/REC-html40/loose.dtd">';
echo "<html><head><title>$number Curses</title>\n";
echo "<style type='text/css'>\n body { background-color: white; color: black }\n</style></head>\n<body><h1>$number Curses</h1>\n";
 
for ($curses = 0; $curses < $number; $curses++) {
	echo "Thou ". $adjective1[array_rand($adjective1)] ." ". $adjective2[array_rand($adjective2)] ." ". $noun[array_rand($noun)],"!<br>\n";
}

echo "<hr><form action='$_SERVER[SCRIPT_NAME]' method=GET>\n";
echo "<input type=text name='number' size='5' value='$number'> ";
echo "<input type=submit value='More Curses!'>\n";
echo "</form><br>\n";
echo "<a href='http://trevorstone.org/curse/'>Back to the Elizabethan Curse Generator</a>\n";
echo "</body></html>";
?>
