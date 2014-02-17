/*****************************************************************************
* Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, *
*     English teacher at Center Grove High School in Greenwood, Indiana.     *
* Public domain implementations by Trevor Stone http://trevorstone.org/curse *
*****************************************************************************/
#include <iostream>
#include <iterator>
#include <stdlib.h>
#include <string>
#include <vector>

using namespace std;

// components of curses
const int NUMADJECTIVE1 = 73;  // because C doesn't keep track
string adjective1[NUMADJECTIVE1] = { "artless", "bawdy", "beslubbering",
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

const int NUMADJECTIVE2 = 72;
string adjective2[NUMADJECTIVE2] = { "base-court", "bat-fowling", "beef-witted",
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

const int NUMNOUN = 73;
string noun[NUMNOUN] = { "apple-john", "baggage", "barnacle", "bladder",
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

// << operator prints a random word from the list
class WordList {
  public:
    WordList(int size, string* words);
  private:
    int size;
    string* words;
    friend ostream& operator<<(ostream& out, const WordList& me);
};

// << operator prints a random curse
class Curse {
  public:
    Curse(void);
    void curse(int n, ostream& out);
 private:
   int numlists;
   vector<WordList*> lists;
   friend ostream& operator<<(ostream& out, const Curse& me);
};

WordList::WordList(int _size, string* _words) : size(_size), words(_words) {
  return;
}

Curse::Curse(void) : numlists(3), lists() {
  numlists = 3;
  lists.reserve(3);
  lists.push_back(new WordList(NUMADJECTIVE1, adjective1));
  lists.push_back(new WordList(NUMADJECTIVE2, adjective2));
  lists.push_back(new WordList(NUMNOUN, noun));
}

ostream& operator << (ostream& out, const WordList& words) {
  out << words.words[random() % words.size];
  return out;
}

ostream& operator << (ostream& out, const Curse& curse) {
  out << "Thou";
  for (vector<WordList*>::const_iterator iter = curse.lists.begin();
      iter < curse.lists.end(); ++iter) {
    out << " ";
    out << **iter;
  }
  out << "!\n";
  return out;
}

// print n curses
void curse(int n, ostream &out) {
  Curse curse;
  for (int i = 0; i < n; ++i) {
    out << curse;
  }
}

/* curse n prints n curses, if no arguments specified will prompt user */
int main(int argc, char* argv[]) {
  srandom(time(0));
  int n = 0;
  if (argc == 1) {
    cout << "Number of curses: ";
    cin >> n;
  } else {
    n = atoi(argv[1]);
  }
  curse(n, cout);
  return 0;
}
