/*****************************************************************************
* Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, *
*     English teacher at Center Grove High School in Greenwood, Indiana.     *
* Public domain implementations by Trevor Stone http://trevorstone.org/curse *
*****************************************************************************/
package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

type wordList []string

// wordList's string representation is a random word from a list
func (list wordList) String() string {
	return list[rand.Intn(len(list))]
}

// lists of curse components
var (
	adjective1 = wordList([]string{"artless", "bawdy", "beslubbering", "bootless",
		"brazen", "churlish", "cockered", "clouted", "craven", "currish", "dankish",
		"dissembling", "distempered", "droning", "errant", "fawning", "fitful",
		"fobbing", "froward", "frothy", "gleeking", "gnarling", "goatish",
		"gorbellied", "greasy", "grizzled", "haughty", "hideous", "impertinent",
		"infectious", "jaded", "jarring", "knavish", "lewd", "loggerheaded",
		"lumpish", "mammering", "mangled", "mewling", "paunchy", "peevish",
		"pernicious", "prating", "pribbling", "puking", "puny", "purpled",
		"quailing", "queasy", "rank", "reeky", "roguish", "roynish", "ruttish",
		"saucy", "sottish", "spleeny", "spongy", "surly", "tottering", "unmuzzled",
		"vacant", "vain", "venomed", "villainous", "waggish", "wanton", "warped",
		"wayward", "weedy", "wenching", "whoreson", "yeasty"})
	adjective2 = wordList([]string{"base-court", "bat-fowling", "beef-witted",
		"beetle-headed", "boil-brained", "bunched-backed", "clapper-clawed",
		"clay-brained", "common-kissing", "crook-pated", "dismal-dreaming",
		"dizzy-eyed", "dog-hearted", "dread-bolted", "earth-vexing", "elf-skinned",
		"empty-hearted", "evil-eyed", "eye-offending", "fat-kidneyed", "fen-sucked",
		"flap-mouthed", "fly-bitten", "folly-fallen", "fool-born", "full-gorged",
		"guts-griping", "half-faced", "hasty-witted", "heavy-handed", "hedge-born",
		"hell-hated", "horn-mad", "idle-headed", "ill-breeding", "ill-composed",
		"ill-nurtured", "iron-witted", "knotty-pated", "lean-witted",
		"lily-livered", "mad-bread", "milk-livered", "motley-minded",
		"muddy-mettled", "onion-eyed", "pale-hearted", "paper-faced",
		"pinch-spotted", "plume-plucked", "pottle-deep", "pox-marked", "raw-boned",
		"reeling-ripe", "rough-hewn", "rude-growing", "rug-headed", "rump-fed",
		"shag-eared", "shard-borne", "sheep-biting", "shrill-gorged", "spur-galled",
		"sour-faced", "swag-bellied", "tardy-gaited", "tickle-brained",
		"toad-spotted", "unchin-snouted", "weak-hinged", "weather-bitten",
		"white-livered"})
	noun = wordList([]string{"apple-john", "baggage", "barnacle", "bladder",
		"boar-pig", "bugbear", "bum-bailey", "canker-blossom", "clack-dish",
		"clotpole", "coxcomb", "codpiece", "crutch", "cutpurse", "death-token",
		"dewberry", "dogfish", "egg-shell", "flap-dragon", "flax-wench",
		"flirt-gill", "foot-licker", "fustilarian", "giglet", "gudgeon",
		"gull-catcher", "haggard", "harpy", "hedge-pig", "hempseed", "horn-beast",
		"hugger-mugger", "jack-a-nape", "jolthead", "lewdster", "lout",
		"maggot-pie", "malignancy", "malkin", "malt-worm", "mammet", "manikin",
		"measle", "minimus", "minnow", "miscreant", "moldwarp", "mumble-news",
		"nut-hook", "pantaloon", "pigeon-egg", "pignut", "puttock", "pumpion",
		"rabbit-sucker", "rampallion", "ratsbane", "remnant", "rudesby", "ruffian",
		"scantling", "scullion", "scut", "skainsmate", "snipe", "strumpet",
		"varlot", "vassal", "waterfly", "whey-face", "whipster", "wagtail",
		"younker"})
)

// function to generate one curse
func Curse() string {
	return fmt.Sprintf("Thou %s %s %s!", adjective1, adjective2, noun)
}

func main() {
	rand.Seed(time.Now().UnixNano())
	var num int
	if len(os.Args) > 1 {
		assigned, err := fmt.Sscanf(os.Args[1], "%d", &num)
		if assigned == 0 || err != nil {
			panic(err)
		}
	} else {
		fmt.Print("Number of curses: ")
		assigned, err := fmt.Scanf("%d", &num)
		if assigned == 0 || err != nil {
			panic(err)
		}
	}
	for i := 0; i < num; i++ {
		fmt.Println(Curse())
	}
}
