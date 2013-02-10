#!/usr/bin/python -t

"""Trevor Stone's random signature script."""

from __future__ import with_statement
import random
import os
import sys

def randline(filename, *filters):
  with open(filename) as f:
    seen = 0
    choice = ''
    for line in f:
      line = line.rstrip() #always remove newline and trailing spaces
      for filter in filters:
        line = filter(line)
        if not line:
          break
      if not line:
        continue #because we can't continue to an outer loop
      seen += 1
      if random.randrange(0, seen) == 0:
        choice = line
    return choice

def linebreak(s, width):
  s = s.rstrip()
  lines = []
  while len(s) > width:
    attribIndex = s.rfind('--')
    if attribIndex > 0 and len(s) - attribIndex <= width and attribIndex <= width:
      lines.append(s[:attribIndex].rstrip())
      lines.append(s[attribIndex:].strip())
      s = ''
    else:
      i = width
      while not s[i].isspace():
        i -= 1
      line = s[:i].rstrip()
      s = s[i+1:].lstrip()
      attribIndex = s.rfind('--')
      if line.endswith('--'):
        line = line[:len(line)-2]
        s = '-- ' + s
      lines.append(line)
  if s:
    lines.append(s.rstrip())
  return lines

def justify(a, b, width): # doesn't wrap lines!
  if len(a) + len(b) >= width:
    return a + ' ' + b
  return a + b.rjust(width - len(a))

class WordList:  # provides random words from a list via string conversion
  def __init__(self, items):
    self.items = items

  def one(self):
    return random.choice(self.items)

# one-word adjectives
adjective1 = WordList(('artless', 'bawdy', 'beslubbering', 'bootless', 'brazen',
  'churlish', 'cockered', 'clouted', 'craven', 'currish', 'dankish',
  'dissembling', 'distempered', 'droning', 'errant', 'fawning', 'fitful',
  'fobbing', 'froward', 'frothy', 'gleeking', 'gnarling', 'goatish',
  'gorbellied', 'greasy', 'grizzled', 'haughty', 'hideous', 'impertinent',
  'infectious', 'jaded', 'jarring', 'knavish', 'lewd', 'loggerheaded',
  'lumpish', 'mammering', 'mangled', 'mewling', 'paunchy', 'peevish',
  'pernicious', 'prating', 'pribbling', 'puking', 'puny', 'purpled',
  'quailing', 'queasy', 'rank', 'reeky', 'roguish', 'roynish', 'ruttish',
  'saucy', 'sottish', 'spleeny', 'spongy', 'surly', 'tottering', 'unmuzzled',
  'vacant', 'vain', 'venomed', 'villainous', 'waggish', 'wanton', 'warped',
  'wayward', 'weedy', 'wenching', 'whoreson', 'yeasty'))

# hyphenated adjectives
adjective2 = WordList(('base-court', 'bat-fowling', 'beef-witted',
  'beetle-headed', 'boil-brained', 'bunched-backed', 'clapper-clawed',
  'clay-brained', 'common-kissing', 'crook-pated', 'dismal-dreaming',
  'dizzy-eyed', 'dog-hearted', 'dread-bolted', 'earth-vexing', 'elf-skinned',
  'empty-hearted', 'evil-eyed', 'eye-offending', 'fat-kidneyed', 'fen-sucked',
  'flap-mouthed', 'fly-bitten', 'folly-fallen', 'fool-born', 'full-gorged',
  'guts-griping', 'half-faced', 'hasty-witted', 'heavy-handed', 'hedge-born',
  'hell-hated', 'horn-mad', 'idle-headed', 'ill-breeding', 'ill-composed',
  'ill-nurtured', 'iron-witted', 'knotty-pated', 'lean-witted',
  'lily-livered', 'mad-bread', 'milk-livered', 'motley-minded',
  'muddy-mettled', 'onion-eyed', 'pale-hearted', 'paper-faced',
  'pinch-spotted', 'plume-plucked', 'pottle-deep', 'pox-marked', 'raw-boned',
  'reeling-ripe', 'rough-hewn', 'rude-growing', 'rug-headed', 'rump-fed',
  'shag-eared', 'shard-borne', 'sheep-biting', 'shrill-gorged', 'spur-galled',
  'sour-faced', 'swag-bellied', 'tardy-gaited', 'tickle-brained',
  'toad-spotted', 'unchin-snouted', 'weak-hinged', 'weather-bitten',
  'white-livered'))

# nouns
noun = WordList(('apple-john', 'baggage', 'barnacle', 'bladder', 'boar-pig',
  'bugbear', 'bum-bailey', 'canker-blossom', 'clack-dish', 'clotpole',
  'coxcomb', 'codpiece', 'crutch', 'cutpurse', 'death-token', 'dewberry',
  'dogfish', 'egg-shell', 'flap-dragon', 'flax-wench', 'flirt-gill',
  'foot-licker', 'fustilarian', 'giglet', 'gudgeon', 'gull-catcher',
  'haggard', 'harpy', 'hedge-pig', 'hempseed', 'hedge-pig', 'horn-beast',
  'hugger-mugger', 'jack-a-nape', 'jolthead', 'lewdster', 'lout',
  'maggot-pie', 'malignancy', 'malkin', 'malt-worm', 'mammet', 'manikin',
  'measle', 'minimus', 'minnow', 'miscreant', 'moldwarp', 'mumble-news',
  'nut-hook', 'pantaloon', 'pigeon-egg', 'pignut', 'puttock', 'pumpion',
  'rabbit-sucker', 'rampallion', 'ratsbane', 'remnant', 'rudesby', 'ruffian',
  'scantling', 'scullion', 'scut', 'skainsmate', 'snipe', 'strumpet',
  'varlot', 'vassal', 'waterfly', 'whey-face', 'whipster', 'wagtail',
  'younker'))

lists = (adjective1, adjective2, noun)

def curse():
  return 'Thou %s!' % ' '.join([w.one() for w in lists])

def siteAndCurse(width):
  websites = ['http://trevorstone.org/', 'http://flwyd.livejournal.com/',
    'http://twitter.com/flwyd', 'http://profiles.google.com/trevorstone']
  while True:
    website = random.choice(websites)
    s = justify(website, curse(), width) 
    if len(s) <= width:
      return s

def commentFilter(s):
  return None if len(s) == 0 or s[0] == '#' else s

def embraceAndDoit(oneliners, width):
  toembrace = [ 'adaptation', 'art', 'beauty', 'chaos', 'change', 'choice',
    'community', 'creativity', 'culture', 'curiosity', 'discovery',
    'diversity', 'excitement', 'expression', 'existence', 'family',
    'flow', 'friendship', 'inspiration', 'joy', 'laughter', 'metaphor',
    'love', 'novelty', 'oddity', 'principle', 'self', 'singularity',
    'solitude', 'spontaneity', 'surprise', 'wildness', 'wonder' ]
  while True:
    embrace = '{embrace %s}' % random.choice(toembrace)
    doit = randline(oneliners, commentFilter)
    s = justify(embrace, doit, width)
    if len(s) <= width:
      return s

if __name__ == '__main__':
  width = 71
  quotefiles = ['~/lib/doitoneliners.txt', '~/lib/oneliners.txt']
  quotefiles = [os.path.expanduser(p) for p in quotefiles]

  print ''
  print '-- '
  print '=-=-=-= Trevor Stone -=- [Flwyd] -=- <tstone @ trevorstone.org> =-=-=-='
  print 'Computer science, eclectic philosophy, games, wits, esoterics, odd hats'
  print siteAndCurse(width)
  print embraceAndDoit(quotefiles[0], width)
  print '\n'.join(linebreak(randline(quotefiles[1], commentFilter), width))
