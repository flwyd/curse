#!/bin/sh
//usr/bin/true; F=$(mktemp /tmp/curse.XXXX); rustup run nightly rustc $0 -o "$F" && "$F" "$@"; rm "$F"; exit
/*****************************************************************************
 * Shakespearian Curse Generator -- Based on lists compiled by Jerry Maguire, *
 *     English teacher at Center Grove High School in Greenwood, Indiana.     *
 * Public domain implementations by Trevor Stone http://trevorstone.org/curse *
 *****************************************************************************/

// rustup run nightly rustc curse.rs
// Need nightly until https://github.com/rust-lang/rust/issues/130703 is stable.
// Using std::random to avoid needing cargo; curse should be stdlib-only.
#![feature(random)]

use std::env::args;
use std::io;
use std::io::Write;
use std::process::exit;
use std::random::random;

// Arrays of curse components
#[rustfmt::skip]
static ADJECTIVE1: [&str; 73] = ["artless", "bawdy", "beslubbering", "bootless",
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
    "wayward", "weedy", "wenching", "whoreson", "yeasty"];
#[rustfmt::skip]
static ADJECTIVE2: [&str; 72] = ["base-court", "bat-fowling", "beef-witted",
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
    "white-livered"];
#[rustfmt::skip]
static NOUN: [&str; 73] = ["apple-john", "baggage", "barnacle", "bladder",
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
    "younker"];

// Return a random word from an array of words
fn rand_word<'a>(array: &[&'a str]) -> &'a str {
    let rand: usize = random(..); // Rust 1.98 only samples from FullRange
    array[rand % array.len()]
}

// Generate one curse
fn curse() -> String {
    let adj1 = rand_word(&ADJECTIVE1);
    let adj2 = rand_word(&ADJECTIVE2);
    let noun = rand_word(&NOUN);
    format!("Thou {adj1} {adj2} {noun}!")
}

fn main() {
    let num: u32 = match args().skip(1).next() {
        Some(arg) => match arg.parse() {
            Ok(num) => num,
            Err(_) => {
                println!(
                    "Usage: {} [-h] [n] (n is the number of curses you want)",
                    args().next().unwrap()
                );
                exit(1)
            }
        },
        None => loop {
            print!("Number of curses: ");
            let _ = io::stdout().flush();
            let mut input = String::new();
            match io::stdin().read_line(&mut input) {
                Ok(0) => exit(0), // EOF
                Ok(_) => {
                    let _: u32 = match input.trim().parse() {
                        Ok(num) => break num,
                        Err(_) => continue,
                    };
                }
                Err(error) => {
                    println!("Error reading input: {error}");
                    exit(1);
                }
            };
        },
    };
    for _ in 0..num {
        println!("{}", curse());
    }
}
