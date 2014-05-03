01 REM Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire,
02 REM English teacher at Center Grove High School in Greenwood, Indiana.
03 REM Public domain implementations by Trevor Stone http://trevorstone.org/curse

10 DATA artless, bawdy, beslubbering, bootless, brazen, churlish, cockered, clouted, craven, currish, dankish, dissembling, distempered, droning, errant, fawning, fitful, fobbing, froward, frothy, gleeking, gnarling, goatish, gorbellied, greasy, grizzled, haughty, hideous, impertinent, infectious, jaded, jarring, knavish, lewd, loggerheaded, lumpish, mammering, mangled, mewling, paunchy, peevish, pernicious, prating, pribbling, puking, puny, purpled, quailing, queasy, rank, reeky, roguish, roynish, ruttish, saucy, sottish, spleeny, spongy, surly, tottering, unmuzzled, vacant, vain, venomed, villainous, waggish, wanton, warped, wayward, weedy, wenching, whoreson, yeasty
11 LET AJ1% = 73

20 DATA base-court, bat-fowling, beef-witted, beetle-headed, boil-brained, bunched-backed, clapper-clawed, clay-brained, common-kissing, crook-pated, dismal-dreaming, dizzy-eyed, dog-hearted, dread-bolted, earth-vexing, elf-skinned, empty-hearted, evil-eyed, eye-offending, fat-kidneyed, fen-sucked, flap-mouthed, fly-bitten, folly-fallen, fool-born, full-gorged, guts-griping, half-faced, hasty-witted, heavy-handed, hedge-born, hell-hated, horn-mad, idle-headed, ill-breeding, ill-composed, ill-nurtured, iron-witted, knotty-pated, lean-witted, lily-livered, mad-bread, milk-livered, motley-minded, muddy-mettled, onion-eyed, pale-hearted, paper-faced, pinch-spotted, plume-plucked, pottle-deep, pox-marked, raw-boned, reeling-ripe, rough-hewn, rude-growing, rug-headed, rump-fed, shag-eared, shard-borne, sheep-biting, shrill-gorged, spur-galled, sour-faced, swag-bellied, tardy-gaited, tickle-brained, toad-spotted, unchin-snouted, weak-hinged, weather-bitten, white-livered
21 LET AJ2% = 72

30 DATA apple-john, baggage, barnacle, bladder, boar-pig, bugbear, bum-bailey, canker-blossom, clack-dish, clotpole, coxcomb, codpiece, crutch, cutpurse, death-token, dewberry, dogfish, egg-shell, flap-dragon, flax-wench, flirt-gill, foot-licker, fustilarian, giglet, gudgeon, gull-catcher, haggard, harpy, hedge-pig, hempseed, horn-beast, hugger-mugger, jack-a-nape, jolthead, lewdster, lout, maggot-pie, malignancy, malkin, malt-worm, mammet, manikin, measle, minimus, minnow, miscreant, moldwarp, mumble-news, nut-hook, pantaloon, pigeon-egg, pignut, puttock, pumpion, rabbit-sucker, rampallion, ratsbane, remnant, rudesby, ruffian, scantling, scullion, scut, skainsmate, snipe, strumpet, varlot, vassal, waterfly, whey-face, whipster, wagtail, younker
31 LET NO1% = 73

40 DIM AJ1$(AJ1%): DIM AJ2$(AJ2%): DIM NO1$(NO1%)
50 FOR I = 1 TO AJ1%: READ AJ1$(I): NEXT
60 FOR I = 1 TO AJ2%: READ AJ2$(I): NEXT
70 FOR I = 1 TO NO1%: READ NO1$(I): NEXT

80 DEF FN IR(L) = RND(1) * L + 1

100 INPUT "Number of curses"; NC%
110 FOR I = 1 TO NC%
120 PRINT "Thou " AJ1$(FN IR(AJ1%)) " " AJ2$(FN IR(AJ2%)) " " NO1$(FN IR(NO1%)) "!"
130 NEXT
