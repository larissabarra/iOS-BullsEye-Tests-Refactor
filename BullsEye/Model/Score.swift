enum PerfectionLevel: Int {
  case perfect
  case almost
  case good
  case bad
}

struct Score {
  let score: Int
  let perfection: PerfectionLevel
}
