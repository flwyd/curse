/*****************************************************************************
* Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, *
*     English teacher at Center Grove High School in Greenwood, Indiana.     *
* Public domain implementations by Trevor Stone http://trevorstone.org/curse *
*****************************************************************************/
#include <stdlib.h>
#include <stdio.h>

#define NUMADJECTIVE1 73  /* because C doesn't keep track */
char* adjective1[NUMADJECTIVE1] = { "artless", "bawdy", "beslubbering",
    "bootless", "brazen", "churlish", "cockered", "clouted", "craven",
    "currish", "dankish", "dissembling", "distempered", "droning", "errant",
    "fawning", "fitful", "fobbing", "froward", "frothy", "gleeking", "gnarling",
    "goatish", "gorbellied", "greasy", "grizzled", "haughty", "hideous",
    "impertinent", "infectious", "jaded", "jarring", "knavish", "lewd",
    "loggerheaded", "lumpish", "mammering", "mangled", "mewling", "paunchy",
    "peevish", "pernicious", "prating", "pribbling", "puking", "puny",
    "purpled", "quailing", "queasy", "rank", "reeky", "roguish", "roynish",
    "ruttish", "saucy", "sottish", "spleeny", "spongy", "surly", "tottering",
    "unmuzzled", "vacant", "vain", "venomed", "villainous", "waggish", "wanton",
    "warped", "wayward", "weedy", "wenching", "whoreson", "yeasty" };

#define NUMADJECTIVE2 72
char* adjective2[NUMADJECTIVE2] = { "base-court", "bat-fowling", "beef-witted",
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
    "white-livered" };

#define NUMNOUN 73
char* noun[NUMNOUN] = { "apple-john", "baggage", "barnacle", "bladder",
    "boar-pig", "bugbear", "bum-bailey", "canker-blossom", "clack-dish",
    "clotpole", "coxcomb", "codpiece", "crutch", "cutpurse", "death-token",
    "dewberry", "dogfish", "egg-shell", "flap-dragon", "flax-wench",
    "flirt-gill", "foot-licker", "fustilarian", "giglet", "gudgeon",
    "gull-catcher", "haggard", "harpy", "hedge-pig", "hempseed",
    "horn-beast", "hugger-mugger", "jack-a-nape", "jolthead", "lewdster",
    "lout", "maggot-pie", "malignancy", "malkin", "malt-worm", "mammet",
    "manikin", "measle", "minimus", "minnow", "miscreant", "moldwarp",
    "mumble-news", "nut-hook", "pantaloon", "pigeon-egg", "pignut", "puttock",
    "pumpion", "rabbit-sucker", "rampallion", "ratsbane", "remnant", "rudesby",
    "ruffian", "scantling", "scullion", "scut", "skainsmate", "snipe",
    "strumpet", "varlot", "vassal", "waterfly", "whey-face", "whipster",
    "wagtail", "younker" };

/* Pick a random word from a list */
char* word(char** array, int num) {
  return array[random() % num];
}

/* Print n curses */
void curse(int n, FILE *stream) {
  while (n-- > 0) {
    fprintf(stream, "Thou %s %s %s!\n", word(adjective1, NUMADJECTIVE1),
        word(adjective2, NUMADJECTIVE2), word(noun, NUMNOUN));
  }
}

/* curse n will print n curses.  Without argument, prompts the user */
int main(int argc, char* argv[]) {
  srandom(time(0));
  int n = 0;
  if (argc == 1) {
    printf("Number of curses: ");
    scanf("%d", &n);
  } else {
    n = atoi(argv[1]);
  }
  curse(n, stdout);
  return 0;
}
